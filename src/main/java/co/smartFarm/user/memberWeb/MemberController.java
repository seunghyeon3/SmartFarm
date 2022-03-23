package co.smartFarm.user.memberWeb;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.SecureRandom;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.smartFarm.auction.aucnService.AucnService;
import co.smartFarm.auction.aucnService.BidHistoryVO;
import co.smartFarm.auction.aucnWeb.AucnController;
import co.smartFarm.grow.growDiaryService.GrowDiaryService;
import co.smartFarm.grow.growDiaryService.GrowDiaryVO;
import co.smartFarm.prj.EthResultVO;
import co.smartFarm.security.CustomUserDetailsService;
import co.smartFarm.user.memberService.MemberService;
import co.smartFarm.user.memberService.MemberVO;

@Controller
//220302 PSH UserController -> MemberController로 수정
public class MemberController {

	@Autowired
	// 220302 PSH MemberMapper에서 아래 내용오르 수정
	MemberService memberDao;

	@Autowired
	// 220302 PSH MypageController -> MemberController 구분 작업
	GrowDiaryService growDiaryDao;

	@Autowired
	AucnService aucnDao;
	
	@Autowired
	AucnController aucnDa;

	//220315 PSH 비밀번호 암호화
	BCryptPasswordEncoder bcryp = new BCryptPasswordEncoder(16);
	@Autowired
	CustomUserDetailsService cuds;
	// 마이페이지 경로
	// 220302 PSH MypageController -> MemberController 구분 작업
	@RequestMapping("/mypage.do")
	@ResponseBody
	public boolean mypage(@RequestParam("pass") String pass) {
		MemberVO memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String Ypass = memberVo.getMem_pw();
		if(bcryp.matches(pass, Ypass)) {
			return true;
		}else {
		return false;
		}
	}
	@RequestMapping("/mypageOk.do")
	public String mypage() {
		return "user/mypage";
	}
	// 재배내역 팝업창 클릭시 회원 재배내역 표출
	// 220302 PSH MypageController -> MemberController 구분 작업
	@RequestMapping("cultivationHistory.do")
	@ResponseBody
	public List<GrowDiaryVO> cultivationHistory() {
		MemberVO memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return growDiaryDao.growDiaryMyList(memberVo.getMem_email());
	}

	//입찰내역 팝업창 클릭시 입찰내역 표출
	@RequestMapping("/bidHistory.do")
	@ResponseBody
	public List<BidHistoryVO> bidHistory() {
		MemberVO memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return aucnDao.bidHistoryList(memberVo.getMem_email());
	}
	
	//출금버튼 누르면 입찰내역 삭제
	@RequestMapping("/withdraw.do")
	@ResponseBody
	public int withdraw(@RequestParam(value="bidHistoryNo") int bidHistoryNo) {
		
		return aucnDao.bidHistoryDelete(bidHistoryNo);
	}
	// ===== 로그인 =====
	// 로그인창으로 이동
	@RequestMapping("/login.do")
	public String login() {
		return "user/login";
	}
	//220321 PSH 로그인 실패를 위해 추가
	@RequestMapping("/loginfail.do")
	public String loginfail() {
		return "redirect:/login.do?error=1";
	}

	//220315 PSH Spring Security로 인한 주석
	// 로그인 체크
	/*
	 * @PostMapping("/loginCheck.do") public String loginCheck(MemberVO memberVo,
	 * Model model, HttpSession session) {
	 * System.out.println(memberVo.getMem_email());
	 * memberVo.setMem_pw(bcryp.encode(memberVo.getMem_pw())); MemberVO resultVo =
	 * memberDao.loginCheck(memberVo);
	 * 
	 * if (resultVo != null) {// 이메일 조회했는데 리턴값 있음
	 * 
	 * // 비번 일치하는 경우 if (resultVo.getMem_pw().equals(memberVo.getMem_pw())) {
	 * 
	 * session.setAttribute("member", resultVo);
	 * 
	 * // 페이지 이동 if (resultVo.getMem_athr().equals("B0")) {// 관리자인 경우 : 관리자 페이지로 이동
	 * System.out.println("관리자 로그인"); return "redirect:/admin/adminHome.do";
	 * 
	 * } else if (resultVo.getMem_athr().equals("B2")) {// 농부인 경우 : 관리 페이지로 이동
	 * System.out.println("농부 로그인"); return "redirect:/grow.do";
	 * 
	 * } else {// 일반회원인 경우 : 홈으로 이동 System.out.println("일반회원 로그인"); return
	 * "redirect:/home.do";
	 * 
	 * } } else { // 비밀번호 불일치 model.addAttribute("error", "비밀번호를 확인해주세요"); return
	 * "user/login"; }
	 * 
	 * } else { // 이메일 조회했는데 리턴값 없음 System.out.println("로그인 실패");
	 * model.addAttribute("error", "아이디를 확인해주세요"); return "user/login"; }
	 * 
	 * }
	 */

	// ===== 로그아웃 =====
	@RequestMapping("/logout.do")
	public String logout() {
		//session.invalidate(); // 세션의 모든 속성을 삭제
		return "redirect:/home.do";
	}

	// ===== 회원가입 =====
	// 회원가입창으로 이동
	@RequestMapping("/register.do")
	public String register(Model model, HttpServletRequest request) throws IOException {
		String test = request.getServletContext().getRealPath("resources/register/agreement.txt");

		Path path = Paths.get(test);
		List<String> lines = java.nio.file.Files.readAllLines(path);
		model.addAttribute("pInfo", lines);
		// System.out.println(lines);
		return "user/register";
	}

	// 회원가입 입력
	@PostMapping("/memberInsert.do")
	@ResponseBody
	public String memberInsert(@RequestBody MemberVO memberVo) {
		System.out.println("=========");
		System.out.println("확인!!!! === " + memberVo.getMem_email());
		System.out.println(memberVo.getMem_det_addr());
		System.out.println(memberVo.getMem_addr());
		//220315 PSH password 암호화
		memberVo.setMem_pw(bcryp.encode(memberVo.getMem_pw())); 
		memberDao.memberInsert(memberVo);
		return "1";
	}

	// 회원정보 수정
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO memberVo) {
		memberDao.memberUpdate(memberVo);
		//session.invalidate();
		return "redirect:logout.do";
	}
	
	// 회원탈퇴
	@RequestMapping("/memberDelete.do")
	public String memberDelete() {
		MemberVO memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberDao.memberDelete(memberVo.getMem_email());
		//session.invalidate(); // 세션의 모든 속성을 삭제
		return "redirect:logout.do";
	}
	
	// 회원농부신청
	@RequestMapping("/memberFarmer.do")
	public String memberFarmer(MemberVO memberVo) {
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberVo.setMem_email(userDetails.getUsername());
		memberDao.memberUpdateFarmer(memberVo);
		return "redirect:logout.do";
	}
	
	// 이메일 체크 + 카카오 로그인시 member테이블에 저장되어 있는지 체크
	@RequestMapping("/memberEmailCheck.do")
	@ResponseBody
	public String memberEmailCheck(@RequestBody String req, HttpSession session, HttpServletRequest request) {
		System.out.println(req);
		JSONObject object = new JSONObject(req);
	
		MemberVO memberVo = new MemberVO();
		memberVo.setMem_email(object.getString("mem_email"));
		
		System.out.println(memberVo.getMem_email());
		memberVo = memberDao.emailCheck(memberVo);

		if (memberVo == null) { // 리턴되는 값 X
			if (object.getString("menu").equals("homePage")) {
				System.out.println("홈페이지 사용가능");
				return "1";

			} else {

				System.out.println("카카오톡 로그인 회원가입");
				return "1";
			}

		} else { // 리턴값 있는 경우

			if (object.getString("menu").equals("homePage")) {

				System.out.println("사용 불가능");
				return "0";

			} else {				
				//2203015 PSH spring security 적용을 위해 수정
				UserDetails kakaoVO = (UserDetails)cuds.loadUserByUsername(memberVo.getMem_email());
				Authentication authentication = new UsernamePasswordAuthenticationToken(kakaoVO, kakaoVO.getPassword(), kakaoVO.getAuthorities());
				SecurityContext securityContext = SecurityContextHolder.getContext();
				securityContext.setAuthentication(authentication);
				session =request.getSession(true);
				session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
				/* session.setAttribute("member", memberVo); */
				System.out.println("카카오톡 계정으로 로그인 시키기");
				return "0";
			}

		}
	}

	// ===== 비밀번호 입력창 =====
	@RequestMapping("/enterPw.do")
	public String enterPw() {
		return "user/enterPw";
	}

	// ===== 이메일 찾기 =====
	// 이메일 찾기 창으로 이동
	@RequestMapping("/findEmail.do")
	public String findEmail(MemberVO memberVo) {
		return "user/findEmail";

	}

	// 폼 실행후 이메일 찾기
	@RequestMapping("/findMemberEmail.do")
	@ResponseBody
	public String findMemberEmail(@RequestBody MemberVO memberVo) {
		System.out.println(memberVo.getMem_name());
		System.out.println(memberVo.getMem_email());
		MemberVO resultVo = memberDao.emailCheck(memberVo);

		if (resultVo == null) {
			System.out.println("없음1");
			return "0";

		} else {

			if (resultVo.getMem_name().equals(memberVo.getMem_name())) {
				System.out.println("있음2");
				return "1";

			} else {
				System.out.println("없음3");
				return "0";

			}
		}
	}

	// ===== 비밀번호 찾기 =====
	// 비밀번호 찾기 창으로 이동
	@RequestMapping("/findPw.do")
	public String findPw() {
		return "user/findPw";
	}

	// 폼 실행 후 비밀번호 찾기 + 비밀번호 발송
	@RequestMapping("/findMemberPw.do")
	@ResponseBody
	public String findMemberPw(@RequestBody MemberVO memberVo) throws Exception {
		System.out.println(memberVo.getMem_name());
		System.out.println(memberVo.getMem_email());
		MemberVO resultVo = memberDao.emailCheck(memberVo);

		if (resultVo == null) {
			System.out.println("없음1");
			return "0";

		} else {

			if (resultVo.getMem_name().equals(memberVo.getMem_name())) {
				System.out.println("있음2");

				boolean check = sendEmail(memberVo);

				if (check == false) {
					System.out.println("있는데 발송 X");
					return "2";

				} else {
					System.out.println("있는데 발송 O");
					return "1";
				}
				
			} else {
				System.out.println("없음3");
				return "0";

			}
		}
	}

	public boolean sendEmail(MemberVO memberVo) {
		String host = "smtp.gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 SMTP 서버 정보를 설정한다. 
		String user = "grsmartfarm@gmail.com"; // 이메일
		String password = "smartfarm"; // 비밀번호 

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");//구글 로그인으로 바꾸면서 추가
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(memberVo.getMem_email())); // 메일 보낼 곳
			message.setSubject("[똑장이] 임시 비밀번호 발송"); // 메일 제목
			//220315 PSH 비밀번호 암호화
			String tmpPwd = getRamdomPassword(13);

			String content = "<div style=\" width: 550px; height: 350px; text-align: center;\">"
					+ "<div style=\" display: inline-block; background-color: #66bb6a;  text-align:center; width: 350px; height: 200px;  border-radius: 5px; padding:50px;\">"
					+ "<div style=\"background-color: white; width: 350px; height: 200px;  border-radius: 5px; \">"
					+ "<br><br>" + "<h3>똑장이의 임시 비밀번호 입니다</h3>" + "<br>" + "<p>" + tmpPwd + "</p>" + "</div>" + "</div>"
					+ "</div>";

			message.setContent(content, "text/html; charset=utf-8");
			message.setSentDate(new Date());
			Transport.send(message);
			System.out.println("Success Message Send");

			// 임시 비밀번호로 회원의 비밀번호 설정하기
			memberVo.setMem_pw(bcryp.encode(tmpPwd));
			memberDao.memberUpdatePw(memberVo);
			
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
		
		
		return true;
	}

	public String getRamdomPassword(int size) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z', '!', '@', '#', '$', '^', '&' };
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0;
		int len = charSet.length;
		for (int i = 0; i < size; i++) { // idx = (int) (len * Math.random());
			idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
			sb.append(charSet[idx]);
		}

		return sb.toString();
	}

}

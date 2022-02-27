package co.smartFarm.user;

import java.security.SecureRandom;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Autowired
	MemberMapper memberDao;

	// ===== 로그인 =====
	// 로그인창으로 이동
	@RequestMapping("/login.do")
	public String login() {
		return "user/login";
	}

	// 로그인 체크
	@PostMapping("/loginCheck.do")
	public String loginCheck(MemberVO memberVo, Model model, HttpSession session) {
		System.out.println(memberVo.getMem_email());
		MemberVO resultVo = memberDao.loginCheck(memberVo);

		if (resultVo != null) {// 이메일 조회했는데 리턴값 있음

			// 비번 일치하는 경우
			if (resultVo.getMem_pw().equals(memberVo.getMem_pw())) {

				session.setAttribute("member", resultVo);

				// 페이지 이동
				if (resultVo.getMem_athr().equals("B0")) {// 관리자인 경우 : 관리자 페이지로 이동
					System.out.println("관리자 로그인");
					return "admin/adminHome";

				} else if (resultVo.getMem_athr().equals("B2")) {// 농부인 경우 : 관리 페이지로 이동
					System.out.println("농부 로그인");
					return "grow/grow";

				} else {// 일반회원인 경우 : 홈으로 이동
					System.out.println("일반회원 로그인");
					return "home";

				}
			} else {
				// 비밀번호 불일치
				model.addAttribute("error", "비밀번호를 확인해주세요");
				return "user/login";
			}

		} else {
			// 이메일 조회했는데 리턴값 없음
			System.out.println("로그인 실패");
			model.addAttribute("error", "아이디를 확인해주세요");
			return "user/login";
		}

	}

	// ===== 회원가입 =====
	// 회원가입창으로 이동
	@RequestMapping("/register.do")
	public String register() {
		return "user/register";
	}

	// 회원가입 입력
	@PostMapping("/memberInsert.do")
	public String memberInsert(MemberVO memberVo) {
		System.out.println("=========");
		System.out.println("확인!!!! === " + memberVo.getMem_email());
		System.out.println(memberVo.getMem_det_addr());
		System.out.println(memberVo.getMem_addr());
		memberDao.memberInsert(memberVo);
		return "home";
	}

	// 이메일 체크
	@RequestMapping("/memberEmailCheck.do")
	@ResponseBody
	public String memberEmailCheck(@RequestBody MemberVO memberVO) {
		System.out.println(memberVO.getMem_email());
		MemberVO memberVo = memberDao.emailCheck(memberVO);

		if (memberVo == null) {
			System.out.println("사용가능");

			return "1";

		} else {
			System.out.println("사용 불가능");
			return "0";

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

	// 폼 실행 후 비밀번호 찾기
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
				// return "1";// check되면은 이거 지우기!
			} else {
				System.out.println("없음3");
				return "0";

			}
		}
	}

	public boolean sendEmail(MemberVO memberVo) throws Exception {
		String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		String user = "yisseol@naver.com"; // 패스워드
		String password = "password"; // SMTP 서버 정보를 설정한다.

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(memberVo.getMem_email())); // 메일 제목
			message.setSubject("[똑장이] 임시 비밀번호 발송"); // 메일 내용
			String tmpPwd = getRamdomPassword(10);

			String content = "<div style=\" width: 550px; height: 350px; text-align: center;\">"
					+ "<div style=\" display: inline-block; background-color: #66bb6a;  text-align:center; width: 350px; height: 200px;  border-radius: 5px; padding:50px;\">"
					+ "<div style=\"background-color: white; width: 350px; height: 200px;  border-radius: 5px; \">"
					+ "<br><br>" + "<h3>임시 비밀번호 입니다</h3>" + "<br>" + "<p>" + tmpPwd + "</p>" + "</div>" + "</div>"
					+ "</div>";

			message.setContent(content, "text/html; charset=utf-8");
			message.setSentDate(new Date());
			Transport.send(message);
			System.out.println("Success Message Send");
			
			//임시 비밀번호로 회원의 비밀번호 설정하기
			memberVo.setMem_pw(tmpPwd);
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

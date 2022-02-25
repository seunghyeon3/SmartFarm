package co.smartFarm.user;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
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
	@RequestMapping("/findPw.do")
	public String findPw() {
		return "user/findPw";
	}

	// 폼 실행후 비밀번호 찾기
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

				//boolean check = sendEmail(memberVo, memberVo.getMem_pw());

//				if (check == false) {
//					System.out.println("있는데 발송 X");
//					return "0";
//					
//				} else {
//					System.out.println("있는데 발송 O");
//					return "1";
//				}
				return "1";// check되면은 이거 지우기!
			} else {
				System.out.println("없음3");
				return "0";

			}
		}
	}

//	public boolean sendEmail(MemberVO memberVo, String div) throws Exception {
//		System.out.println(memberVo.getMem_email());
//		System.out.println("메일 보내고 있니...");
//		// Mail Server 설정
//		String charSet = "utf-8";
//		String hostSMTP = "smtp.naver.com"; // 네이버 이용시 smtp.naver.com
//		String hostSMTPid = "yisseol@naver.com";
//		String hostSMTPpwd = "";
//
//		// 보내는 사람 EMail, 제목, 내용
//		String fromEmail = "yisseol@naver.com";
//		String fromName = "똑장이";
//		String subject = "제발제발제발";
//		String msg = "";
//
////		if (div.equals("findpw")) {
//		subject = "똑장이 임시 비밀번호 입니다.";
//		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
//		msg += "<h3 style='color: blue;'>";
//		msg += memberVo.getMem_name() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
//		msg += "<p>임시 비밀번호 : ";
//		msg += memberVo.getMem_pw() + "</p></div>";
////		}
//
//		// 받는 사람 E-Mail 주소
//		String mail = "wth9699@naver.com";// memberVo.getMem_email();
//		try {
//			HtmlEmail email = new HtmlEmail();
//			email.setDebug(true);
//			email.setCharset(charSet);
//			email.setSSL(true);
//			email.setHostName(hostSMTP);
//			email.setSmtpPort(587); // 네이버 이용시 587
//
//			email.setAuthentication(hostSMTPid, hostSMTPpwd);
//			email.setTLS(true);
//			email.addTo(mail, charSet);
//			email.setFrom(fromEmail, fromName, charSet);
//			email.setSubject(subject);
//			email.setHtmlMsg(msg);
//			email.send();
//
//		} catch (Exception e) {
//			System.out.println("메일발송 실패 : " + e);
//			return false;
//		}
//		return true;
//	}

}

package co.smartFarm.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Autowired
	MemberMapper memberDao;

	// 로그인 이동
	@RequestMapping("/login.do")
	public String login() {
		return "user/login";
	}

	// 로그인 체크
	@ResponseBody
	@RequestMapping("/loginCheck.do")
	public String loginCheck() {

		return null;
	}

	// 회원가입 이동
	@RequestMapping("/register.do")
	public String register() {
		return "user/register";
	}

	// 회원가입 입력
	@RequestMapping("/memberInsert.do")
	public String memberInsert() {

		return "home";
	}

	// 이메일 체크
	@RequestMapping("/memberEmailCheck.do")
	public String memberEmailCheck(String email) {

		MemberVO memberVo = memberDao.memberEmailCheck(email);
		if (memberVo.getMem_email() == null) {
			System.out.println("사용가능");
		} else {
			System.out.println("사용 불가능");
		}
		return "";
	}

}

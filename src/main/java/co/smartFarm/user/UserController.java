package co.smartFarm.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
public class UserController {

	@Autowired
	MemberMapper memberDao;

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

	// 회원가입창으로 이동
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

	// 비밀번호 입력창
	@RequestMapping("/enterPw.do")
	public String enterPw() {
		return "user/enterPw";
	}

}

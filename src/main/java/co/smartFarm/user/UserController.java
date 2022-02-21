package co.smartFarm.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("/memberInsert.do")
	public String memberInsert() {
		return "user/memberInsert";
	}
	
}

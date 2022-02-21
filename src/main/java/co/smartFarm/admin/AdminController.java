package co.smartFarm.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/admin/adminHome.do")
	public String adminHome() {

		return "admin/adminHome";

	}

	@RequestMapping("/admin/adminPurchaseList.do")
	public String adminPurchaseList() {

		return "admin/adminPurchaseList";

	}

	@RequestMapping("/admin/adminManageMember.do")
	public String adminManageMember() {

		return "admin/adminManageMember";

	}

}

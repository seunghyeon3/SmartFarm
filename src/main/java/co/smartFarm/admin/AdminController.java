package co.smartFarm.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/admin/adminManageKit.do")
	public String adminManageKit() {

		return "admin/adminManageKit";

	}
	
	@RequestMapping("/admin/adminManageNFT.do")
	public String adminManageNFT() {

		return "admin/adminManageNFT";

	}
	
	@ResponseBody
	@RequestMapping("/admin/adminSelectList.do")
	public String adminSelectList() {
		return null;
	}

}

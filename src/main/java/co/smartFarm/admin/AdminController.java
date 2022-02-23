package co.smartFarm.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.smartFarm.user.MemberMapper;
import co.smartFarm.user.MemberVO;

@Controller
public class AdminController {
	@Autowired
	MemberMapper memberDao;

	@RequestMapping("/admin/adminHome.do")
	public String adminHome() {

		return "admin/adminHome";

	}

	@RequestMapping("/admin/adminPurchaseList.do")
	public String adminPurchaseList() {

		return "admin/adminPurchaseList";

	}
	
	@RequestMapping("/admin/adminManageMember.do")
	public String adminManageMember(Model model) throws JsonProcessingException {

		List<MemberVO> memberList = memberDao.memberSelectList();
		ObjectMapper map = new ObjectMapper();

		// 컬럼 값 고치기(B1->일반회원, 신청결과 출력하기)
		for (int i = 0; i < memberList.size(); i++) {
			if (memberList.get(i).getMem_athr().equals("B2")) {
				memberList.get(i).setMem_athr("농부");
				memberList.get(i).setMem_fm_result("농부");
			} else {
				memberList.get(i).setMem_athr("일반회원");

				if (memberList.get(i).getMem_fm_req() == null) {
					memberList.get(i).setMem_fm_result("일반회원");
					
				} else {
					if (memberList.get(i).getMem_fm_req().equals("reject")) {
						memberList.get(i).setMem_fm_req("거절됨");
						memberList.get(i).setMem_fm_result("거절됨");
						
					} else {

						memberList.get(i).setMem_fm_result("신청중");
					}
				}

			}
		}

		String returnStr = map.writeValueAsString(memberList);

		model.addAttribute("memberSelectList", returnStr);

		return "admin/adminManageMember";

	}
	
	@RequestMapping("/admin/adminRequstAccept.do/{mem_mail}")
	public String adminRequstAccept(@PathVariable String mem_email) {
		
		int result = memberDao.memberReqAccept(mem_email);
		
		return null;
		
		
	}
	
	@RequestMapping("/admin/adminManageKit.do")
	public String adminManageKit() {

		return "admin/adminManageKit";

	}

	@RequestMapping("/admin/adminManageNFT.do")
	public String adminManageNFT() {

		return "admin/adminManageNFT";

	}
	
	@RequestMapping("/admin/adminManagePlant.do")
	public String adminManagePlant() {

		return "admin/adminManagePlant";

	}

}

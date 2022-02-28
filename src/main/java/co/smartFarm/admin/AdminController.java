package co.smartFarm.admin;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import co.smartFarm.shopping.KitMapper;
import co.smartFarm.shopping.KitVO;
import co.smartFarm.user.MemberMapper;
import co.smartFarm.user.MemberVO;

@Controller
public class AdminController {
	@Autowired
	MemberMapper memberDao;
	
	@Autowired
	KitMapper kitDao;

	// ===== 매출 페이지 이동 =====
	@RequestMapping("/admin/adminHome.do")
	public String adminHome() {

		return "admin/adminHome";

	}

	// ===== 구매현황 리스트 페이지 이동 =====
	@RequestMapping("/admin/adminPurchaseList.do")
	public String adminPurchaseList() {

		return "admin/adminPurchaseList";

	}

	// ===== 회원 관리 페이지 창 이동(리스트 뿌려줌) =====
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
					if (memberList.get(i).getMem_fm_req().equals("Reject")) {
						memberList.get(i).setMem_fm_req("거절됨");
						memberList.get(i).setMem_fm_result("거절됨");

					} else {

						memberList.get(i).setMem_fm_result("신청중");
					}
				}

			}
		}

		String returnStr = map.writeValueAsString(memberList);
		// System.out.println(returnStr);
		model.addAttribute("memberSelectList", returnStr);

		return "admin/adminManageMember";

	}

	// 농부 등록 - 승인
	@PostMapping("/admin/adminRequstAccept.do")
	@ResponseBody
	public String adminRequstAccept(@RequestBody String mem_email) {

		System.out.println("=====");
		System.out.println(mem_email);

		JSONObject object = new JSONObject(mem_email);
		mem_email = object.getString("mem_email");
		System.out.println(mem_email);
		int result = memberDao.memberAcceptAthr(mem_email);
		return null;

	}

	// 농부 등록 - 거절
	@PostMapping("/admin/adminRequstReject.do")
	@ResponseBody
	public String adminRequstReject(@RequestBody String mem_email) {

		System.out.println("=====");
		System.out.println(mem_email);

		JSONObject object = new JSONObject(mem_email);
		mem_email = object.getString("mem_email");
		System.out.println(mem_email);

		int result = memberDao.memberRejectAthr(mem_email);
		return null;

	}

	// ===== 키트 관리 페이지 이동 =====
	@RequestMapping("/admin/adminManageKit.do")
	public String adminManageKit(Model model) {
		List<KitVO> list =  kitDao.kitSelectList();
		JSONObject object = new JSONObject(list);
		
		model.addAttribute("kitList", object);
		System.out.println(object);
		
		return "admin/adminManageKit";

	}

	// ===== NFT 관리 페이지 이동 =====
	@RequestMapping("/admin/adminManageNFT.do")
	public String adminManageNFT() {

		return "admin/adminManageNFT";

	}

	// ===== 작물 관리 페이지 이동 =====
	@RequestMapping("/admin/adminManagePlant.do")
	public String adminManagePlant() {

		return "admin/adminManagePlant";

	}

	// ===== 회원 검색 =====
	@PostMapping("/admin/adminMemSearch.do")
	@ResponseBody
	public List<MemberVO> adminMemSearch(@RequestBody String req) {

		JSONObject object = new JSONObject(req);
		
		String key = object.getString("key");
		String val = object.getString("val");
		System.out.println("req === " + req);
		System.out.println("key === " + key);
		System.out.println("val === " + val);

		return memberDao.memberSelectKeyList(key, val);
	}

}

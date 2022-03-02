package co.smartFarm.admin;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
<<<<<<< HEAD
=======
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
>>>>>>> 9c6533964d280ff5b8c6321f0bcc53fb92c1efbc

import co.smartFarm.shopping.KitMapper;
import co.smartFarm.shopping.KitVO;
import co.smartFarm.user.MemberMapper;
import co.smartFarm.user.MemberVO;

@Controller
public class AdminController {
<<<<<<< HEAD
	
=======

>>>>>>> 9c6533964d280ff5b8c6321f0bcc53fb92c1efbc
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
	public String adminRequstAccept(@RequestBody Map<String, String> map) {

		/*
		 * System.out.println("====="); System.out.println(mem_email);
		 * 
		 * JSONObject object = new JSONObject(mem_email); mem_email =
		 * object.getString("mem_email");
		 */
		String mem_email = (String)map.get("mem_email");
		int result = memberDao.memberAcceptAthr(mem_email);
		return null;//승인된 값 넘기기 ex 200번 

	}

	// 농부 등록 - 거절
	@PostMapping("/admin/adminRequstReject.do")
	@ResponseBody
	public String adminRequstReject(@RequestBody String mem_email) {//stringify 안하고 쓰기!

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
		List<KitVO> list = kitDao.kitSelectList();
		System.out.println(list);
		System.out.println(list.get(0).getKit_no());
		System.out.println(list.get(0).getKit_name());

		JSONArray jarray = new JSONArray();

		for (KitVO li : list) {
			JSONObject object = new JSONObject();
			object.put("kit_no", li.getKit_no());
			object.put("kit_name", li.getKit_name());
			object.put("kit_prpos", li.getKit_prpos());
			object.put("kit_plant_class", li.getKit_plant_class());
			object.put("kit_sale_whet", li.getKit_sale_whet());
			object.put("kit_hit", li.getKit_hit());
			object.put("kit_sale_count", li.getKit_sale_count());
			jarray.put(object);
		}

		model.addAttribute("kitSelectList", jarray);

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

		return memberDao.memberSelectKeyList(key, val);
	}

	// ===== 올리기 내리기 =====
	@PostMapping("/admin/adminKitSaleWhet.do")
	@ResponseBody
	public String adminKitSaleWhet(@RequestBody String req) {

		JSONObject object = new JSONObject(req);

		KitVO kitVo = new KitVO();
		kitVo.setKit_no(object.getInt("kit_no"));
		kitVo.setKit_sale_whet(object.getString("kit_sale_whet"));

		System.out.println("kit_no === " + kitVo.getKit_no());
		System.out.println("kit_whet == " + kitVo.getKit_sale_whet());
		int result = kitDao.kitUpdateWhet(kitVo);
		if (result > 0) {
			return "1";
		}
		return "0";
	}

	// ===== 키트 이름 검색 =====
	@PostMapping(value= "/admin/adminKitSearch.do",produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String adminKitSearch(@RequestParam("kit_name") String kit_name) {
			
		List<KitVO> list = kitDao.kitSelectOne(kit_name);
		System.out.println(kit_name);
		System.out.println(list);
		System.out.println("결과 확인! =="+ list.get(0).getKit_name());
		
		JSONArray jArray = new JSONArray();
		if (list.size() > 0) {
			for (KitVO li : list) {
				JSONObject object = new JSONObject();
				object.put("kit_no", li.getKit_no());
				object.put("kit_name", li.getKit_name());
				System.out.println(li.getKit_name());
				object.put("kit_prpos", li.getKit_prpos());
				object.put("kit_plant_class", li.getKit_plant_class());
				object.put("kit_sale_whet", li.getKit_sale_whet());
				jArray.put(object);
			}
			return jArray.toString();
		}
		return null;
	}

}

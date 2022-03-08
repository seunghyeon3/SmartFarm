//package co.smartFarm.admin.adminWeb;
//
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.List;
//import java.util.Locale;
//import java.util.Map;
//
//import org.apache.ibatis.annotations.Param;
//import org.apache.poi.xssf.streaming.SXSSFWorkbook;
//import org.json.JSONArray;
//import org.json.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.Gson;
//import com.google.gson.JsonArray;
//import com.google.gson.JsonElement;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//
//import co.smartFarm.NFT.service.NftService;
//import co.smartFarm.NFT.service.NftVO;
//import co.smartFarm.admin.adminService.ExcelService;
//import co.smartFarm.kit.kitService.KitService;
//import co.smartFarm.kit.kitService.KitVO;
//import co.smartFarm.shopping.purHisService.PurHisService;
//import co.smartFarm.shopping.purHisService.PurHisVO;
//import co.smartFarm.user.memberService.MemberService;
//import co.smartFarm.user.memberService.MemberVO;
//
//@Controller
//public class AdminController {
//	@Autowired
//	// 220302 PSH MemberMapper -> MemberService로 수정
//	MemberService memberDao;
//
//	@Autowired
//	// 220302 PSH KitMapper -> kitService로 수정
//	KitService kitDao;
//
//	@Autowired
//	NftService nftDao;
//
//	@Autowired
//	PurHisService purHisDao;
//
//	@Autowired
//	ExcelService excelDao;
//
//	// ===== 매출 페이지 이동 =====
//	@RequestMapping("/admin/adminHome.do")
//	public String adminHome(Model model) {
//
//		// 기본적으로 화면에 한달 전 부터 현재까지의 내역을 출력함
//
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(new Date());
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//
//		String endDate = df.format(cal.getTime());// 현재 시간
////		System.out.println("현재시간 === " + endDate);
//
//		cal.add(Calendar.MONTH, -1);
//		String startDate = df.format(cal.getTime());// 한달 전
////		System.out.println("한달 전 === " + startDate);
//
//		PurHisVO purHisVo = new PurHisVO();
//		purHisVo.setEnd_date("2022-03-07");
//		purHisVo.setStart_date("2022-02-07");
//
//		 List<PurHisVO> list = purHisDao.adminPurHisSelectList(purHisVo);
//		 
//		 model.addAttribute("purHisSelectList", list);
//		 System.out.println(list.toString());
//		return "admin/adminHome";
//
//	}
//
//	// ===== 엑셀 다운로드 =====
//	@RequestMapping(value = "/admin/downloadExcelFile.do", method = RequestMethod.POST)
//	public String downloadExcelFile(Model model, String selectList) {
//		System.out.println("=================");
//		System.out.println(selectList);
//		
//		JSONArray jArray = new JSONArray(selectList);
//		JsonObject objec1t = (JsonObject) jArray.get(0);
//		JsonObject object = (JsonObject) jArray.get(0);
//
//		System.out.println(object.get("menu"));
//		System.out.println(jArray.get(0));
//		System.out.println(jArray.length());
//		System.out.println("=================");
//
//		SXSSFWorkbook workbook = excelDao.excelFileDownloadProcess(jArray);
////		model.addAttribute("locale", Locale.KOREA);
////		model.addAttribute("workbook", workbook);
////		model.addAttribute("workbookName", "회원리스트");
//
//		return null;
//	}
//
//	// ===== 구매현황 리스트 페이지 이동 =====
//	@RequestMapping("/admin/adminPurchaseList.do")
//	public String adminPurchaseList() {
//
//		return "admin/adminPurchaseList";
//
//	}
//
//	// ===== 회원 관리 페이지 창 이동(리스트 뿌려줌) =====
//	@RequestMapping("/admin/adminManageMember.do")
//	public String adminManageMember(Model model) throws JsonProcessingException {
//
//		List<MemberVO> memberList = memberDao.memberSelectList();
//		String result = new Gson().toJson(memberList);
//		model.addAttribute("memberSelectList", result);
//
//		return "admin/adminManageMember";
//
//	}
//
//	// 농부 등록 - 승인
//	@PostMapping("/admin/adminRequstAccept.do")
//	@ResponseBody
//	public String adminRequstAccept(@RequestBody Map<String, String> map) {
//
//		/*
//		 * System.out.println("====="); System.out.println(mem_email);
//		 * 
//		 * JSONObject object = new JSONObject(mem_email); mem_email =
//		 * object.getString("mem_email");
//		 */
//		String mem_email = (String) map.get("mem_email");
//		int result = memberDao.memberAcceptAthr(mem_email);
//		return null;// 승인된 값 넘기기 ex 200번
//
//	}
//
//	// 농부 등록 - 거절
//	@PostMapping("/admin/adminRequstReject.do")
//	@ResponseBody
//	public String adminRequstReject(@RequestBody String mem_email) {// stringify 안하고 쓰기!
//
//		System.out.println("=====");
//		System.out.println(mem_email);
//
//		JSONObject object = new JSONObject(mem_email);
//		mem_email = object.getString("mem_email");
//		System.out.println(mem_email);
//
//		int result = memberDao.memberRejectAthr(mem_email);
//		return null;
//
//	}
//
//	// ===== 키트 관리 페이지 이동 =====
//	@RequestMapping("/admin/adminManageKit.do")
//	public String adminManageKit(Model model) {
//		List<KitVO> list = kitDao.kitSelectList();
//		System.out.println(list);
//		System.out.println(list.get(0).getKit_no());
//		System.out.println(list.get(0).getKit_name());
//
//		JSONArray jarray = new JSONArray();
//
//		for (KitVO li : list) {
//			JSONObject object = new JSONObject();
//			object.put("kit_no", li.getKit_no());
//			object.put("kit_name", li.getKit_name());
//			object.put("kit_prpos", li.getKit_prpos());
//			object.put("kit_plant_class", li.getKit_plant_class());
//			object.put("kit_sale_whet", li.getKit_sale_whet());
//			object.put("kit_hit", li.getKit_hit());
//			object.put("kit_sale_count", li.getKit_sale_count());
//			jarray.put(object);
//		}
//
//		model.addAttribute("kitSelectList", jarray);
//
//		return "admin/adminManageKit";
//
//	}
//
//	// ===== NFT 관리 페이지 이동 =====
//	@RequestMapping("/admin/adminManageNFT.do")
//	public String adminManageNFT(Model model) {
//		List<NftVO> list = nftDao.adminNftSelectList();
//		String json = new Gson().toJson(list);
//		model.addAttribute("nftSelectList", json);
//
//		return "admin/adminManageNFT";
//
//	}
//
//	// ===== 작물 관리 페이지 이동 =====
//	@RequestMapping("/admin/adminManagePlant.do")
//	public String adminManagePlant() {
//
//		return "admin/adminManagePlant";
//
//	}
//
//	// ===== 회원 검색 =====
//	@PostMapping("/admin/adminMemSearch.do")
//	@ResponseBody
//	public List<MemberVO> adminMemSearch(@RequestBody String req) {
//
//		JSONObject object = new JSONObject(req);
//
//		String key = object.getString("key");
//		String val = object.getString("val");
//
//		return memberDao.memberSelectKeyList(key, val);
//	}
//
//	// ===== 올리기 내리기 =====
//	@PostMapping("/admin/adminKitSaleWhet.do")
//	@ResponseBody
//	public String adminKitSaleWhet(@RequestBody String req) {
//
//		JSONObject object = new JSONObject(req);
//
//		KitVO kitVo = new KitVO();
//		kitVo.setKit_no(object.getInt("kit_no"));
//		kitVo.setKit_sale_whet(object.getString("kit_sale_whet"));
//
//		System.out.println("kit_no === " + kitVo.getKit_no());
//		System.out.println("kit_whet == " + kitVo.getKit_sale_whet());
//		int result = kitDao.kitUpdateWhet(kitVo);
//		if (result > 0) {
//			return "1";
//		}
//		return "0";
//	}
//
//	// ===== 키트 이름 검색 =====
//	@PostMapping(value = "/admin/adminKitSearch.do", produces = "text/plain; charset=UTF-8")
//	@ResponseBody
//	public String adminKitSearch(@RequestParam("kit_name") String kit_name) {
//
//		List<KitVO> list = kitDao.kitSelectOne(kit_name);
//		System.out.println(kit_name);
//		System.out.println(list);
//		System.out.println("결과 확인! ==" + list.get(0).getKit_name());
//
//		JSONArray jArray = new JSONArray();
//		if (list.size() > 0) {
//			for (KitVO li : list) {
//				JSONObject object = new JSONObject();
//				object.put("kit_no", li.getKit_no());
//				object.put("kit_name", li.getKit_name());
//				System.out.println(li.getKit_name());
//				object.put("kit_prpos", li.getKit_prpos());
//				object.put("kit_plant_class", li.getKit_plant_class());
//				object.put("kit_sale_whet", li.getKit_sale_whet());
//				jArray.put(object);
//			}
//			return jArray.toString();
//		}
//		return null;
//	}
//
//}

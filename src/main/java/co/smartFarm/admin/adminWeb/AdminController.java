package co.smartFarm.admin.adminWeb;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.aspectj.internal.lang.annotation.ajcDeclareParents;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import co.smartFarm.NFT.service.NftService;
import co.smartFarm.NFT.service.NftVO;
import co.smartFarm.admin.adminService.ExcelService;
import co.smartFarm.kit.kitService.KitService;
import co.smartFarm.kit.kitService.KitVO;
import co.smartFarm.shopping.purHisService.PurHisService;
import co.smartFarm.shopping.purHisService.PurHisVO;
import co.smartFarm.user.memberService.MemberService;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class AdminController {
	@Autowired
	// 220302 PSH MemberMapper -> MemberService??? ??????
	MemberService memberDao;

	@Autowired
	// 220302 PSH KitMapper -> kitService??? ??????
	KitService kitDao;

	@Autowired
	NftService nftDao;

	@Autowired
	PurHisService purHisDao;

	@Autowired
	ExcelService excelDao;
	
	@Autowired
	private String saveDir;

	// ===== ?????? ????????? ?????? =====
	@RequestMapping("/admin/adminHome.do")
	public String adminHome(Model model) {

		// ??????????????? ????????? ?????? ??? ?????? ??????????????? ????????? ?????????
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		String endDate = df.format(cal.getTime());// ?????? ??????
//		System.out.println("???????????? === " + endDate);

		cal.add(Calendar.MONTH, -1);
		String startDate = df.format(cal.getTime());// ?????? ???
//		System.out.println("?????? ??? === " + startDate);

		PurHisVO purHisVo = new PurHisVO();
		purHisVo.setEnd_date(endDate);
		purHisVo.setStart_date(startDate);

		List<PurHisVO> list = purHisDao.adminPurHisSelectList(purHisVo);

		String gson = new Gson().toJson(list);
		model.addAttribute("purHisSelectList", gson);
		System.out.println(list.toString());
		return "admin/adminHome";

	}

	// ===== ?????? ???????????? =====
	@RequestMapping(value = "/admin/downloadExcelFile.do", method = RequestMethod.POST)
	public String downloadExcelFile(Model model, String selectList) {

		JSONArray jArray = new JSONArray(selectList);

		SXSSFWorkbook workbook = excelDao.excelFileDownloadProcess(jArray);
		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "?????????");

		return "excelDownloadView";
	}

	// ===== ?????? ???????????? ?????? ???????????? =====
	@PostMapping("/admin/adminGetSales.do")
	@ResponseBody
	public String adminGetSales(@RequestBody Map<String, String> map) {
		System.out.println(map.toString());
		PurHisVO purhisVo = new PurHisVO();
		purhisVo.setEnd_date(map.get("end_date"));
		purhisVo.setStart_date(map.get("start_date"));

		List<PurHisVO> list = purHisDao.adminPurHisSelectList(purhisVo);
		String gson = new Gson().toJson(list);

		System.out.println("==========");
		System.out.println(gson.toString());

		return gson;
	}

	// ===== ???????????? ????????? ????????? ?????? =====
	@RequestMapping("/admin/adminPurchaseList.do")
	public String adminPurchaseList(Model model) {

		return "admin/adminPurchaseList";

	}

	// ===== ???????????? ????????? ?????? ???????????? =====
	@GetMapping(value = "/admin/adminGetPurchaseList.do", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String adminGetPurchaseList(KitVO kitVo) {

		System.out.println(kitVo.toString());

		List<KitVO> list = kitDao.adminKitRankList(kitVo);
		String result = new Gson().toJson(list);

		return result;
	}

	// ===== ?????? ?????? ????????? ??? ??????(????????? ?????????) =====
	@RequestMapping("/admin/adminManageMember.do")
	public String adminManageMember(Model model) throws JsonProcessingException {

		List<MemberVO> memberList = memberDao.memberSelectList();
		String result = new Gson().toJson(memberList);
		model.addAttribute("memberSelectList", result);

		return "admin/adminManageMember";

	}

	// ?????? ?????? - ??????
	@PostMapping("/admin/adminRequstAccept.do")
	@ResponseBody
	public String adminRequstAccept(@RequestBody Map<String, String> map) {

		String mem_email = map.get("mem_email");
		int result = memberDao.memberAcceptAthr(mem_email);
		return null;// ????????? ??? ????????? ex 200???

	}

	// ?????? ?????? - ??????
	@PostMapping("/admin/adminRequstReject.do")
	@ResponseBody
	public String adminRequstReject(@RequestBody String mem_email) {// stringify ????????? ??????!

		System.out.println("=====");
		System.out.println(mem_email);

		JSONObject object = new JSONObject(mem_email);
		mem_email = object.getString("mem_email");
		System.out.println(mem_email);

		int result = memberDao.memberRejectAthr(mem_email);
		return null;

	}

	// ===== ?????? ?????? ????????? ?????? =====
	@RequestMapping("/admin/adminManageKit.do")
	public String adminManageKit(Model model) {
		List<KitVO> list = kitDao.adminKitSelectList();
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

	// ===== NFT ?????? ????????? ?????? =====
	@RequestMapping("/admin/adminManageNFT.do")
	public String adminManageNFT(Model model) {
		List<NftVO> list = nftDao.adminNftSelectList();
		String json = new Gson().toJson(list);
		model.addAttribute("nftSelectList", json);

		return "admin/adminManageNFT";

	}

	/* ????????? ???????????????
	 * // ===== ?????? ?????? ????????? ?????? =====
	 * 
	 * @RequestMapping("/admin/adminManagePlant.do") public String
	 * adminManagePlant() {
	 * 
	 * return "admin/adminManagePlant";
	 * 
	 * }
	 */

	// ===== ?????? ?????? =====
	@PostMapping(value = "/admin/adminMemSearch.do", produces= "text/plain; charset=UTF-8")
	@ResponseBody
	public String adminMemSearch(@RequestBody String req) {

		JSONObject object = new JSONObject(req);

		String key = object.getString("key");
		String val = object.getString("val");
		
		String gson = new Gson().toJson(memberDao.memberSelectKeyList(key, val));
		return gson;
	}

	// ===== ????????? ????????? =====
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

	// ===== ?????? ?????? ?????? =====
	@PostMapping(value = "/admin/adminKitSearch.do", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String adminKitSearch(@RequestParam("kit_name") String kit_name) {

		List<KitVO> list = kitDao.kitSelectOne(kit_name);
		System.out.println(kit_name);
		System.out.println(list);
		System.out.println("?????? ??????! ==" + list.get(0).getKit_name());

		String gson = new Gson().toJson(list);

		return gson;
	}

	// ===== ?????? ???????????? =====
	@PostMapping("/admin/kitInsert.do")
	public String kitInsert(KitVO kitVo, HttpServletRequest req, MultipartHttpServletRequest mhsr) {
		System.out.println(kitVo.toString());
		List<MultipartFile> list = mhsr.getFiles("img");

		System.out.println(list.toString());
		System.out.println("======== ???????????? ! ");
		System.out.println(kitVo.toString());
		String kitMainImg = list.get(0).getOriginalFilename();
		String kitExpImg = list.get(1).getOriginalFilename();
		 
		System.out.println(kitMainImg + " : " + kitExpImg);

		// ?????? ????????????
		// ????????????
		MultipartFile mainFile = list.get(0);
		MultipartFile expFile = list.get(1); 

		
		if (!kitMainImg.isEmpty() && !kitExpImg.isEmpty()) { // ??? ??? ???????????? ???????????? ?????????
			// ?????? ?????????
			String uuidMainImg = UUID.randomUUID().toString(); // ?????? ????????? ??????
			String saveFileMain = uuidMainImg + kitMainImg.substring(kitMainImg.lastIndexOf("."));

			// ?????? ?????????
			String uuidExpImg = UUID.randomUUID().toString();
			String saveFileExp = uuidExpImg + kitExpImg.substring(kitExpImg.lastIndexOf("."));

			try { // ?????? ?????????
				mainFile.transferTo(new File(saveDir, saveFileMain));
				kitVo.setKit_main_img(saveFileMain);

				// ?????? ?????????
				expFile.transferTo(new File(saveDir, saveFileExp));
				kitVo.setKit_exp_img(saveFileExp);
				
				// kit??? insert ??????
				int result = kitDao.kitInsert(kitVo);
				if(result > 0) {
					System.out.println("????????????");
					return "redirect:/admin/adminManageKit.do";
				}
				
			} catch ( IOException| IllegalStateException e) {
				e.printStackTrace();
			} 

		}

		return "redirect:/admin/adminManageKit.do?error=1";
	}

}

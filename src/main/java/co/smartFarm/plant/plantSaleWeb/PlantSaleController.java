package co.smartFarm.plant.plantSaleWeb;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import co.smartFarm.kit.kitService.KitMapper;
import co.smartFarm.kit.kitService.KitVO;
import co.smartFarm.plant.plantSaleService.PlantSaleMapper;
import co.smartFarm.plant.plantSaleService.PlantSaleService;
import co.smartFarm.plant.plantSaleService.PlantSaleVO;
import co.smartFarm.plant.plantService.PlantMapper;
import co.smartFarm.plant.plantService.PlantService;
import co.smartFarm.plant.plantService.PlantVO;
import co.smartFarm.shopping.cartService.CartMapper;
import co.smartFarm.shopping.cartService.CartVO;
import co.smartFarm.user.memberService.MemberVO;
import freemarker.template.utility.DOMNodeModel;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class PlantSaleController {

	@Autowired
	private PlantSaleService plantSaleDao;

	@Autowired
	private PlantService plantDao;
	
	@Autowired
	private String saveDir;

	// ?????? ?????? ?????????
	@RequestMapping("/plantShopList.do")
	public String plantShopList(Model model) throws JsonProcessingException {
		// 220302 PSH shoppingDao -> PlantSaleController ?????? ?????? ??? shoppingDao ->
		// plantSaleDao ??????
		/* List<PlantSaleVO> list = shoppingDao.plantSaleSelectList(); */
		
		ObjectMapper map = new ObjectMapper();
		List<PlantSaleVO> list = plantSaleDao.plantSaleSelectList();
		
		model.addAttribute("plantSaleList", list);
		model.addAttribute("plantSaleListP",map.writeValueAsString(list));
		return "shopping/plantShopList";
	}

	// ?????? ?????????
	@PostMapping("/plantSaleInsert.do")
	public String plantSaleInsert(PlantSaleVO plantSaleVo, HttpServletRequest req, MultipartFile oriFile)
			throws IllegalStateException, IOException {

		// ?????? ????????????
		
		
		System.out.println(oriFile.toString());
		if (!oriFile.isEmpty()) {

			String originRou = oriFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String plantSaleOriRou = uuid + originRou.substring(originRou.lastIndexOf("."));

			oriFile.transferTo(new File(saveDir, plantSaleOriRou));

			plantSaleVo.setPlant_sale_ori_rou(originRou);
			plantSaleVo.setPlant_sale_phy_rou(plantSaleOriRou);
			System.out.println(oriFile);
		}
		
		//?????? ?????? ????????????
		plantSaleVo.setPlant_sale_con(plantSaleVo.getPlant_sale_con().replace("\r\n", "<br>"));
		
		// ?????? ????????????
		plantSaleDao.plantSaleInsert(plantSaleVo);

		return "redirect:/plantShopList.do";
	}

	// ===== ?????? ???????????? ????????? ????????????=====
	@RequestMapping("/plantShopDetail.do")
	public String plantShopDetail(@Param("plant_sale_no") String plant_sale_no, Model model) {
		// ?????? ????????????
		System.out.println("???????????? === " + plant_sale_no);
		PlantSaleVO plantSaleVo = plantSaleDao.plantSaleSelectOneByNo(Integer.parseInt(plant_sale_no));
		System.out.println(plantSaleVo.toString());
		model.addAttribute("plantSaleDet", plantSaleVo);

		// ?????? ????????? ?????? json ?????????
		CartVO cartVo = new CartVO();
		String option = "P" + plantSaleVo.getPlant_sale_no();
		cartVo.setCart_detail(plantSaleVo.getPlant_sale_title());
		cartVo.setCart_day(new Date(0));
		cartVo.setCart_option(option);
		cartVo.setCart_price(Integer.parseInt(plantSaleVo.getPlant_sale_price()));
		cartVo.setCart_sale_count(1);
		cartVo.setCart_sum(Integer.parseInt(plantSaleVo.getPlant_sale_price()));
		
//		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
//			MemberVO memberVo =  (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			if (memberVo != null) {
//				
//				cartVo.setMem_email(memberVo.getMem_email());
	
//			}
//		}
		String gson = new Gson().toJson(cartVo);
		gson = "[" + gson + "]";
		model.addAttribute("payList", gson);
		
		return "shopping/plantProductDetail";
	}

	//===== ?????? ??????????????? ?????? =====
	// 220302 PSH shoppingController -> plantController ?????? ??????
	// 220313 LS plantController -> plantSaleController ?????? ??????
	@RequestMapping("/plantProductUpdate.do")
	public String plantProductUpdate(@Param("plant_sale_no") String plant_sale_no, Model model) {

		PlantVO plantVo = new PlantVO();
		plantVo.setPlant_no(plant_sale_no);

		PlantSaleVO resultVo = plantSaleDao.plantSaleSelectOne(Integer.parseInt(plant_sale_no));
		resultVo.setPlant_sale_con(resultVo.getPlant_sale_con().replace("<br>", "\r\n"));
		String jsonSelectPlantList = new Gson().toJson(resultVo);

		model.addAttribute("plantSale", resultVo);
		model.addAttribute("plantSaleScript", jsonSelectPlantList);

		return "shopping/plantProductUpdate";
	}

	//===== ???????????? ???????????? ?????? =====
	@PostMapping("/plantSaleUpdate.do")
	public String plantSaleUpdate(PlantSaleVO plantSaleVo, MultipartFile oriFile, HttpServletRequest req)
			throws IllegalStateException, IOException {

		// ?????? ??????
		
		
		if (!oriFile.isEmpty()) {
			String originRou = oriFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String plantSaleOriRou = uuid + originRou.substring(originRou.lastIndexOf("."));

			oriFile.transferTo(new File(saveDir, plantSaleOriRou));

			plantSaleVo.setPlant_sale_ori_rou(originRou);
			plantSaleVo.setPlant_sale_phy_rou(plantSaleOriRou);
			System.out.println(oriFile);
		}
		
		//?????? ?????? ????????????
		plantSaleVo.setPlant_sale_con(plantSaleVo.getPlant_sale_con().replace("\r\n", "<br>"));

		// update??????
		plantSaleDao.plantSaleUpdate(plantSaleVo);

		return "redirect:/plantShopList.do";
	}

	@GetMapping("/plantSaleDelete.do")
	@ResponseBody
	public String plantSaleDelete(@Param("plantSaleNo") String plantSaleNo) {
		// plantSale ????????????
		int result = plantSaleDao.plantDelete(Integer.parseInt(plantSaleNo));

		if (result > 0) {// ???????????? ?????? update
			// ?????? ????????????
			List<PlantSaleVO> list = plantSaleDao.plantSaleSelectBiggerNo(Integer.parseInt(plantSaleNo));
			
			//?????? ????????? ????????? ?????? ???
			if(!list.isEmpty()) {
				// ??? ????????? ?????????
				plantSaleDao.plantSaleUpdateNo(list);
				
			}
			

			return "1";

		}

		return "0";
	}

	@GetMapping("/plantSaleSearch.do")
	public String plantSaleSearch(@Param("plantSaleTitle") String plantSaleTitle, Model model) throws JsonProcessingException {

		List<PlantSaleVO> list = plantSaleDao.plantSaleSearch(plantSaleTitle);

		String gson = new Gson().toJson(list);
		model.addAttribute("plantSaleList", list);
		ObjectMapper map = new ObjectMapper();
		model.addAttribute("plantSaleListP",map.writeValueAsString(list));

		return "shopping/plantShopList";
	}
	
	@GetMapping(value ="/plantSaleTit.do", produces = "application/text;charset=utf8")
	@ResponseBody
	public String plantSeleTit() {
		List<PlantSaleVO> list = plantSaleDao.plantSaleSelectList();
		String gson = new Gson().toJson(list);
		return gson;
		
	}

}

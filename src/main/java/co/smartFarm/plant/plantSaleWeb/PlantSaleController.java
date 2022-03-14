package co.smartFarm.plant.plantSaleWeb;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class PlantSaleController {

	@Autowired
	private PlantSaleService plantSaleDao;

	@Autowired
	private PlantService plantDao;

	// 작물 전체 리스트
	@RequestMapping("/plantShopList.do")
	public String plantShopList(Model model) {
		// 220302 PSH shoppingDao -> PlantSaleController 구분 작업 및 shoppingDao ->
		// plantSaleDao 수정
		/* List<PlantSaleVO> list = shoppingDao.plantSaleSelectList(); */
		List<PlantSaleVO> list = plantSaleDao.plantSaleSelectList();
		model.addAttribute("plantSaleList", list);
		return "shopping/plantShopList";
	}

	// 작물 등록창
	@PostMapping("/plantSaleInsert.do")
	public String plantSaleInsert(PlantSaleVO plantSaleVo, HttpServletRequest req, MultipartFile oriFile)
			throws IllegalStateException, IOException {

		// 사진 저장하기
		String saveDirectory = req.getSession().getServletContext().getRealPath("/resources/plant"); // 추후수정
		System.out.println(oriFile.toString());
		if (!oriFile.isEmpty()) {

			String originRou = oriFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String plantSaleOriRou = uuid + originRou.substring(originRou.lastIndexOf("."));

			oriFile.transferTo(new File(saveDirectory, plantSaleOriRou));

			plantSaleVo.setPlant_sale_ori_rou(plantSaleOriRou);
			plantSaleVo.setPlant_sale_phy_rou(plantSaleOriRou);
			System.out.println(oriFile);
		}
		// 작물 등록하기
		plantSaleDao.plantSaleInsert(plantSaleVo);

		return "redirect:/plantShopList.do";
	}

	//===== 작물 상세조회 창으로 넘어가기=====
	@RequestMapping("/plantProductDetail.do")
	public String plantProductDetail(@Param("plant_sale_no") String plant_sale_no, Model model) {
		// 내용 조회하기
		System.out.println("확인하기 === " + plant_sale_no);
		PlantSaleVO plantSaleVo = plantSaleDao.plantSaleSelectOneByNo(Integer.parseInt(plant_sale_no));
		System.out.println(plantSaleVo.toString());
		model.addAttribute("plantSaleDet", plantSaleVo);
		return "shopping/plantProductDetail";
	}

	// 작물 수정창
	// 220302 PSH shoppingController -> plantController 구분 작업
	// 220313 LS plantController -> plantSaleController 이동 작업
	@RequestMapping("/plantProductUpdate.do")
	public String plantProductUpdate(@Param("plant_sale_no") String plant_sale_no, HttpSession session, Model model) {

		MemberVO memberVo = (MemberVO) session.getAttribute("member");
		PlantVO plantVo = new PlantVO();
		plantVo.setPlant_no(plant_sale_no);

		PlantSaleVO resultVo = plantSaleDao.plantSaleSelectOne(Integer.parseInt(plant_sale_no));
		String jsonSelectPlantList = new Gson().toJson(resultVo);

		model.addAttribute("plantSale", resultVo);
		model.addAttribute("plantSaleScript", jsonSelectPlantList);

		model.addAttribute("member", memberVo);
		return "shopping/plantProductUpdate";
	}

	@PostMapping("/plantSaleUpdate.do")
	public String plantSaleUpdate(PlantSaleVO plantSaleVo, MultipartFile oriFile, HttpServletRequest req) throws IllegalStateException, IOException {
		
		// 사진 저장
		String saveDirectory = req.getSession().getServletContext().getRealPath("/resources/plant"); // 추후수정
		
		if(!oriFile.isEmpty()) {
			String originRou = oriFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String plantSaleOriRou = uuid + originRou.substring(originRou.lastIndexOf("."));

			oriFile.transferTo(new File(saveDirectory, plantSaleOriRou));

			plantSaleVo.setPlant_sale_ori_rou(plantSaleOriRou);
			plantSaleVo.setPlant_sale_phy_rou(plantSaleOriRou);
			System.out.println(oriFile);
		}
		
		//update하기
		plantSaleDao.plantSaleUpdate(plantSaleVo);
		
		return "redirect:/plantShopList.do";
	}
	
	

}

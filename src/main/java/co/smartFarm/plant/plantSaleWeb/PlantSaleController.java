package co.smartFarm.plant.plantSaleWeb;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	//작물 전체 리스트
	@RequestMapping("/plantShopList.do")
	public String plantShopList(Model model) {
		//220302 PSH shoppingDao -> PlantSaleController 구분 작업 및 shoppingDao -> plantSaleDao 수정
		/* List<PlantSaleVO> list = shoppingDao.plantSaleSelectList(); */
		List<PlantSaleVO> list = plantSaleDao.plantSaleSelectList();
		model.addAttribute("plantSaleList", list);
		return "shopping/plantShopList";
	}

	// 작물 등록창
	@PostMapping("/plantSaleInsert.do")
	public String plantSaleInsert(PlantSaleVO plantSaleVO) {

//		System.out.println("==========");
//		System.out.println(shoppingVo.getMem_email());
//		System.out.println(shoppingVo.getPlant_no());
		
		//220302 PSH shoppingDao -> PlantSaleController 구분 작업 및 shoppingDao -> plantSaleDao 수정
		/* int returnVal = shoppingDao.plantSaleInsert(shoppingVo); */
		int returnVal = plantSaleDao.plantSaleInsert(plantSaleVO);
		if (returnVal > 0) {
//			System.out.println("입력됨!");
			return "shopping/plantShopList";
		}

		return "shopping/plantShopList";
	}
}

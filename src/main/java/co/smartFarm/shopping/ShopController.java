package co.smartFarm.shopping;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import co.smartFarm.user.MemberVO;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class ShopController {

	@Autowired
	private ShoppingMapper shoppingDao;

	@Autowired
	private PlantMapper plantDao;

	@RequestMapping("/plantShopList.do")
	public String plantShopList(Model model) {
		List<ShoppingVO> list = shoppingDao.plantSaleSelectList();
		model.addAttribute("plantSaleList", list);
		return "shopping/plantShopList";
	}

	// ===== 작물추가 창 =====
	@RequestMapping("/plantProductAdd.do")
	public String plantProductAdd(HttpSession session, Model model) {

		MemberVO memberVo = (MemberVO) session.getAttribute("member");
		List<PlantVO> selectMemList = plantDao.selectMemPlantList(memberVo);
		String jsonSelectMemList = new Gson().toJson(selectMemList);

		model.addAttribute("selectMemList", selectMemList);
		model.addAttribute("selectMemScript", jsonSelectMemList);

		model.addAttribute("member", memberVo);
		return "shopping/plantProductAdd";

	}

	@RequestMapping("/plantProductDetail.do")
	public String plantProductDetail() {
		return "shopping/plantProductDetail";
	}

	@RequestMapping("/plantProductUpdate.do")
	public String plantProductUpdate() {
		return "shopping/plantProductUpdate";
	}

	@PostMapping("/plantSaleInsert.do")
	public String plantSaleInsert(ShoppingVO shoppingVo) {

//		System.out.println("==========");
//		System.out.println(shoppingVo.getMem_email());
//		System.out.println(shoppingVo.getPlant_no());
		int returnVal = shoppingDao.plantSaleInsert(shoppingVo);
		if (returnVal > 0) {
//			System.out.println("입력됨!");
			return "shopping/plantShopList";
		}

		return "shopping/plantShopList";
	}

}

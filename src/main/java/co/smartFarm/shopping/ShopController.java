package co.smartFarm.shopping;

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

import co.smartFarm.user.MemberVO;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class ShopController {

	@Autowired
	private ShoppingMapper shoppingDao;

	@Autowired
	private PlantMapper plantDao;

	@Autowired
	private KitMapper kitDao;

	@Autowired
	private CartMapper cartDao;

	//작물 전체 리스트
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
	
	//작물 상세창
	@RequestMapping("/plantProductDetail.do")
	public String plantProductDetail() {

		return "shopping/plantProductDetail";
	}

	// 작물 수정창
	@RequestMapping("/plantProductUpdate.do")
	public String plantProductUpdate() {
		return "shopping/plantProductUpdate";
	}

	// 작물 등록창
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

	// 키트 전체조회
	@RequestMapping("/kitShopList.do")
	public String kitShopList(Model model) {

		List<KitVO> list = kitDao.kitSelectList();

		// System.out.println(list);

		model.addAttribute("kitSelectList", list);

		return "shopping/kitShopList";
	}

	// 키트 상세조회
	@RequestMapping("/kitProductDetail.do")
	public String kitProductDetail(@Param("kit_no") String kit_no, Model model) {

		/*
		 * KitVO kitVo = kitDao.kitSelectOne(Integer.parseInt(kit_no));
		 * System.out.println(kitVo); model.addAttribute("kitSelectOne", kitVo);
		 */
		return "shopping/kitProductDetail";
	}

	// 장바구니 확인하기
	@RequestMapping("/cartDetail.do")
	public String cartDetail(Model model) {
		CartVO cartVo = new CartVO();
		cartVo.setMem_email("bbb@abc.com");//추후수정 세션에서 값 받아오기
		
		List<CartVO> list = cartDao.cartSelectList(cartVo);
		String json = new Gson().toJson(list);
		
		model.addAttribute("cartSelectList", json);
		return "shopping/cartDetail";
	}

}

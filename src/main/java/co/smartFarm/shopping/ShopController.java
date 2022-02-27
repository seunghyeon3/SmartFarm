package co.smartFarm.shopping;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.smartFarm.user.MemberVO;

@Controller
public class ShopController {

	@Autowired
	private ShoppingMapper shoppingDao;

	@RequestMapping("/plantShopList.do")
	public String plantShopList() {
		return "shopping/plantShopList";
	}

	// ===== 작물추가 창 =====
	@RequestMapping("/plantProductAdd.do")
	public String plantProductAdd(HttpSession session, Model model) {

		MemberVO memberVo = (MemberVO) session.getAttribute("member");
		List<ShoppingVO> selectMemList = shoppingDao.selectMemShoppingList(memberVo);
		model.addAttribute("selectMemList", selectMemList);
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

}

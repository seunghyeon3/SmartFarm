package co.smartFarm.shopping.cartWeb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import co.smartFarm.shopping.cartService.CartService;
import co.smartFarm.shopping.cartService.CartVO;

@Controller
public class CartController {

	@Autowired
	CartService cartDao;
	

	// 장바구니 확인하기
	//220302 PSH shoppingController -> cartController 구분 작업
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

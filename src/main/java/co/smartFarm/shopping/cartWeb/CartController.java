package co.smartFarm.shopping.cartWeb;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import co.smartFarm.shopping.cartService.CartService;
import co.smartFarm.shopping.cartService.CartVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class CartController {

	@Autowired
	CartService cartDao;

	// 장바구니 확인하기
	// 220302 PSH shoppingController -> cartController 구분 작업
	@RequestMapping("/cartDetail.do")
	public String cartDetail(Model model, HttpSession session, String mem_email) {

		MemberVO memberVo = (MemberVO) session.getAttribute("member");
		mem_email = memberVo.getMem_email();
		CartVO cartVo = new CartVO();
		cartVo.setMem_email("bbb@abc.com");
//		cartVo.setMem_email(memberVo.getMem_email()); // 추후수정 끝나면 이거 살리기

		List<CartVO> list = cartDao.cartSelectList(cartVo);
		String json = new Gson().toJson(list);

		model.addAttribute("cartSelectList", json);

		return "shopping/cartDetail";
	}
	
//	@RequestMapping("/cartInsert.do")
//	public String cartInsert(CartVO cartVo) {
//		cartVo.setMem_email("bbb@abc.com");
//		cartVo.setCart_kit_no(10);
//		cartVo.setCart_price(123456);
//		cartVo.setCart_sale_count(3);
//		
//		System.out.println(cartVo.toString());
//		cartDao.insertCart(cartVo);
//		
//		return null;
//	}

}

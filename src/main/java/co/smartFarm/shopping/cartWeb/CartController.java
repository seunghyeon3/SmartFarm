package co.smartFarm.shopping.cartWeb;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String cartDetail(Model model, String mem_email) {

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
			MemberVO memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			CartVO cartVo = new CartVO();
			cartVo.setMem_email(memberVo.getMem_email());

			List<CartVO> list = cartDao.cartSelectList(cartVo);
			String json = new Gson().toJson(list);

			model.addAttribute("cartSelectList", json);
		}
		return "shopping/cartDetail";
	}

	// ===== 장바구니 추가 =====
	@GetMapping("/cartInsert.do")
	public String cartInsert(CartVO cartVo, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
			MemberVO memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (memberVo != null) {
				cartVo.setMem_email(memberVo.getMem_email());
				System.out.println("확인할 부분! === " + cartVo.toString());
				Integer result = cartDao.cartInsert(cartVo);
				System.out.println("결과 확인 === ! " + result);
				String referer = request.getHeader("Referer");
				return "redirect:" + referer; // 이전페이지로 가기
			}

//		// alert 띄우기
//		PrintWriter out = response.getWriter();
//		out.println("<script>alert'장바구니에 추가되었습니다'); </script>");
//		out.flush();

		}
		return null;
	}

	// ===== 장바구니에서 삭제하기 =====
	@GetMapping("/cartDelete.do")
	@ResponseBody
	public String cartDelete(CartVO cartVo) {

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {// 세션이 존재할 때
			
			MemberVO memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			cartVo.setMem_email(memberVo.getMem_email());
			
			if (cartVo.getCart_detail().contains("P")) {// 작물인 경우
				int plantNo = Integer.parseInt(cartVo.getCart_detail().substring(1));
				cartVo.setCart_plant_no(plantNo);
			} else {
				int kitNo = Integer.parseInt(cartVo.getCart_detail().substring(1));
				cartVo.setCart_kit_no(kitNo);
			}
			
			System.out.println(cartVo.toString());
			int result = cartDao.cartDelete(cartVo);
			if (result == 1) {
				return "1";
			}
			return "0";
		}
		return "0";

	}

	// ===== 결제창 호출 =====
	@GetMapping(value = "/pay.do", produces = "application/text;charset=utf8")
	public String pay() {
		System.out.println("======= 결제 확인하기");

		return "shopping/pay";
	}

}

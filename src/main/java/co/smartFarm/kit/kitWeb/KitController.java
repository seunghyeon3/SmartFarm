package co.smartFarm.kit.kitWeb;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.smartFarm.kit.kitService.KitService;
import co.smartFarm.kit.kitService.KitVO;
import co.smartFarm.shopping.cartService.CartVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class KitController {

	@Autowired
	private KitService kitDao;

	// 키트 전체조회
	// 220302 PSH shoppingController -> kitController 구분 작업
	@GetMapping("/kitShopList.do")
	public String kitShopList(Model model, @Param("kitPrpos") String kitPrpos, @Param("kitName") String kitName,
			@Param("orderBy") String orderBy) {

		Map<String, String> map = new HashMap();
		map.put("kitPrpos", kitPrpos);
		map.put("orderBy", orderBy);
		map.put("kitName", kitName);
		List<KitVO> list = kitDao.kitSelectList(map);
		model.addAttribute("kitSelectList", list);

//		if (kitPrpos != null) { // 키트 작물인 경우
//			List<KitVO> list = kitDao.kitSelectList(kitPrpos);
//
//			// System.out.println(list);
//
//			model.addAttribute("kitSelectList", list);
//
//			return "shopping/kitShopList";
//
//		} else if (kitName != null) {// 키트 이름 조회인 경우
//			List<KitVO> list = kitDao.kitSelectOne(kitName);
//			model.addAttribute("kitSelectList", list);
//			return "shopping/kitShopList";
//
//		} else if (orderBy != null) {
//
//			List<KitVO> list = kitDao.kitSelectOrderBy(orderBy);
//			model.addAttribute("kitSelectList", list);
//
//			return "shopping/kitShopList";
//		}

		return "shopping/kitShopList";
	}

	// 키트 상세조회
	// 220302 PSH shoppingController -> kitController 구분 작업
	@RequestMapping("/kitProductDetail.do")
	public String kitProductDetail(@Param("kit_no") String kit_no, Model model) {

		KitVO kitVo = kitDao.kitSelectOneByNo(Integer.parseInt(kit_no));
		// 앞단에서 뿌려주기 위한 VO타입
		System.out.println(kitVo);
		model.addAttribute("kitSelectOne", kitVo);

		// 조회수 올리기
		kitDao.kitUpdateHit(Integer.parseInt(kit_no));

		// 바로 구매를 위한 json 타입 만들기
		CartVO cartVo = new CartVO();
		String option = "K" + kitVo.getKit_no();
		cartVo.setCart_detail(kitVo.getKit_name());
		cartVo.setCart_day(new Date(0));
		cartVo.setCart_option(option);
		cartVo.setCart_price(kitVo.getKit_price());
		cartVo.setCart_sale_count(1);
		cartVo.setCart_sum(kitVo.getKit_price());

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();

			cartVo.setMem_email(userDetails.getUsername());

			String gson = new Gson().toJson(cartVo);
			gson = "[" + gson + "]";
			model.addAttribute("payList", gson);
		} else {
			String json = "[]";
			model.addAttribute("payList", json);
		}

		return "shopping/kitProductDetail";
	}

	// ===== 키트 검색하기 =====
	@GetMapping(value = "/searchKit.do", produces = "application/text;charset=utf8")
	@ResponseBody
	public String searchKit(@Param("kit_name") String kit_name) {

		return null;
	}
	
	@GetMapping(value = "kitSelectName.do", produces = "application/text;charset=utf8")
	@ResponseBody
	public String kitSelectName() {
		List<KitVO> list = kitDao.kitSelectNameDis();
		String gson = new Gson().toJson(list);
		return gson;
	}

}

package co.smartFarm.kit.kitWeb;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.smartFarm.kit.kitService.KitService;
import co.smartFarm.kit.kitService.KitVO;

@Controller
public class KitController {

	@Autowired
	private KitService kitDao;
	
	// 키트 전체조회
	//220302 PSH shoppingController -> kitController 구분 작업
		@RequestMapping("/kitShopList.do")
		public String kitShopList(Model model) {

			List<KitVO> list = kitDao.kitSelectList();

			// System.out.println(list);

			model.addAttribute("kitSelectList", list);

			return "shopping/kitShopList";
		}

	// 키트 상세조회
	//220302 PSH shoppingController -> kitController 구분 작업
		@RequestMapping("/kitProductDetail.do")
		public String kitProductDetail(@Param("kit_no") String kit_no, Model model) {

			/*
			 * KitVO kitVo = kitDao.kitSelectOne(Integer.parseInt(kit_no));
			 * System.out.println(kitVo); model.addAttribute("kitSelectOne", kitVo);
			 */
			return "shopping/kitProductDetail";
		}
}

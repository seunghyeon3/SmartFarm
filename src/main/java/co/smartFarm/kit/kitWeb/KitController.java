package co.smartFarm.kit.kitWeb;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.smartFarm.kit.kitService.KitService;
import co.smartFarm.kit.kitService.KitVO;

@Controller
public class KitController {

	@Autowired
	private KitService kitDao;

	// 키트 전체조회
	// 220302 PSH shoppingController -> kitController 구분 작업
	@GetMapping("/kitShopList.do")
	public String kitShopList(Model model, @Param("kitPrpos") String kitPrpos, @Param("kitName") String kitName) {
		if (kitPrpos != null) {
			List<KitVO> list = kitDao.kitSelectList(kitPrpos);

			// System.out.println(list);

			model.addAttribute("kitSelectList", list);

			return "shopping/kitShopList";

		} else if (kitName != null) {// 키트 이름 조회인 경우
			List<KitVO> list = kitDao.kitSelectOne(kitName);
			String gson = new Gson().toJson(list);
			model.addAttribute("kitSelectList", list);
			return "shopping/kitShopList";
		}
		return "shopping/kitShopList";
	}

	// 키트 상세조회
	// 220302 PSH shoppingController -> kitController 구분 작업
	@RequestMapping("/kitProductDetail.do")
	public String kitProductDetail(@Param("kit_no") String kit_no, Model model) {

		KitVO kitVo = kitDao.kitSelectOneByNo(Integer.parseInt(kit_no));
		System.out.println(kitVo);
		model.addAttribute("kitSelectOne", kitVo);

		kitDao.kitUpdateHit(Integer.parseInt(kit_no));
		// return "redirect:/kitProductDetail.do?kit_no=" + kitVo.getKit_no();
		return "shopping/kitProductDetail";
	}

	// ===== 키트 검색하기 =====
	@GetMapping(value = "/searchKit.do", produces = "application/text;charset=utf8")
	@ResponseBody
	public String searchKit(@Param("kit_name") String kit_name) {

		return null;
	}

}

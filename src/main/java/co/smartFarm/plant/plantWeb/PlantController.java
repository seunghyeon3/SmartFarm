package co.smartFarm.plant.plantWeb;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import co.smartFarm.plant.plantService.PlantService;
import co.smartFarm.plant.plantService.PlantVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class PlantController {

	@Autowired
	private PlantService plantDao;

	// ===== 작물추가 창 =====
	// 220302 PSH shoppingController -> plantController 구분 작업
	@RequestMapping("/plantProductAdd.do")
	public String plantProductAdd(Model model) {

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
			UserDetails userDatails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();

			List<PlantVO> selectMemList = plantDao.selectMemPlantList(userDatails.getUsername());

			String jsonSelectMemList = new Gson().toJson(selectMemList);

			model.addAttribute("selectMemList", selectMemList);
			model.addAttribute("selectMemScript", jsonSelectMemList);
		}

		return "shopping/plantProductAdd";

	}

	// 작물 상세창
	// 220302 PSH shoppingController -> plantController 구분 작업
	/*
	 * @RequestMapping("/plantProductDetail.do") public String plantProductDetail()
	 * {
	 * 
	 * return "shopping/plantProductDetail"; }
	 */

}

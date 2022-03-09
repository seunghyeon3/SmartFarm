package co.smartFarm.board.useRevw.useRevwWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.smartFarm.board.useRevw.useRevwService.UseRevwService;
import co.smartFarm.board.useRevw.useRevwService.UseRevwVO;

@Controller
public class UseRevwController {

	@Autowired
	UseRevwService useRevwDao;
	
	@RequestMapping("useRevwMain.do")
	public String UseRevwMain(Model model){
		
		model.addAttribute("useRevwList", useRevwDao.useRevwList());
		
		return "board/useRevwMain";
	}
	
	@RequestMapping("useRevwInsert.do")
	public String useRevwInsert(Model model, UseRevwVO useRevw){
		
		model.addAttribute("useRevwList", useRevwDao.createRevw(useRevw));
		
		return "board/useRevwInsert";
	}
	
}

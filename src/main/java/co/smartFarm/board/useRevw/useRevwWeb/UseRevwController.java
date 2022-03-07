package co.smartFarm.board.useRevw.useRevwWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.smartFarm.board.useRevw.useRevwService.UseRevwService;

@Controller
public class UseRevwController {

	@Autowired
	UseRevwService useRevwDao;
	
	@RequestMapping("UseRevwMain.do")
	public String UseRevwMain(){
		
		return "board/useRevwMain";
	}
	
	
	
}

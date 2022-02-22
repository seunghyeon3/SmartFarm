package co.smartFarm.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FAQController {
	
	@RequestMapping(value = "/faq.do", method = RequestMethod.GET) //
	public String faq() {
		
		return "board/faq";
	}

}

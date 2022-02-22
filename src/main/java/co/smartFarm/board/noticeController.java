package co.smartFarm.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class noticeController {

	@RequestMapping(value = "/notice.do", method = RequestMethod.GET) //
	public String notice() {
		
		return "board/notice";
	}
	@RequestMapping(value = "/noticea.do", method = RequestMethod.GET) //
	public String noticea() {
		
		return "board/noticea";
	}
}

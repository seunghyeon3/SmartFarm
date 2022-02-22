package co.smartFarm.grow;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class GrowController {
	
//	재배 진행 정보 페이지
	@RequestMapping(value = "/grow.do", method = RequestMethod.GET)
	public String grow(Locale locale, Model model) {
		
		return "grow/grow";
	}
	
//	키트 사용법 페이지
	@RequestMapping(value = "/howTo.do", method = RequestMethod.GET)
	public String howTo(Locale locale, Model model) {
	
		return "grow/howto";
	}
	
//	cctv 모니터링 페이지
	@RequestMapping(value = "/cctv.do", method = RequestMethod.GET)
	public String cctv(Locale locale, Model model) {
	
		return "grow/cctv";
	}
	
//	재배 관리 페이지
	@RequestMapping(value = "/control.do", method = RequestMethod.GET)
	public String control(Locale locale, Model model) {
	
		return "grow/control";
	}
	
}

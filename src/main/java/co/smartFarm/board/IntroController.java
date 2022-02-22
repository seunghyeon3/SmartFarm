package co.smartFarm.board;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroController {
	@RequestMapping(value = "/intro.do", method = RequestMethod.GET) //
	public String intro() {

		return "board/intro";
	}
	@RequestMapping(value = "/introinsert.do", method = RequestMethod.GET)
	public String introinsert() {

		return "board/introinsert";
	}
	@RequestMapping(value = "/introupdateForm.do", method = RequestMethod.GET)
	public String introupdate() {
		return "board/introupdateForm";
	}
	@RequestMapping(value = "/introg.do", method = RequestMethod.GET)
	public String introg() {
		return "board/introg";
	}
	@RequestMapping(value = "/introinsertg.do", method = RequestMethod.GET)
	public String introinsertg() {

		return "board/introinsertg";
	}
	@RequestMapping(value = "/introupdateFormg.do", method = RequestMethod.GET)
	public String introupdateFormg() {

		return "board/introupdateFormg";
	}
	@RequestMapping(value = "/introupdateFormn.do", method = RequestMethod.GET)
	public String introupdateg() {
		return "board/introupdateFormn";
	}
	@RequestMapping(value = "/intron.do", method = RequestMethod.GET)
	public String intron() {
		return "board/intron";
	}
	}

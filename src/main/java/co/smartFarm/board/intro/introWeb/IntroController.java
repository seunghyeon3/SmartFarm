package co.smartFarm.board.intro.introWeb;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.smartFarm.board.intro.introService.IntroMapper;
import co.smartFarm.board.intro.introService.IntroService;
import co.smartFarm.board.intro.introService.IntroVO;

@Controller
public class IntroController {
	@Autowired
	
	IntroService introDao;
	
	private File target;
	// 스마트팜 소개
	@RequestMapping(value = "/intro.do") 
	public String intro(Model model) {
		model.addAttribute("intro", introDao.introInsert(null));
		//System.out.println(introDao.introSelectList().toString());
		return "board/intro";
	}
	// 스마트팜 소개 등록 Form
	@RequestMapping(value = "/introinsertForm.do")
	public String introinsert() {
		return "board/introinsertForm";
	}

	// 스마트팜 소개 등록 페이지
	@RequestMapping(value = "/introinsert.do")
	public String introInsert(IntroVO intro, Model model, MultipartFile introfile,HttpServletRequest request)
			throws IllegalStateException, IOException {
		// file 업로드
		String uploadDir = request.getServletContext().getRealPath("/resources/images/");
		System.out.println(uploadDir);
		// 경로
		if (!introfile.isEmpty()) {
			String filename = introfile.getOriginalFilename();

			String fullPath = uploadDir +"/"+ filename;
			introfile.transferTo(new File(fullPath));
			intro.setIntro_img(filename);
		}
		System.out.println(intro.toString());
		introDao.introInsert(intro);
		model.addAttribute("intro", introDao.introSelectList());
		return "redirect:/intro.do";
	}
	// 스마트팜 소개 수정페이지 introupdateForm
	@RequestMapping(value = "/introupdateForm.do") 
	public String introupdateForm() {
		return "board/introupdateForm";
	}

	// 스마트팜 소개 수정페이지
	@RequestMapping(value = "/introupdate.do")
	public String introupdate(IntroVO intro,Model model,MultipartFile introfile, HttpServletRequest request) 
			throws IllegalStateException, IOException {
		// 경로 생성
		//String uploadDir = "D:\\SmartFarm\\src\\main\\webapp\\resources\\images\\";
		String uploadDir = request.getServletContext().getRealPath("/resources/images");
		System.out.println(uploadDir);
		// 경로
		if (!introfile.isEmpty()) {
			String filename = introfile.getOriginalFilename();

			String fullPath = uploadDir +"/"+ filename;
			introfile.transferTo(new File(fullPath));
			intro.setIntro_img(filename);
		}
		System.out.println(intro.toString());
		introDao.introUpdate(intro);
		model.addAttribute("intro", introDao.introSelectList());
		return "board/introupdate";
	}
	// 과수분야 소개 페이지
	@RequestMapping(value = "/introg.do") 
	public String introg(Model model) {
		model.addAttribute("introg", introDao.introSelectList());
		System.out.println(model);
		return "board/introg";
	}

	@RequestMapping(value = "/introinsertgForm.do") // 과수분야 등록 페이지
	public String introinsertg() {
		return "board/introinsertgForm";
	}

	@RequestMapping(value = "/introupdateFormg.do") // 과수분야 수정 페이지
	public String introupdateFormg() {

		return "board/introupdateFormg";
	}

	@RequestMapping(value = "/intron.do") // 노지분야 소개 페이지
	public String intron(Model model) {
		model.addAttribute("intron", introDao.introSelectList());
		System.out.println(model);
		return "board/intron";
	}

	@RequestMapping(value = "/introupdateFormn.do") // 노지분야 수정 페이지
	public String introupdateg() {
		return "board/introupdateFormn";
	}

	@RequestMapping(value = "/introinsertnForm.do") // 노지분야 등록 페이지
	public String introinsertn() {

		return "board/introinsertnForm";
	}
}

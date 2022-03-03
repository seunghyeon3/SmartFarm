package co.smartFarm.board.intro.introWeb;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.smartFarm.board.intro.introService.IntroService;
import co.smartFarm.board.intro.introService.IntroVO;

@Controller
public class IntroController {
	@Autowired
	private IntroService introDao;
	private File target;
	// 스마트팜 소개
	@RequestMapping(value = "/intro.do") 
	public String intro(IntroVO intro,Model model){
		System.out.println("메인 " + intro.getIntro_board_class());
		model.addAttribute("intro", introDao.introSelect(intro));
		System.out.println("메인 이미지 " + model.getAttribute("intro"));
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
		return "redirect:/intro.do?intro_board_class=intro3";
	}
	// 스마트팜 소개 수정페이지 introupdateForm
	@RequestMapping(value = "/introupdateForm.do") 
	public String introupdateForm(IntroVO intro, Model model) {
		model.addAttribute("intro", intro);
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
		return "redirect:/intro.do?intro_board_class=intro3";
	}
	// 과수분야 소개 페이지
	@RequestMapping(value = "/introg.do") 
	public String introg(IntroVO intro,Model model) {
		model.addAttribute("introg", introDao.introSelect(intro));
		System.out.println(model);
		return "board/introg";
	}
	
	// 과수분야 소개 등록 Form
	@RequestMapping(value = "/introinsertgForm.do") 
	public String introinsertg() {
		return "board/introinsertgForm";
	}
	// 과수분야 소개 등록 페이지 
	@RequestMapping(value = "/introginsert.do")
	public String introgInsert(IntroVO intro, Model model, MultipartFile introfile,HttpServletRequest request)
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
		model.addAttribute("introg", introDao.introSelectList());
		return "redirect:/introg.do?intro_board_class=intro2";
	}
	
	// 과수분야 수정 페이지 introupdategForm
	@RequestMapping(value = "/introupdateFormg.do") 
	public String introupdateFormg(IntroVO intro, Model model) {
		model.addAttribute("introg", intro);
		return "board/introupdateFormg";
	}
	// 과수분야 수정 페이지 
	@RequestMapping(value = "/introupdateg.do")
	public String introupgdate(IntroVO intro,Model model,MultipartFile introfile, HttpServletRequest request) 
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
		model.addAttribute("introg", introDao.introSelectList());
		return "redirect:/introg.do?intro_board_class=intro2";
	}
	// 노지분야 소개 페이지
	@RequestMapping(value = "/intron.do") 
	public String intron(IntroVO intro, Model model) {
		model.addAttribute("intron", introDao.introSelect(intro));
		System.out.println(model);
		return "board/intron";
	}
	// 노지분야 등록 페이지 Form
	@RequestMapping(value = "/introninsertForm.do")
	public String introninsert() {
		return "board/introninsertForm";
	}
	// 노지분야 등록 페이지
	@RequestMapping(value = "/introninsert.do")
	public String intronInsert(IntroVO intro, Model model, MultipartFile introfile,HttpServletRequest request)
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
		model.addAttribute("intron", introDao.introSelectList());
		return "redirect:/intron.do?intro_board_class=intro1";
	}
	// 노지분야 수정 페이지 Form
	@RequestMapping(value = "/introupdateFormn.do")
	public String intronupdate(IntroVO intro, Model model) {
		model.addAttribute("intron", intro);
		return "board/introupdateFormn";
	}
	
	// 노지분야 수정 페이지 
	@RequestMapping(value = "/intronupdate.do") 
	public String intronupdate(IntroVO intro,Model model,MultipartFile introfile, HttpServletRequest request) 
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
		model.addAttribute("intron", introDao.introSelectList());
		return "redirect:/intron.do?intro_board_class=intro1";
	}
}

package co.smartFarm.board;

import java.io.File;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IntroController {
	@Autowired 
	private IntroMapper introDao;
	private File target;
	
	@RequestMapping(value = "/intro.do")  //스마트팜 소개
	public String intro(Model model) {
		model.addAttribute("intro", introDao.introSelectList());
		System.out.println(introDao.introSelectList().toString());
		return "board/intro";
	}
	@RequestMapping(value = "/introinsertForm.do") //스마트팜 소개 등록페이지
	public String introinsert() {
		return "board/introinsertForm";
	}

	@RequestMapping("/introinsert.do") public String introinert(IntroVO
	 intro, Model model) { introDao.introInsert(intro);
	 model.addAttribute("intro", introDao.introSelectList()); 
	 return "board/introinsert"; 
	 }
	 
	 
	@RequestMapping(value = "/introupdateForm.do") //스마트팜 소개 수정페이지
	public String introupdateForm() {
		return "board/introupdateForm";
	}
	
	//스마트팜 소개 수정페이지
	@RequestMapping(value = "/introupdate.do", method=RequestMethod.GET) 
	public String introupdate(MultipartFile file,ModelAndView mv, String uploadPath) {
		 //경로 생성
        if ( ! new File(uploadPath).exists()) {
            new File(uploadPath).mkdirs();
        }
        //파일 복사
        try {
            FileCopyUtils.copy(file.getBytes(), target);
            mv.addObject("file", file);
        } catch(Exception e) {
            e.printStackTrace();
            mv.addObject("file", "error");
        }
		return "board/introupdate";
	}
	
	@RequestMapping(value = "/introg.do") //과수분야 소개 페이지
	public String introg(Model model) {
		model.addAttribute("introg", introDao.introSelectList());
		System.out.println(model);
		return "board/introg";
	}
	@RequestMapping(value = "/introinsertgForm.do") //과수분야 등록 페이지
	public String introinsertg() {
		return "board/introinsertgForm";
	}

	@RequestMapping(value = "/introupdateFormg.do") //과수분야 수정 페이지
	public String introupdateFormg() {

		return "board/introupdateFormg";
	}
	
	@RequestMapping(value = "/intron.do") //노지분야 소개 페이지 
	public String intron(Model model) {
		model.addAttribute("intron", introDao.introSelectList());
		System.out.println(model);
		return "board/intron";
	}

	@RequestMapping(value = "/introupdateFormn.do") //노지분야 수정 페이지
	public String introupdateg() {
		return "board/introupdateFormn";
	}
	
	@RequestMapping(value = "/introinsertnForm.do") //노지분야 등록 페이지
	public String introinsertn() {

		return "board/introinsertnForm"; 
	}
}

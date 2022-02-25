package co.smartFarm.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ArchieveController {

	@Autowired
	private ArchieveMapper archieveDao;

	//파일업로드
	private static final String FILE_SERVER_PATH = "c:/Temp/";

	@RequestMapping("/download")
	public ModelAndView download(@RequestParam HashMap<Object, Object> params, ModelAndView mv) {
		String fileName = (String) params.get("fileName");
		String fullPath = FILE_SERVER_PATH + "/" + fileName;
		File file = new File(fullPath);
		
		mv.setViewName("downloadView");
		mv.addObject("downloadFile", file);
		return mv;
	}
	
	
	@RequestMapping(value = "/archieve.do") // 자료실 리스트
	public String archieve(Model model) throws JsonProcessingException {
		ObjectMapper map = new ObjectMapper();
		String returnStr = map.writeValueAsString(archieveDao.archieveSelectList());
		model.addAttribute("archieve", returnStr);
		return "board/archieve";
	}

	// 자료실 상세페이지
	@RequestMapping(value = "/archieveselect.do")
	public String archieveselect(ArchieveVO archieve, Model model) {
		model.addAttribute("archieve", archieveDao.archieveSelect(archieve));
		return "board/archieveselect";
	}

	// 자료실 글쓰기 Form
	@RequestMapping(value = "/archieveinsertForm.do")
	public String archieveInsert() {
		return "board/archieveinsertForm";
	}

	// 자료실 글쓰기
	@RequestMapping("/archieveinsert.do")
	public String archieveInsert(ArchieveVO archieve, Model model,  MultipartFile archievefile)
			throws IllegalStateException, IOException {
		// file 업로드
		String uploadDir = "c:/Temp/";
		// 경로 생
		if (!archievefile.isEmpty()) {
			String filename = archievefile.getOriginalFilename();

			String fullPath = uploadDir + filename;
			archievefile.transferTo(new File(fullPath));
			archieve.setArchieve_img(filename);
		}
		System.out.println(archieve.toString());
		archieveDao.archieveInsert(archieve);
		model.addAttribute("notices", archieveDao.archieveSelectList());
		return "redirect:/archieve.do";
	}
	//이미지 다운로드 불러오기
	
	

	// 자료실 수정 Form
	@RequestMapping(value = "/archieveupdateForm.do")
	public String archieveupdateForm(@RequestParam("archieve_no") String test, ArchieveVO archieve, Model model) {
		System.out.println(archieve.toString());
		System.out.println(archieveDao.archieveSelect(archieve));
		model.addAttribute("archieve", archieveDao.archieveSelect(archieve));
		return "board/archieveupdateForm";
	}

	// 자료실 수정
	@RequestMapping(value = "/archieveupdate.do")
	public String archieveupdate(ArchieveVO archieve, Model model) {
		System.out.println("sadacsdgdfdf================" + archieve.toString());
		model.addAttribute("archieve", archieveDao.archieveUpdate(archieve));
		List<ArchieveVO> list = archieveDao.archieveSelectList();
		model.addAttribute("list", list);
		return "redirect:/archieve.do";
	}
}

package co.smartFarm.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

//3
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
public class NoticeController {

	@Autowired
	private NoticeMapper noticeDao;

	// 파일업로드
	private static final String FILE_SERVER_PATH = "c:/Temp/";

	/*
	 * @RequestMapping("/download") public ModelAndView download(@RequestParam
	 * HashMap<Object, Object> params, ModelAndView mv) { String fileName = (String)
	 * params.get("fileName"); String fullPath = FILE_SERVER_PATH + "/" + fileName;
	 * File file = new File(fullPath);
	 * 
	 * mv.setViewName("downloadView"); mv.addObject("downloadFile", file); return
	 * mv; }
	 */

	// 공지사항 리스트
	@RequestMapping(value = "/notice.do")
	public String notice(Model model) throws JsonProcessingException {
		ObjectMapper map = new ObjectMapper();
		String returnStr = map.writeValueAsString(noticeDao.noticeSelectList());
		model.addAttribute("notice", returnStr);
		System.out.println(returnStr);
		return "board/notice";
	}

	// 공지사항 상세페이지
	@RequestMapping(value = "/noticeselect.do")
	public String archieveselect(NoticeVO notice, Model model) {
		noticeDao.noticeHitUpdate(notice.getNotice_no());
		model.addAttribute("notice", noticeDao.noticeSelect(notice));
		return "board/noticeselect";
	}

	// 공지사항 글쓰기 Form
	@RequestMapping(value = "/noticeinsertForm.do")
	public String noticeInsert() {
		return "board/noticeinsertForm";
	}
	// 공지사항 글쓰기
	 @RequestMapping(value = "/noticeinsert.do")
	   public String archieveInsert(NoticeVO notice, Model model,  MultipartFile noticefile)
	         throws IllegalStateException, IOException {
	      // file 업로드
	      String uploadDir = "c:/Temp/";
	      // 경로 생
	      if (!noticefile.isEmpty()) {
	         String filename = noticefile.getOriginalFilename();

	         String fullPath = uploadDir + filename;
	         noticefile.transferTo(new File(fullPath));
	         notice.setNotice_img(filename);
	      }
	      System.out.println(notice.toString());
	      noticeDao.noticeInsert(notice);
	      model.addAttribute("notices", noticeDao.noticeSelectList());
	      return "redirect:/notice.do";
	   }
	// 공지사항 수정 Form
	  @RequestMapping(value = "/noticeupdateForm.do")
	   public String noticeupdateForm(@RequestParam("notice_no") String test, NoticeVO notice, Model model){
	      System.out.println(notice.toString());
	      System.out.println(noticeDao.noticeSelect(notice));
	      model.addAttribute("notice", noticeDao.noticeSelect(notice));
	      return "board/noticeupdateForm";
	   }
	// 공지사항 수정 
	  @RequestMapping(value = "/noticeupdate.do")
	   public String noticeupdate(NoticeVO notice, Model model) {
	      System.out.println("sadacsdgdfdf================" + notice.toString());
	      model.addAttribute("notice", noticeDao.noticeUpdate(notice));
	      List<NoticeVO> list = noticeDao.noticeSelectList();
	      model.addAttribute("list", list);
	      return "redirect:/notice.do";
	   }
	// 자료실 삭제
	  @RequestMapping("/noticedelete.do")
	   public String noticeDelete(@RequestParam(value="notice_no")int notice_no,Model model) {
	      System.out.println(notice_no);
	      NoticeVO notice = new NoticeVO();
	      notice.setNotice_no(notice_no);
	      noticeDao.noticeDelete(notice);
	      model.addAttribute("notices", noticeDao.noticeSelectList());
	      return "redirect:/notice.do";
	   }
	// 자료실 조회
	   @RequestMapping("noticehitUpdate/.do")
	   public String noticeHitUpdate(@RequestParam(value="notice_no")int notice_no,Model model) {
	      System.out.println(notice_no);
	      return "board/notice";
	   }
}

package co.smartFarm.board;
//3
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeMapper noticeDao;
	
	@RequestMapping(value = "/notice.do") //공지사항 리스트
	public String notice(Model model) throws JsonProcessingException {
		 ObjectMapper map = new ObjectMapper(); 
		 String returnStr = map.writeValueAsString(noticeDao.noticeSelectList());
		 model.addAttribute("notice", returnStr); 
		 System.out.println(returnStr);
		 return "board/notice";
	}
	@RequestMapping(value = "/noticea.do") //
	public String noticea() {
		
		return "board/noticea";
	}
	@RequestMapping(value = "/noticeinsert.do") //공지사항 글쓰기
	public String noticeinsert() {
		
		return "board/noticeinsert";
	}
	@RequestMapping(value = "/noticeselect.do") //공지사항 상세조회
	public String noticeselect(NoticeVO notice, Model model ){
		model.addAttribute("notice", noticeDao.noticeSelect(notice)); 
		return "board/noticeselect";
	}
	@RequestMapping(value = "/noticeupdateForm.do") //공지사항 수정
	public String noticeupdateForm() {
		
		return "board/noticeupdateForm";
	}
}

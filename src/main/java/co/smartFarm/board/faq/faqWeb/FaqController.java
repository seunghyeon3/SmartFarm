package co.smartFarm.board.faq.faqWeb;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.smartFarm.board.Archieve.archieveService.ArchieveVO;
import co.smartFarm.board.faq.faqService.FaqService;
import co.smartFarm.board.faq.faqService.FaqVO;
import co.smartFarm.board.notice.noticeService.NoticeVO;

@Controller
public class FaqController {

	@Autowired
	FaqService faqDao;
	
	// FAQ 리스트 
	 @RequestMapping(value = "/faq.do") 
	   public String faq(Model model) throws JsonProcessingException {
		 
	     ObjectMapper map = new ObjectMapper();
	     List<FaqVO> faqvo = faqDao.faqSelectList();
	     for( int i =0; i<faqvo.size(); i++) {
	    	 faqvo.get(i).setFaq_title(faqvo.get(i).getFaq_title().replace("\r\n", "<br>"));
	    	 faqvo.get(i).setFaq_con(faqvo.get(i).getFaq_con().replace("\r\n", "<br>"));
	     }
			 model.addAttribute("faq",faqvo);
			 model.addAttribute("faqP", map.writeValueAsString(faqvo));
	     return "board/faq";
	   }
	// FAQ 글쓰기 Form
	 @RequestMapping(value = "/faqinsertForm.do")
	   public String faqInsert() {
	      return "board/faqinsertForm";
	   }
	 // FAQ 글쓰기
	 @RequestMapping(value = "/faqinsert.do")
	 public String faqInsert(FaqVO faq, Model model) {
		 faq.setFaq_con(faq.getFaq_con().replace("<br>","\r\n"));
		 System.out.println(faq.getFaq_title());
		 faqDao.faqInsert(faq);
		 model.addAttribute("faq", faqDao.faqSelectList());
		 return "redirect:/faq.do";
	 }	 
	 // FAQ 수정 Form
	  @RequestMapping(value = "/faqupdateForm.do")
	   public String faqupdateForm(@RequestParam("faq_no") String test, FaqVO faq, Model model){
	      
		 faq = faqDao.faqSelect(faq);
		 faq.setFaq_con(faq.getFaq_con().replace("<br>","\r\n"));
		  model.addAttribute("faq",faq);
	      return "board/faqUpdateForm";
	   }
	  // FAQ 수정
	  @RequestMapping("/faqupdate.do")
	  public String faqUpdate(FaqVO faq) {
		  faq.setFaq_con(faq.getFaq_con().replace("\r\n","<br>"));
		  System.out.println(faq.toString());
		  faqDao.faqUpdate(faq);
		  return "redirect:/faq.do";
	  }	 
	  // FAQ 삭제 
	  @RequestMapping("/faqdelete.do")
	   public String faqDelete(FaqVO faq,Model model) {
	      faqDao.faqDelete(faq);
	      model.addAttribute("faq", faqDao.faqSelectList());
	      return "redirect:/faq.do";
	   }
	// 검색 
			@PostMapping(value = "faqSearch.do")
			@ResponseBody
			public List<FaqVO> faqSearch(@RequestBody String req) {

				JSONObject object = new JSONObject(req);

				String key = object.getString("key");
				String val = object.getString("val");

				return faqDao.faqSearch(key, val);
			}
			
			
	 
}

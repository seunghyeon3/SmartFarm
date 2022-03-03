package co.smartFarm.board.faq.faqWeb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.smartFarm.board.Archieve.archieveService.ArchieveVO;
import co.smartFarm.board.faq.faqService.FaqService;
import co.smartFarm.board.faq.faqService.FaqVO;

@Controller
public class FaqController {

	@Autowired
	FaqService faqDao;
	
	// FAQ 리스트 
	 @RequestMapping(value = "/faq.do") 
	   public String faq(Model model) throws JsonProcessingException {
	      ObjectMapper map = new ObjectMapper();
	      String returnStr = map.writeValueAsString(faqDao.faqSelectList());
	      model.addAttribute("faq", returnStr);
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
		  System.out.println(faq.getFaq_title());
		  faqDao.faqInsert(faq);
	      model.addAttribute("faq", faqDao.faqSelectList());
	      return "redirect:/faq.do";
	   }	 
	 // FAQ 수정 Form
	  @RequestMapping(value = "/faqupdateForm.do")
	   public String faqupdateForm(@RequestParam("faq_no") String test, FaqVO faq, Model model){
	      System.out.println(faq.toString());
	      System.out.println(faqDao.faqSelect(faq));
	      model.addAttribute("faq", faqDao.faqSelect(faq));
	      return "board/faqupdateForm";
	   }
	  // FAQ 수정 
	  @RequestMapping(value = "/faqupdate.do")
	   public String archieveupdate(FaqVO faq, Model model) {
	      System.out.println("sadacsdgdfdf================" + faq.toString());
	      model.addAttribute("archieve", faqDao.faqUpdate(faq));
	      List<FaqVO> list = faqDao.faqSelectList();
	      model.addAttribute("list", list);
	      return "redirect:/faq.do";
	   }
	  // FAQ 삭제 
	  @RequestMapping("/faqdelete.do")
	   public String faqDelete(@RequestParam(value="faq_no")int faq_no,Model model) {
	      System.out.println(faq_no);
	      FaqVO faq = new FaqVO();
	      faq.setFaq_no(faq_no);
	      faqDao.faqDelete(faq);
	      model.addAttribute("faq", faqDao.faqSelectList());
	      return "redirect:/faq.do";
	   }
	 
}

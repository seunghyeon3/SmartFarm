package co.smartFarm.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ArchieveController {

	@Autowired
	private ArchieveMapper archieveDao;
	
	@RequestMapping(value = "/archieve.do") //자료실 리스트
	public String archieve(Model model) throws JsonProcessingException {
		 ObjectMapper map = new ObjectMapper(); 
		 String returnStr = map.writeValueAsString(archieveDao.archieveSelectList());
		 model.addAttribute("archieve", returnStr); 
		 System.out.println(returnStr);
		 return "board/archieve";
	}
	//자료실 상세페이지
    @RequestMapping(value = "/archieveselect.do")
    public String archieveselect(ArchieveVO archieve, Model model ) {
    	model.addAttribute("archieve", archieveDao.archieveSelect(archieve)); 
    	return "board/archieveselect";
    }

    //자료실 글쓰기
	@RequestMapping(value = "/archieveinsert.do") 
	public String archieveinsert() {
		
		return "board/archieveinsert";
	}
	//자료실 수정
	@RequestMapping(value = "/archieveupdateForm.do") 
	public String archieveupdateForm() {
		
		return "board/archieveupdateForm";
	}
  
}

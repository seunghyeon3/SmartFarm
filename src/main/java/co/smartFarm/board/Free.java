package co.smartFarm.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Free {

//	@Autowired
//	private FreeMapper freeDao;
	
//	자유게시판
	@RequestMapping(value = "/freeBoard.do")
	public String free(Model model) {

		 return "board/freeBd";
	}
	
	
//	자유게시판 상세
//    @RequestMapping(value = "/.do")
//    public String (VO, Model model ) {
//    	model.addAttribute("", VO.()); 
//    	return "board/freeD";
//    }
//
//  자유게시판 글쓰기
//	@RequestMapping(value = "/.do") 
//	public String () {
//		
//		return "board/freeW";
//	}
//	자유게시판 수정
//	@RequestMapping(value = "/.do") 
//	public String () {
//		
//		return "board/freeE";
//	}
  
}

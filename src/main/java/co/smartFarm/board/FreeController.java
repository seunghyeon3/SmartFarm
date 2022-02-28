package co.smartFarm.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FreeController {

    @Autowired
    private FreeMapper freeDao;

    @RequestMapping(value = "/free.do") //자료실 리스트
    public String free(Model model) throws JsonProcessingException {
    	
		ObjectMapper map = new ObjectMapper();
		
		String Str = map.writeValueAsString(freeDao.freeList());
    	
		model.addAttribute("test", Str);
		
		return "board/free";
    }

    //자유게시판 상세페이지
    @RequestMapping(value = "/freeOne.do")
    public String freeOne(int free_no, Model model ) {
        model.addAttribute(freeDao.freeOne(free_no)); 
        System.out.println(model);
        return "board/freeone";
    }

    //자료실 글쓰기
    @RequestMapping(value = "/freeInsertForm.do") 
    public String freeInsertForm() {

        return "board/freeinsertform";
    }
    //자료실 수정
    @RequestMapping(value = "/freeUpdateForm.do") 
    public String freeUpdateForm() {

        return "board/freeupdateform";
    }

}
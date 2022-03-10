package co.smartFarm.grow.growDiaryWeb;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.smartFarm.grow.growDiaryService.GrowDiaryService;

@Controller
public class GrowDiaryController {
	@Autowired
	//220302 PSH GrowDiaryMapper mapGD에서 아래 내용오르 수정
	GrowDiaryService growDiaryDao;
	
//	영농 일지 페이지
	//220302 PSH GrowController -> GrowDiaryController 구분 작업
	@RequestMapping(value = "/diary.do", method = RequestMethod.GET)
	public String diary(Locale locale, Model model, HttpSession session) {

//		테스트용
		session.setAttribute("email", "aaa@abc.com");
		
//		영농 일지 출력
		//220302 PSH mapGD -> growDiaryDao로 수정
		model.addAttribute("diary", growDiaryDao.growDiaryMyList(session.getAttribute("email").toString()));
		System.out.println(growDiaryDao.growDiaryMyList(session.getAttribute("email").toString()));

		return "grow/diary";
	}
	
//	영농일지 내용 출력
	@RequestMapping("/diaryBody.do")
	@ResponseBody
	public List<String> diaryBody(String route) throws Exception {
		
		System.out.println(route);

		Path path = Paths.get("D:\\"+route);
		List<String> lines = java.nio.file.Files.readAllLines(path);
		
		return lines;
	}
}

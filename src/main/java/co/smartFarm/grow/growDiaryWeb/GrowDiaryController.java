package co.smartFarm.grow.growDiaryWeb;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.smartFarm.grow.growDiaryService.GrowDiaryService;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class GrowDiaryController {
	//220302 PSH GrowDiaryMapper mapGD에서 아래 내용오르 수정
	@Autowired
	GrowDiaryService growDiaryDao;
	@Autowired
	private String saveDir;
	
//	영농 일지 페이지
	//220302 PSH GrowController -> GrowDiaryController 구분 작업
	@RequestMapping(value = "/diary.do", method = RequestMethod.GET)
	public String diary(Locale locale, Model model, HttpSession session) throws JsonProcessingException {
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return "redirect:login.do";
		}
//		영농 일지 출력
		//220302 PSH mapGD -> growDiaryDao로 수정
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memEmail = userDetails.getUsername();
		
		ObjectMapper map = new ObjectMapper();
		String diary = map.writeValueAsString(growDiaryDao.growDiaryMyList(memEmail));
		model.addAttribute("diary", diary);
		System.out.println(diary);

		return "grow/diary";
	}
	
//	영농일지 내용 출력
	@RequestMapping("/diaryBody.do")
	@ResponseBody
	public List<String> diaryBody(String route) throws Exception {
		
		System.out.println(route);

		Path path = Paths.get(saveDir+route);
		List<String> lines = java.nio.file.Files.readAllLines(path);
		
		return lines;
	}
}

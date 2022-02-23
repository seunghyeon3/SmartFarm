package co.smartFarm.grow;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GrowController {

	@Autowired
	GrowDiaryMapper mapGD;
	
	@Autowired
	GrowMapper mapG;

//	재배 진행 정보 페이지
	@RequestMapping(value = "/grow.do", method = RequestMethod.GET)
	public String grow(Locale locale, Model model, HttpSession session) {
//		테스트용
		session.setAttribute("email", "aaa@abc.com");
		
//		세션 이메일 사용
		model.addAttribute(mapG.growList(session.getAttribute("email").toString()));
		System.out.println(model);

		return "grow/grow";
	}

//	키트 사용법 페이지
	@RequestMapping(value = "/howTo.do", method = RequestMethod.GET)
	public String howTo(Locale locale, Model model) {

		return "grow/howto";
	}

//	cctv 모니터링 페이지
	@RequestMapping(value = "/cctv.do", method = RequestMethod.GET)
	public String cctv(Locale locale, Model model) {

		return "grow/cctv";
	}

//	재배 관리 페이지
	@RequestMapping(value = "/control.do", method = RequestMethod.GET)
	public String control(Locale locale, Model model) {

		return "grow/control";
	}

//	실시간 정보 페이지
	@RequestMapping(value = "/sensor.do", method = RequestMethod.GET)
	public String sensor(Locale locale, Model model) {

		return "grow/sensor";
	}

//	재배 로그 페이지
	@RequestMapping(value = "/log.do", method = RequestMethod.GET)
	public String log(Locale locale, Model model, HttpSession session) {

//		테스트용
		session.setAttribute("email", "aaa@abc.com");
		
//		세션 이메일 사용
		String user = session.getAttribute("email").toString();
		
		String DATA_DIRECTORY = "D:\\";
		File dir = new File(DATA_DIRECTORY);
		
		FilenameFilter filter = new FilenameFilter() {
			
			public boolean accept(File f, String name) {
//				파일 이름에 user 이메일이 붙은것들만 필터링 
				return name.contains(user);
			}
			
		};

		String[] filenames = dir.list(filter);
		model.addAttribute("filenames", filenames);
		
//		로그
		System.out.println(model);
		
//		키트 목록 출력
		model.addAttribute("kitList", mapG.growList(session.getAttribute("email").toString()));
		System.out.println(model);


		return "grow/log";
	}

//	로그파일 내용 출력
	@RequestMapping("/logBody.do")
	@ResponseBody
	public List<String> logBody(String file) throws Exception {

		String test = "D:\\" + file;
		
//		로그
		System.out.println(test);

		Path path = Paths.get(test);
		List<String> lines = java.nio.file.Files.readAllLines(path);
		
//		로그
		System.out.println(lines);
		
		return lines;
	}

//	영농 일지 페이지
	@RequestMapping(value = "/diary.do", method = RequestMethod.GET)
	public String diary(Locale locale, Model model) {

		model.addAttribute("test", mapGD.growDiaryMyList("aaa@abc.com"));
		System.out.println(mapGD.growDiaryMyList("aaa@abc.com"));

		return "grow/diary";
	}

}

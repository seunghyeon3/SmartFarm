package co.smartFarm.grow;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


@Controller
public class GrowController {

	private static final int String = 0;

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

		return "grow/growhome";
	}

//	키트 사용법 페이지
	@RequestMapping(value = "/howTo.do", method = RequestMethod.GET)
	public String howTo(Locale locale, Model model) {

		return "grow/howto";
	}

//	cctv 모니터링 페이지
	@RequestMapping(value = "/cctv.do", method = RequestMethod.GET)
	public String cctv(Locale locale, Model model, HttpSession session) {
		
//		테스트용
		session.setAttribute("email", "aaa@abc.com");
		
//		키트 목록 출력
		model.addAttribute("kitList", mapG.growComList(session.getAttribute("email").toString()));
		System.out.println(model);

		return "grow/cctv";
	}

//	재배 관리 페이지
	@RequestMapping(value = "/control.do", method = RequestMethod.GET)
	public String control(Locale locale, Model model, HttpSession session) {
		
//		테스트용
		session.setAttribute("email", "aaa@abc.com");
		
//		키트 목록 출력
		model.addAttribute("kitList", mapG.growList(session.getAttribute("email").toString()));
		System.out.println(model);
		return "grow/control";
	}

//	실시간 정보 페이지
	@RequestMapping(value = "/sensor.do", method = RequestMethod.GET)
	public String sensor(Locale locale, Model model, HttpSession session) {
		
//		테스트용
		session.setAttribute("email", "aaa@abc.com");
		
//		키트 목록 출력
		model.addAttribute("kitList", mapG.growList(session.getAttribute("email").toString()));
		System.out.println(model);
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

//		텍스트 내용 읽기
		Path path = Paths.get(test);
		List<String> lines = java.nio.file.Files.readAllLines(path);
		
//		로그
		System.out.println(lines);
		
		return lines;
	}

//	영농 일지 페이지
	@RequestMapping(value = "/diary.do", method = RequestMethod.GET)
	public String diary(Locale locale, Model model, HttpSession session) {

//		테스트용
		session.setAttribute("email", "bbb@abc.com");
		
//		영농 일지 출력
		model.addAttribute("diary", mapGD.growDiaryMyList(session.getAttribute("email").toString()));
		System.out.println(mapGD.growDiaryMyList(session.getAttribute("email").toString()));

		return "grow/diary";
	}
	
//	영농일지 내용 출력
	@RequestMapping("/diaryBody.do")
	@ResponseBody
	public List<String> diaryBody(String route) throws Exception {
		System.out.println(route);

		Path path = Paths.get(route);
		List<String> lines = java.nio.file.Files.readAllLines(path);
		
		return lines;
	}
	
	@RequestMapping(value = "/testURL.do", method = RequestMethod.POST)
	@ResponseBody
	public String test(HttpServletRequest request, HttpSession session) {
		
		session.setAttribute("email", "aaa@abc.com");

		String email = session.getAttribute("email").toString();
		
		List<GrowVO> test = mapG.orderNumber(email);
		
		Gson gson = new Gson();
		
		List<String> resultTest = gson.fromJson(request.getParameter(Integer.toString(test.get(0).getPur_his_order_no())), List.class);
		
		System.out.println(resultTest.get(0));
		
		System.out.println(request.getParameter(Integer.toString(test.get(0).getPur_his_order_no())));	
		
		String logRoute = "D:\\" + email + ".txt";
		
		try {
			File file = new File(logRoute);
			
			if(!file.exists()) {
				file.createNewFile();
			}
			
			FileWriter fileWriter = new FileWriter(file, true);
			PrintWriter writer = new PrintWriter(fileWriter);
			
			writer.println(resultTest.get(0).toString());
			
			writer.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "log-updated";
	}
	
	

}

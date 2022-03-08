package co.smartFarm.grow.growWeb;

import java.io.File;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.smartFarm.grow.growService.GrowService;
import co.smartFarm.grow.growService.GrowVO;


@Controller
public class GrowController {

	//220302 PSH 쓴 이유..?
	private static final int String = 0;

	@Autowired
	//220302 PSH GrowMapper mapG 에서 아래 내용오르 수정
	GrowService growDao;

//	재배 진행 정보 페이지
	@RequestMapping(value = "/grow.do", method = RequestMethod.GET)
	public String grow(Locale locale, Model model, HttpSession session) throws ParseException {
//		테스트용
		session.setAttribute("email", "aaa@abc.com");
		
//		세션 이메일 사용
		
		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute(mapG.growList(session.getAttribute("email").toString()));
		System.out.println(session.getAttribute("email").toString());
		List<GrowVO> voList = growDao.growListing(session.getAttribute("email").toString());
//		int gd = 0;
////        Calendar cal = Calendar.getInstance();
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
//		Date currentTime = new Date();
//		String now;
//		now = format.format(currentTime);
//
//		for(int i = 0; i<voList.size(); i++) {
//			
//			if(voList.get(i).getGrow_status()!=null) {
//				gd = voList.get(i).getKit_grow_day();
//				String sd = voList.get(i).getGrow_status();
//				System.out.println(sd);
//				Date s_date = format.parse(sd);
//				Date c_date = format.parse(now);
////				cal.setTime(s_date);
////				cal.add(Calendar.DATE, gd);
////				Date e_date = format.parse(format.format(cal.getTime()));
//				System.out.println(s_date);
//				System.out.println(c_date);
////				System.out.println(e_date);
//		        float diffSec = (c_date.getTime() - s_date.getTime()) / 1000; //초 차이
//		        System.out.println(diffSec);
//				int diffDays = Math.round(diffSec*100/(24*60*60*gd)); //일자수 차이
//				System.out.println(diffDays);
//				voList.get(i).setPercent(diffDays);
//			}
//		}
		
		System.out.println(voList.toString());
		model.addAttribute("list", voList);
		
		System.out.println(model);
		
		
		
//		System.out.println(vo.get(2).getPur_his_kit_address());
//		HttpHeaders headers = new HttpHeaders();
//		// 파라미터 설정 
//		MultiValueMap<String, String> params = new LinkedMultiValueMap<>(); 
//		// params.add("key", "value");
//		// Request 설정 
//		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
//		RestTemplate restTemplate = new RestTemplate();
//		String url = "http://" + vo.get(2).getPur_his_kit_address() + "/checkGrow";
////		String url = "http://192.168.111.1:81/checkGrow";
//		System.out.println(url);
//		String response = restTemplate.getForObject(url, String.class);
//		System.out.println(response);
//		
////		model.addAttribute("no1", response1);
		
		
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
		
		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute("kitList", mapG.growComList(session.getAttribute("email").toString()));
		model.addAttribute("kitList", growDao.growComList(session.getAttribute("email").toString()));
		System.out.println(model);

		return "grow/cctv";
	}

//	재배 관리 페이지
	@RequestMapping(value = "/control.do", method = RequestMethod.GET)
	public String control(Locale locale, Model model, HttpSession session) {
		
//		테스트용
		session.setAttribute("email", "aaa@abc.com");
		
//		키트 목록 출력
		
		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute("kitList", mapG.growList(session.getAttribute("email").toString()));
		List<GrowVO> voList = growDao.growListing(session.getAttribute("email").toString());
		model.addAttribute("kitList", voList);
		System.out.println(model);
		return "grow/control";
	}

//	실시간 정보 페이지
	@RequestMapping(value = "/sensor.do", method = RequestMethod.GET)
	public String sensor(Locale locale, Model model, HttpSession session) {
		
//		테스트용
		session.setAttribute("email", "aaa@abc.com");
		
//		키트 목록 출력
		
		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute("kitList", mapG.growList(session.getAttribute("email").toString()));
		model.addAttribute("kitList", growDao.growList(session.getAttribute("email").toString()));
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
		
		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute("kitList", mapG.growList(session.getAttribute("email").toString()));
		model.addAttribute("kitList", growDao.growList(session.getAttribute("email").toString()));
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


	
//	영농일지 내용 출력
	@RequestMapping("/diaryBody.do")
	@ResponseBody
	public List<String> diaryBody(String route) throws Exception {
		System.out.println(route);

		Path path = Paths.get(route);
		List<String> lines = java.nio.file.Files.readAllLines(path);
		
		return lines;
	}
	
//	키트에서 로그전송
	@RequestMapping(value = "/logger.do", method = RequestMethod.POST)
	@ResponseBody
	public String logger(HttpServletRequest request, HttpSession session) {
		
		session.setAttribute("email", "aaa@abc.com");

		String email = session.getAttribute("email").toString();
		
		//220302 PSH mapG -> growDao로 수정
		//List<GrowVO> test = mapG.orderNumber(email);
		List<GrowVO> oNum = growDao.orderNumber(email);
		
		Gson gson = new Gson();
		
		List<String> resultTest = gson.fromJson(request.getParameter(Integer.toString(oNum.get(0).getPur_his_order_no())), List.class);
		
		System.out.println(resultTest.get(0));
		
		System.out.println(request.getParameter(Integer.toString(oNum.get(0).getPur_his_order_no())));	
		
		String logRoute = "D:\\" + email + ".txt";
		
		try {
			File file = new File(logRoute);
			
			if(!file.exists()) {
				file.createNewFile();
			}
			
			FileWriter fileWriter = new FileWriter(file, true);
			PrintWriter writer = new PrintWriter(fileWriter);
			
			for(int i=0; i<resultTest.size(); i++) {
				System.out.println(resultTest.get(i));
				writer.println(resultTest.get(i).toString());
			}
//			writer.println(resultTest.get(0).toString());
			
			writer.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "log-updated";
	}
	
	@RequestMapping(value = "/addressUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String addressUpdate(HttpServletRequest request) {
		
		Gson gson = new Gson();
		
		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);
		
		Map<String, String> map = new HashMap<String, String>();

		for(int i=0; i<resultTest.size(); i++) {
			System.out.println(resultTest.get(i));
		}
		
		map.put("no", resultTest.get(0));
		map.put("ip", resultTest.get(1));
		
		growDao.addressUpdate(map);
		
		
		
		return "address-updated";
	}
	
	@RequestMapping(value = "/statusUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String statusUpdate(HttpServletRequest request) {
		
		Gson gson = new Gson();
		
		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);
		
		Map<String, String> map = new HashMap<String, String>();

		for(int i=0; i<resultTest.size(); i++) {
			System.out.println(resultTest.get(i));
		}
		
		map.put("no", resultTest.get(0));
		map.put("status", resultTest.get(1));
		
		growDao.statusUpdate(map);
		
		
		
		return "status-updated";
	}
	
	@RequestMapping(value = "/diaryWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public String diaryWrite(HttpServletRequest request, HttpSession session) {
		session.setAttribute("email", "aaa@abc.com");

		Gson gson = new Gson();
		
		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);
		
		Map<String, String> map = new HashMap<String, String>();

		for(int i=0; i<resultTest.size(); i++) {
			System.out.println(resultTest.get(i));
		}
		map.put("email", session.getAttribute("email").toString());
		map.put("log", session.getAttribute("email").toString()+resultTest.get(5)+resultTest.get(3).substring(0, 10)+".txt");
		map.put("score", resultTest.get(0));
		map.put("grade", resultTest.get(1));
		map.put("plant", resultTest.get(2));
		map.put("sday", resultTest.get(3));
		map.put("kno", resultTest.get(4));

		System.out.println(map.toString());
		growDao.diaryWrite(map);
		
		return "Diary-updated";
	}
	
	@RequestMapping(value = "/testURL.do", method = RequestMethod.POST)
	@ResponseBody
	public String test(HttpServletRequest request) {
		
		Gson gson = new Gson();
		
		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);
		
		for(int i=0; i<resultTest.size(); i++) {
			System.out.println(resultTest.get(i));
		}
		
		
		return "test succeed";
	}
	

}

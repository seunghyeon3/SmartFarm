package co.smartFarm.grow.growWeb;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kenai.jffi.Array;

import co.smartFarm.grow.growService.GrowService;
import co.smartFarm.grow.growService.GrowVO;
import co.smartFarm.user.memberService.MemberVO;


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
//		session.setAttribute("email", "aaa@abc.com");
		
//		세션 이메일 사용
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		
		List<GrowVO> voList = growDao.growListing(memEmail);

		System.out.println(voList.toString());
		model.addAttribute("list", voList);
		System.out.println(model);
		
		return "grow/growhome";
		
		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute(mapG.growList(session.getAttribute("email").toString()));
//		System.out.println(session.getAttribute("email").toString());
//		List<GrowVO> voList = growDao.growListing(session.getAttribute("email").toString());
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
//		session.setAttribute("email", "aaa@abc.com");
		
//		키트 목록 출력
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		model.addAttribute("kitList", growDao.growComList(memEmail));
		System.out.println(model);
		
		return "grow/cctv";

		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute("kitList", mapG.growComList(session.getAttribute("email").toString()));
	}

//	재배 관리 페이지
	@RequestMapping(value = "/control.do", method = RequestMethod.GET)
	public String control(Locale locale, Model model, HttpSession session, String no) {
		
//		테스트용
//		session.setAttribute("email", "aaa@abc.com");
		
//		키트 목록 출력
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		
		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute("kitList", mapG.growList(session.getAttribute("email").toString()));
		List<GrowVO> voList = growDao.growListing(memEmail);
		model.addAttribute("kitList", voList);
		System.out.println(model);
		if(no != null) {
			model.addAttribute("no", no);
		}
		return "grow/control";
	}

//	실시간 정보 페이지
	@RequestMapping(value = "/sensor.do", method = RequestMethod.GET)
	public String sensor(Locale locale, Model model, HttpSession session) {
		
//		테스트용
//		session.setAttribute("email", "aaa@abc.com");
		
//		키트 목록 출력
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		model.addAttribute("kitList", growDao.growListing(memEmail));
		System.out.println(model);
		
		return "grow/sensor";
		
		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute("kitList", mapG.growList(session.getAttribute("email").toString()));
	}

//	재배 로그 페이지
	@RequestMapping(value = "/log.do", method = RequestMethod.GET)
	public String log(Locale locale, Model model, HttpSession session, String no) {

//		테스트용
//		session.setAttribute("email", "aaa@abc.com");
		
//		세션 이메일 사용
//		String user = session.getAttribute("email").toString();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		
		String DATA_DIRECTORY = "D:\\";
		File dir = new File(DATA_DIRECTORY);
		
		FilenameFilter filter = new FilenameFilter() {
			public boolean accept(File f, String name) {
//				파일 이름에 user 이메일이 붙은것들만 필터링 
				return name.contains(memEmail);
			}
		};
		String[] filenames = dir.list(filter);
		model.addAttribute("filenames", filenames);
		
//		로그
		System.out.println(model);
		
//		키트 목록 출력
		//220302 PSH mapG -> growDao로 수정
		//model.addAttribute("kitList", mapG.growList(session.getAttribute("email").toString()));
		model.addAttribute("kitList", growDao.growListing(memEmail));
		if(no != null) {
			model.addAttribute("no", no);
		}
		System.out.println(model);
		return "grow/log";
	}

//	로그파일 내용 출력
	@RequestMapping("/logBody.do")
	@ResponseBody
	public List<String> logBody(@RequestParam Map<String, String> param) throws Exception {

		String test = "D:\\" + param.get("file") + ".txt";
		
//		로그
		System.out.println(test);

		StringBuffer sb = new StringBuffer();
		FileReader readFile;
		BufferedReader br;
		String getLine;
//		텍스트 내용 읽기
		List<String> lines = new ArrayList<>();
		try {
			readFile = new FileReader(test);
			br = new BufferedReader(readFile);
			
			while((getLine=br.readLine())!=null) {
				System.out.println(getLine);
				if(getLine.startsWith(param.get("date"))) {
					lines.add(getLine);
				}
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		Path path = Paths.get(test);
//		List<String> lines = Files.readLines(null, null)
//		로그
//		System.out.println(lines);
		
		return lines;
	}



	
//	키트에서 로그전송
	@RequestMapping(value = "/logger.do", method = RequestMethod.POST)
	@ResponseBody
	public String logger(HttpServletRequest request, HttpSession session) {
		
//		session.setAttribute("email", "aaa@abc.com");
//		String email = session.getAttribute("email").toString();
		//220302 PSH mapG -> growDao로 수정
		//List<GrowVO> test = mapG.orderNumber(email);
		String deviceId = request.getParameter("id");
		String memEmail = growDao.kitOwner(Integer.parseInt(deviceId));
		String sd = request.getParameter("sd").substring(0, 10);
		
		Gson gson = new Gson();
		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);
		
//		System.out.println(resultTest.get(0));
//		System.out.println(request.getParameter(Integer.toString(oNum.get(0).getPur_his_order_no())));	
		
		String logRoute = "D:\\" + memEmail+deviceId+sd + ".txt";
		System.out.println(logRoute);
		
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
	
//	@RequestMapping(value = "/statusUpdate.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String statusUpdate(HttpServletRequest request) {
//		
//		Gson gson = new Gson();
//		
//		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);
//		
//		Map<String, String> map = new HashMap<String, String>();
//
//		for(int i=0; i<resultTest.size(); i++) {
//			System.out.println(resultTest.get(i));
//		}
//		
//		map.put("no", resultTest.get(0));
//		map.put("status", resultTest.get(1));
//		
//		growDao.statusUpdate(map);
//		
//		
//		
//		return "status-updated";
//	}
	
	@RequestMapping(value = "/diaryWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public String diaryWrite(HttpServletRequest request, HttpSession session) {
//		session.setAttribute("email", "aaa@abc.com");
//		MemberVO member = (MemberVO) session.getAttribute("member");
//		
//		String memEmail = member.getMem_email();
		
		Gson gson = new Gson();
		
		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);
		
		Map<String, String> map = new HashMap<String, String>();

		for(int i=0; i<resultTest.size(); i++) {
			System.out.println(resultTest.get(i));
		}
		System.out.println(resultTest.get(5));
		String memEmail = growDao.kitOwner(Integer.parseInt(resultTest.get(5)));
		
		map.put("email", memEmail);
		map.put("log", memEmail+resultTest.get(5)+resultTest.get(3).substring(0, 10)+".txt");
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
	
	
//	nft목록출력
	@RequestMapping("/nftList.do")
	@ResponseBody
	public List<GrowVO> nftList(@RequestParam Map<String, String> param, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");

		Map<String, String> map = new HashMap<>();
		System.out.println(param.get("kit_no"));
		map.put("kitNo", param.get("kit_no"));
		map.put("memEmail", member.getMem_email());
//		Path path = Paths.get(test);
//		List<String> lines = Files.readLines(null, null)
//		로그
//		System.out.println(lines);
		
		return growDao.nftList(map);
	}

//	nft로그분석재배값추출
	@RequestMapping("/nftValue.do")
	@ResponseBody
	public Map<String, String> nftList(String nft) throws Exception {
		Map<String, String> map = new HashMap<>();
		
		String test = "D:\\" + nft;
		
//		로그
		System.out.println(test);

		FileReader readFile;
		BufferedReader br;
		String getLine;
//		텍스트 내용 읽기
		try {
			readFile = new FileReader(test);
			br = new BufferedReader(readFile);
			
			getLine = br.readLine();

			System.out.println(getLine);
			String[] parse1 = getLine.split("\\(");
			System.out.println(parse1[1]);
			String[] parse2 = parse1[1].split("\\:");
			System.out.println(Arrays.toString(parse2));
			map.put("temp", parse2[1].replaceAll("[^0-9]", ""));
			map.put("hum", parse2[2].replaceAll("[^0-9]", ""));
			map.put("light", parse2[3].replaceAll("[^0-9]", ""));
			map.put("water", parse2[4].replaceAll("[^0-9]", ""));
			map.put("pes", parse2[5].replaceAll("[^0-9]", ""));
			System.out.println(map.toString());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		return map;
	}

}

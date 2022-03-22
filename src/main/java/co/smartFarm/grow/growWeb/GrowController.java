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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.smartFarm.auction.aucnService.AucnMapper;
import co.smartFarm.board.free.freeService.FreeMapper;
import co.smartFarm.grow.growService.GrowService;
import co.smartFarm.grow.growService.GrowVO;
import co.smartFarm.user.memberService.MemberVO;

@CrossOrigin
@Controller
public class GrowController {

	// 220302 PSH 쓴 이유..?
	private static final int String = 0;

	// 220302 PSH GrowMapper mapG 에서 아래 내용오르 수정
	@Autowired
	GrowService growDao;
	@Autowired
    FreeMapper freeDao;
	@Autowired
    AucnMapper aucnDao;
	@Autowired
	private String saveDir;
    
//	재배 진행 정보 페이지
	@RequestMapping(value = "/grow.do", method = RequestMethod.GET)
	public String grow(Locale locale, Model model, HttpSession session) throws ParseException {

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return "redirect:login.do";
		}
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memEmail = userDetails.getUsername();

		List<GrowVO> voList = growDao.growListing(memEmail);

		System.out.println(voList.toString());
		model.addAttribute("list", voList);
		System.out.println(model);

		return "grow/growhome";
	}

//	키트 사용법 페이지
	@RequestMapping(value = "/howTo.do", method = RequestMethod.GET)
	public String howTo(Locale locale, Model model) {
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return "redirect:login.do";
		}
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memEmail = userDetails.getUsername();
		model.addAttribute("recentlyFree", freeDao.recentlyFree());
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
		model.addAttribute("kitList", growDao.growListing(memEmail));
		
		return "grow/howto";
	}

//	cctv 모니터링 페이지
	@RequestMapping(value = "/cctv.do", method = RequestMethod.GET)
	public String cctv(Locale locale, Model model, HttpSession session) {
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return "redirect:login.do";
		}
//		키트 목록 출력
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memEmail = userDetails.getUsername();
		model.addAttribute("kitList", growDao.growComList(memEmail));
		System.out.println(model);
		model.addAttribute("recentlyFree", freeDao.recentlyFree());
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
		return "grow/cctv";

	}

//	재배 관리 페이지
	@RequestMapping(value = "/control.do", method = RequestMethod.GET)
	public String control(Locale locale, Model model, HttpSession session, String no) {
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return "redirect:login.do";
		}
		// 키트 목록 출력
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memEmail = userDetails.getUsername();

		List<GrowVO> voList = growDao.growListing(memEmail);
		model.addAttribute("kitList", voList);
		
		System.out.println(model);
		if (no != null) {
			model.addAttribute("no", no);
		}
		return "grow/control";
	}

//	nft목록출력
	@RequestMapping("/nftList.do")
	@ResponseBody
	public List<GrowVO> nftList(@RequestParam Map<String, String> param, HttpSession session) throws Exception {

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memEmail = userDetails.getUsername();

		Map<String, String> map = new HashMap<>();

		System.out.println(param.get("kit_no"));
		map.put("kitNo", param.get("kit_no"));
		map.put("memEmail", memEmail);

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

//	실시간 정보 페이지
	@RequestMapping(value = "/sensor.do", method = RequestMethod.GET)
	public String sensor(Locale locale, Model model, HttpSession session, String no) {
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return "redirect:login.do";
		}
//		키트 목록 출력
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memEmail = userDetails.getUsername();
		model.addAttribute("kitList", growDao.growListing(memEmail));
		model.addAttribute("recentlyFree", freeDao.recentlyFree());
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
		if (no != null) {
			model.addAttribute("no", no);
		}
		System.out.println(model);

		return "grow/sensor";
	}

//	재배 로그 페이지
	@RequestMapping(value = "/log.do", method = RequestMethod.GET)
	public String log(Locale locale, Model model, HttpSession session, String no) {
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return "redirect:login.do";
		}

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memEmail = userDetails.getUsername();

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
		model.addAttribute("recentlyFree", freeDao.recentlyFree());
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
//		로그
		System.out.println(model);

//		키트 목록 출력
		model.addAttribute("kitList", growDao.growListing(memEmail));
		if (no != null) {
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

			while ((getLine = br.readLine()) != null) {
				System.out.println(getLine);
				if (getLine.startsWith(param.get("date"))) {
					lines.add(getLine);
				}
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return lines;
	}

//	아래는 키트관련 Controls

//	키트 최초실행 시 ip주소 업데이트
	@RequestMapping(value = "/addressUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String addressUpdate(HttpServletRequest request) {

		Gson gson = new Gson();

		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);

		Map<String, String> map = new HashMap<String, String>();

		for (int i = 0; i < resultTest.size(); i++) {
			System.out.println(resultTest.get(i));
		}

		map.put("no", resultTest.get(0));
		map.put("ip", resultTest.get(1));

		growDao.addressUpdate(map);

		return "address-updated";
	}

//	키트에서 로그전송
	@RequestMapping(value = "/logger.do", method = RequestMethod.POST)
	@ResponseBody
	public String logger(HttpServletRequest request, HttpSession session) {
		
		String deviceId = request.getParameter("id");
		String memEmail = growDao.kitOwner(Integer.parseInt(deviceId));
		String sd = request.getParameter("sd").substring(0, 10);

		Gson gson = new Gson();
		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);

		String logRoute = saveDir + "\\" + memEmail + deviceId + sd + ".txt";
		System.out.println(logRoute);

		try {
			File file = new File(logRoute);

			if (!file.exists()) {
				file.createNewFile();
			}

			FileWriter fileWriter = new FileWriter(file, true);
			PrintWriter writer = new PrintWriter(fileWriter);

			for (int i = 0; i < resultTest.size(); i++) {
				System.out.println(resultTest.get(i));
				writer.println(resultTest.get(i).toString());
			}

			writer.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "log-updated";
	}

//	수동재배 완료 기능
	@RequestMapping(value = "/diaryWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public String diaryWrite(HttpServletRequest request, HttpSession session) {

		Gson gson = new Gson();

		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);

		Map<String, String> map = new HashMap<String, String>();

		for (int i = 0; i < resultTest.size(); i++) {
			System.out.println(resultTest.get(i));
		}
		System.out.println(resultTest.get(5));
		String memEmail = growDao.kitOwner(Integer.parseInt(resultTest.get(5)));

		map.put("email", memEmail);
		map.put("log", memEmail + resultTest.get(5) + resultTest.get(3).substring(0, 10) + ".txt");
		map.put("score", resultTest.get(0));
		map.put("grade", resultTest.get(1));
		map.put("plant", resultTest.get(2));
		map.put("sday", resultTest.get(3));
		map.put("kno", resultTest.get(4));
		map.put("pclass", resultTest.get(6));
		map.put("pcount", resultTest.get(7));

		System.out.println(map.toString());
		growDao.diaryWrite(map);
		growDao.plantWrite(map);

		return "Diary&Plant-updated";
	}

//	자동재배(NFT포함) 완료 기능
	@RequestMapping(value = "/plantWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public String plantWrite(HttpServletRequest request, HttpSession session) {

		Gson gson = new Gson();

		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);

		Map<String, String> map = new HashMap<String, String>();

		for (int i = 0; i < resultTest.size(); i++) {
			System.out.println(resultTest.get(i));
		}
		System.out.println(resultTest.get(5));
		String memEmail = growDao.kitOwner(Integer.parseInt(resultTest.get(5)));

		map.put("email", memEmail);
		map.put("grade", resultTest.get(1));
		map.put("plant", resultTest.get(2));
		map.put("kno", resultTest.get(4));
		map.put("pclass", resultTest.get(6));
		map.put("pcount", resultTest.get(7));

		System.out.println(map.toString());
		growDao.plantWrite(map);

		return "Plant-updated";
	}

//	키트와 통신 테스트용
	@RequestMapping(value = "/testURL.do", method = RequestMethod.POST)
	@ResponseBody
	public String test(HttpServletRequest request) {

		Gson gson = new Gson();

		List<String> resultTest = gson.fromJson(request.getParameter("kit"), List.class);

		for (int i = 0; i < resultTest.size(); i++) {
			System.out.println(resultTest.get(i));
		}

		return "test succeed";
	}
}
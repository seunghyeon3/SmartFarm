package co.smartFarm.board.qna.qnaWeb;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


import co.smartFarm.board.qna.qnaService.QnaService;
import co.smartFarm.board.qna.qnaService.QnaVO;
import co.smartFarm.user.memberService.MemberService;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaDao;

//파일 업로드 
	private static final String FILE_SERVER_PATH = "c:/Temp/";
	   @RequestMapping("/downloadQ")
	   public ModelAndView download(@RequestParam HashMap<Object, Object> params, ModelAndView mv) {
	      String fileName = (String) params.get("fileName");
	      String fullPath = FILE_SERVER_PATH + "/" + fileName;
	      File file = new File(fullPath);
	      
	      mv.setViewName("downloadView");
	      mv.addObject("downloadFile", file);
	      return mv;
	   }
	
//QNA 리스트
	@RequestMapping(value = "/qna.do")
	public String qna(Model model) throws JsonProcessingException {
		ObjectMapper map = new ObjectMapper();
		String returnStr = map.writeValueAsString(qnaDao.qnaSelectList());
		model.addAttribute("qna", returnStr);
		return "board/qna";
	}

	// QNA 상세페이지
	@RequestMapping(value = "/qnaselect.do")
	public String qnaselect(QnaVO qna, Model model) {
		qnaDao.qnaHitUpdate(qna.getQna_no());
		model.addAttribute("qna", qnaDao.qnaSelect(qna));
		return "board/qnaselect";
	}

	// QNA 다운로드 파일
	@GetMapping("/downloadq.do")
		public void downloadq(HttpServletResponse response, @RequestParam String img) throws Exception {
	        try {
	        	// 경로에 접근할 때 역슬래시('\') 사용
	        	String path = "c:\\Temp\\"+img; 
	        	// 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
	        	File file = new File(path);
	        	response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); 
	        	// 파일 읽어오기
	        	FileInputStream fileInputStream = new FileInputStream(path);  
	        	OutputStream out = response.getOutputStream();
	        	// 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
	        	int read = 0;
	                byte[] buffer = new byte[1024];
	                while ((read = fileInputStream.read(buffer)) != -1) { 
	                    out.write(buffer, 0, read);
	                }
	                
	        } catch (Exception e) {
	            throw new Exception("download error");
	        }
	}
	// QNA 글쓰기 Form
	@RequestMapping(value = "/qnainsertForm.do")
	public String qnaInsert() {
		return "board/qnainsertForm";
	}

	// QNA 글쓰기
	@RequestMapping(value = "/qnainsert.do")
	public String qnaInsert(QnaVO qna, Model model, MultipartFile qnafile,HttpServletRequest request)
			throws IllegalStateException, IOException {
		// file 업로드
		String uploadDir = "c:/Temp/";
		// 경로
		if (!qnafile.isEmpty()) {
			String filename = qnafile.getOriginalFilename();

			String fullPath = uploadDir + filename;
			qnafile.transferTo(new File(fullPath));
			qna.setQna_phy_rou(filename);
		}
		System.out.println(qna.toString());
		
		String memName = "김길동"; String memEmail = "bbb@abc.com";
		qna.setMem_name(memName); qna.setMem_email(memEmail); 
		System.out.println(qna);
		qnaDao.qnaInsert(qna);
		model.addAttribute("qna", qnaDao.qnaSelectList());
		return "redirect:/qna.do?qna_phy_rou";
	}

	// QNA 수정 Form
	@RequestMapping(value = "/qnaupdateForm.do")
	public String qnaupdateForm(@RequestParam("qna_no") String test, QnaVO qna, Model model) {
		System.out.println(qna.toString());
		System.out.println(qnaDao.qnaSelect(qna));
		model.addAttribute("qna", qnaDao.qnaSelect(qna));
		return "board/qnaupdateForm";
	}

	// QNA 수정
	@RequestMapping(value = "/qnaupdate.do")
	public String qnaupdate(QnaVO qna, Model model, MultipartFile qnafile, HttpServletRequest request) throws IllegalStateException, IOException {
		// file 업로드
		   String uploadDir = request.getServletContext().getRealPath("/resources/images/");
		   System.out.println(uploadDir);
		// 경로
		if (!qnafile.isEmpty()) {
			String filename = qnafile.getOriginalFilename();

			String fullPath = uploadDir + "/" + filename;
			qnafile.transferTo(new File(fullPath));
			qna.setQna_phy_rou(fullPath);
		}
		System.out.println("sadacsdgdfdf================" + qna.toString());
		model.addAttribute("qna", qnaDao.qnaUpdate(qna));
		List<QnaVO> list = qnaDao.qnaSelectList();
		model.addAttribute("list", list);
		return "redirect:/qna.do";
	}

	// QNA 삭제
	@RequestMapping(value = "/qnadelete.do")
	public String qnaDelete(@RequestParam(value = "qna_no") int qna_no, Model model) {
		System.out.println(qna_no);
		QnaVO qna = new QnaVO();
		qna.setQna_no(qna_no);
		qnaDao.qnaDelete(qna);
		model.addAttribute("qna", qnaDao.qnaSelectList());
		return "redirect:/qna.do";
	}

	// QNA 조회
	@RequestMapping(value = "qnahitUpdate.do")
	public String qnaHitUpdate(@RequestParam(value = "qna_no") int qna_no, Model model) {
		System.out.println(qna_no);
		return "board/qna";
	}
	// ===== 회원 검색 =====
	@PostMapping(value = "qnaSearch.do")
	@ResponseBody
	public List<QnaVO> qnasearch(@RequestBody String req) {

		JSONObject object = new JSONObject(req);

		String key = object.getString("key");
		String val = object.getString("val");

		return qnaDao.qnaSearch(key, val);
	}
}

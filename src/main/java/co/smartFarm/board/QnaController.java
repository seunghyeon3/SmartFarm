package co.smartFarm.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class QnaController {

	@Autowired
	QnaMapper qnaDao;

//파일 업로드 
	private static final String FILE_SERVER_PATH = "c:/Temp/";

	/*
	 * @RequestMapping("/download") public ModelAndView download(@RequestParam
	 * HashMap<Object, Object> params, ModelAndView mv) { String fileName = (String)
	 * params.get("fileName"); String fullPath = FILE_SERVER_PATH + "/" + fileName;
	 * File file = new File(fullPath);
	 * 
	 * mv.setViewName("downloadView"); mv.addObject("downloadFile", file); return
	 * mv; }
	 */

//QNA 리스트
	@RequestMapping(value = "/qna.do")
	public String archieve(Model model) throws JsonProcessingException {
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

	// QNA 글쓰기 Form
	@RequestMapping(value = "/qnainsertForm.do")
	public String qnaInsert() {
		return "board/qnainsertForm";
	}

	// QNA 글쓰기
	@RequestMapping(value = "/qnainsert.do")
	public String archieveInsert(QnaVO qna, Model model, MultipartFile qnafile)
			throws IllegalStateException, IOException {
		// file 업로드
		String uploadDir = "c:/Temp/";
		// 경로 
		if (!qnafile.isEmpty()) {
			String filename = qnafile.getOriginalFilename();

			String fullPath = uploadDir + filename;
			qnafile.transferTo(new File(fullPath));
			qna.setQna_pht_rou(uploadDir);
		}
		System.out.println(qna.toString());
		qnaDao.qnaInsert(qna);
		model.addAttribute("qna", qnaDao.qnaSelectList());
		return "redirect:/qna.do";
	}
	//QNA 수정 Form
	@RequestMapping(value = "/qnaupdateForm.do")
	   public String qnaupdateForm(@RequestParam("qna_no") String test, QnaVO qna, Model model){
	      System.out.println(qna.toString());
	      System.out.println(qnaDao.qnaSelect(qna));
	      model.addAttribute("notice", qnaDao.qnaSelect(qna));
	      return "board/qnaupdateForm";
	   }
	//QNA 수정 
	@RequestMapping(value = "/qnaupdate.do")
	   public String qnaupdate(QnaVO qna, Model model) {
	      System.out.println("sadacsdgdfdf================" + qna.toString());
	      model.addAttribute("notice", qnaDao.qnaUpdate(qna));
	      List<QnaVO> list = qnaDao.qnaSelectList();
	      model.addAttribute("list", list);
	      return "redirect:/qna.do";
	   }
	//QNA 삭제
	@RequestMapping(value = "/qnadelete.do")
	   public String qnaDelete(@RequestParam(value="qna_no")int qna_no,Model model) {
	      System.out.println(qna_no);
	      QnaVO qna = new QnaVO();
	      qna.setQna_no(qna_no);
	      qnaDao.qnaDelete(qna);
	      model.addAttribute("qna", qnaDao.qnaSelectList());
	      return "redirect:/qna.do";
	   }
	//QNA 조회
	   @RequestMapping(value = "qnahitUpdate/.do")
	   public String qnaHitUpdate(@RequestParam(value="qna_no")int qna_no,Model model) {
	      System.out.println(qna_no);
	      return "board/qna";
	   }
	
	
}

package co.smartFarm.board.notice.noticeWeb;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
//3
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.smartFarm.board.Archieve.archieveService.ArchieveVO;
import co.smartFarm.board.notice.noticeService.NoticeService;
import co.smartFarm.board.notice.noticeService.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeDao;

	// 파일업로드
	private static final String FILE_SERVER_PATH = "c:/Temp/";

	// 공지사항 리스트
	@RequestMapping(value = "/notice.do")
	public String notice(Model model) throws JsonProcessingException {
		ObjectMapper map = new ObjectMapper();
		String returnStr = map.writeValueAsString(noticeDao.noticeSelectList());
		model.addAttribute("notice", returnStr);
		System.out.println(returnStr);
		return "board/notice";
	}

	// 공지사항 상세페이지
	@RequestMapping(value = "/noticeselect.do")
	public String noticeselect(NoticeVO notice, Model model) {
		noticeDao.noticeHitUpdate(notice.getNotice_no());
		model.addAttribute("notice", noticeDao.noticeSelect(notice));
		return "board/noticeselect";
	}

	// 공지사항 다운로드 파일 
	@GetMapping("/download.do")
	public void download(HttpServletResponse response, @RequestParam String img) throws Exception {
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
	
	// 공지사항 글쓰기 Form
		@RequestMapping(value = "/noticeinsertForm.do")
		public String noticeInsert() {
			return "board/noticeinsertForm";
		}
	// 공지사항 글쓰기
	 @RequestMapping(value = "/noticeinsert.do")
	   public String archieveInsert(NoticeVO notice, Model model,  MultipartFile noticefile)
	         throws IllegalStateException, IOException {
	      // file 업로드
	      String uploadDir = "c:/Temp/";
	      // 경로 
	      if (!noticefile.isEmpty()) {
	         String filename = noticefile.getOriginalFilename();

	         String fullPath = uploadDir +"/"+ filename;
	         noticefile.transferTo(new File(fullPath));
	         notice.setNotice_img(filename);
	      }
	      System.out.println(notice.toString());
	      noticeDao.noticeInsert(notice);
	      model.addAttribute("notice", noticeDao.noticeSelectList());
	      return "redirect:/notice.do?notice_img";
	   }
	// 공지사항 수정 Form
	  @RequestMapping(value = "/noticeupdateForm.do")
	   public String noticeupdateForm(@RequestParam("notice_no") String test, NoticeVO notice, Model model){
	      System.out.println(notice.toString());
	      System.out.println(noticeDao.noticeSelect(notice));
	      model.addAttribute("notice", noticeDao.noticeSelect(notice));
	      return "board/noticeupdateForm";
	   }
	// 공지사항 수정 
	  @RequestMapping(value = "/noticeupdate.do")
	   public String noticeupdate(NoticeVO notice, Model model, MultipartFile noticefile) 
			   throws IllegalStateException, IOException {
		  // file 업로드
	      String uploadDir = "c:/Temp/";
	      // 경로 
	      if (!noticefile.isEmpty()) {
	         String filename = noticefile.getOriginalFilename();

	         String fullPath = uploadDir +"/"+ filename;
	         noticefile.transferTo(new File(fullPath));
	         notice.setNotice_img(filename);
	      }
		  System.out.println("sadacsdgdfdf================" + notice.toString());
	      model.addAttribute("notice", noticeDao.noticeUpdate(notice));
	      List<NoticeVO> list = noticeDao.noticeSelectList();
	      model.addAttribute("list", list);
	      return "redirect:/notice.do?notice_img";
	   }
	// 자료실 삭제
	  @RequestMapping("/noticedelete.do")
	   public String noticeDelete(@RequestParam(value="notice_no")int notice_no,Model model) {
	      System.out.println(notice_no);
	      NoticeVO notice = new NoticeVO();
	      notice.setNotice_no(notice_no);
	      noticeDao.noticeDelete(notice);
	      model.addAttribute("notices", noticeDao.noticeSelectList());
	      return "redirect:/notice.do";
	   }
	// 자료실 조회
	   @RequestMapping("noticehitUpdate/.do")
	   public String noticeHitUpdate(@RequestParam(value="notice_no")int notice_no,Model model) {
	      System.out.println(notice_no);
	      return "board/notice";
	   }
	// 검색 
		@PostMapping(value = "noticeSearch.do")
		@ResponseBody
		public List<NoticeVO> noticeSearch(@RequestBody String req) {

			JSONObject object = new JSONObject(req);

			String key = object.getString("key");
			String val = object.getString("val");

			return noticeDao.noticeSearch(key, val);
		}
}

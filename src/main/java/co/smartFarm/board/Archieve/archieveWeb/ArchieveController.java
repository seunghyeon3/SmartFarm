package co.smartFarm.board.Archieve.archieveWeb;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import co.smartFarm.board.Archieve.archieveService.ArchieveService;
import co.smartFarm.board.Archieve.archieveService.ArchieveVO;
import co.smartFarm.board.qna.qnaService.QnaVO;



@Controller
public class ArchieveController {

   @Autowired
   private ArchieveService archieveDao;

   //파일업로드
   private static final String FILE_SERVER_PATH = "c:/Temp/";
   @RequestMapping("/download")
   public ModelAndView download(@RequestParam HashMap<Object, Object> params, ModelAndView mv) {
      String fileName = (String) params.get("fileName");
      String fullPath = FILE_SERVER_PATH + "/" + fileName;
      File file = new File(fullPath);
      
      mv.setViewName("downloadView");
      mv.addObject("downloadFile", file);
      return mv;
   }
   
   // 자료실 리스트
   @RequestMapping(value = "/archieve.do") 
   public String archieve(Model model) throws JsonProcessingException {
      ObjectMapper map = new ObjectMapper();
      String returnStr = map.writeValueAsString(archieveDao.archieveSelectList());
      model.addAttribute("archieve", returnStr);
      return "board/archieve";
   }

   // 자료실 상세페이지
   @RequestMapping(value = "/archieveselect.do")
   public String archieveselect(ArchieveVO archieve, Model model) {
      archieveDao.archieveHitUpdate(archieve.getArchieve_no());
      model.addAttribute("archieve", archieveDao.archieveSelect(archieve));
      return "board/archieveselect";
   }
   //자료실 다운로드 파일
	@GetMapping("/downloada.do")
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
           throw new Exception("downloada error");
       }
	}
   // 자료실 글쓰기 Form
   @RequestMapping(value = "/archieveinsertForm.do")
   public String archieveInsert() {
      return "board/archieveinsertForm";
   }

   // 자료실 글쓰기
   @RequestMapping(value = "/archieveinsert.do")
   public String archieveInsert(ArchieveVO archieve, Model model,  MultipartFile archievefile)
         throws IllegalStateException, IOException {
      // file 업로드
      String uploadDir = "c:/Temp/";
      // 경로 생
      if (!archievefile.isEmpty()) {
         String filename = archievefile.getOriginalFilename();

         String fullPath = uploadDir + filename;
         archievefile.transferTo(new File(fullPath));
         archieve.setArchieve_img(filename);
      }
      System.out.println(archieve.toString());
      archieveDao.archieveInsert(archieve);
      model.addAttribute("archieve", archieveDao.archieveSelectList());
      return "redirect:/archieve.do?archieve_img";
   }
   // 자료실 수정 Form
   @RequestMapping(value = "/archieveupdateForm.do")
   public String archieveupdateForm(@RequestParam("archieve_no") String test, ArchieveVO archieve, Model model){
      System.out.println(archieve.toString());
      System.out.println(archieveDao.archieveSelect(archieve));
      model.addAttribute("archieve", archieveDao.archieveSelect(archieve));
      return "board/archieveupdateForm";
   }

   // 자료실 수정
   @RequestMapping(value = "/archieveupdate.do")
   public String archieveupdate(ArchieveVO archieve, Model model, MultipartFile archievefile,HttpServletRequest request) 
		   throws IllegalStateException, IOException {
	   // file 업로드
	   String uploadDir = request.getServletContext().getRealPath("/resources/images/");
	   System.out.println(uploadDir);
	      // 경로 
	      if (!archievefile.isEmpty()) {
	         String filename = archievefile.getOriginalFilename();

	         String fullPath = uploadDir +"/"+ filename;
	         archievefile.transferTo(new File(fullPath));
	         archieve.setArchieve_img(filename);
	      }
	   System.out.println("sadacsdgdfdf================" + archieve.toString());
      model.addAttribute("archieve", archieveDao.archieveUpdate(archieve));
      List<ArchieveVO> list = archieveDao.archieveSelectList();
      model.addAttribute("list", list);
      return "redirect:/archieve.do?archieve_img";
   }
   // 자료실 삭제
   @RequestMapping("/archievedelete.do")
   public String archieveDelete(@RequestParam(value="archieve_no")int archieve_no,Model model) {
      System.out.println(archieve_no);
      ArchieveVO archieve = new ArchieveVO();
      archieve.setArchieve_no(archieve_no);
      archieveDao.archieveDelete(archieve);
      model.addAttribute("archieve", archieveDao.archieveSelectList());
      return "redirect:/archieve.do";
   }
   // 자료실 조회수 업데이트 
   @RequestMapping("archievehitUpdate/.do")
   public String archieveHitUpdate(@RequestParam(value="archieve_no")int archieve_no,Model model) {
      System.out.println(archieve_no);
      return "board/archieve";
   }
	// 검색 
	@PostMapping(value = "archieveSearch.do")
	@ResponseBody
	public List<ArchieveVO> archieveSearch(@RequestBody String req) {

		JSONObject object = new JSONObject(req);

		String key = object.getString("key");
		String val = object.getString("val");

		return archieveDao.archieveSearch(key, val);
	}
}
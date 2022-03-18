package co.smartFarm.board.free.freeWeb;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.smartFarm.board.free.freeService.FreeMapper;
import co.smartFarm.board.free.freeService.FreeVO;
import co.smartFarm.board.useRevw.useRevwService.UseRevwVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class FreeController {

    @Autowired
    FreeMapper freeDao;
	@Autowired
	private String saveDir;
	
	//자료실 리스트
    @RequestMapping(value = "/free.do") 
    public String free(Model model) throws JsonProcessingException {
    	
		ObjectMapper map = new ObjectMapper();
		
		String Str = map.writeValueAsString(freeDao.freeList());
    	
		model.addAttribute("test", Str);
		
		return "board/free";
    }

    //자유게시판 상세페이지
    @RequestMapping(value = "/freeOne.do")
    public String freeOne(int free_no, Model model ) {
        model.addAttribute(freeDao.freeOne(free_no)); 
        System.out.println(model);
        return "board/freeone";
    }

    //자료실 글쓰기페이지
    @RequestMapping(value = "/freeInsertForm.do") 
    public String freeInsertForm() {
    	
        return "board/freeinsertform";
    }
	
	//이용후기 DB 등록 완료되면 다시 메인화면으로 고고
	@RequestMapping("freeInsert.do")
	public String useRevwInsert(FreeVO free, MemberVO memberVo, @RequestParam("file") MultipartFile file) {
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		free.setMem_email(userDetails.getUsername());
		free.setMem_name(memberVo.getMem_name());
		free.setFree_con(free.getFree_con().replace("\r\n", "<br>"));
		
		String originalFileName = file.getOriginalFilename();
		
		if (!originalFileName.isEmpty()) {
			String uid = UUID.randomUUID().toString();
			
			String saveFileName = uid + originalFileName.substring(originalFileName.lastIndexOf("."));
			
			try {
				file.transferTo(new File(saveDir, saveFileName));
				free.setFree_ori_rou(originalFileName);
				free.setFree_phy_rou(saveFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		freeDao.freeInsert(free);
		
		return "redirect:free.do";
	}
	
    //자료실 수정
    @RequestMapping(value = "/freeUpdateForm.do") 
    public String freeUpdateForm() {

        return "board/freeupdateform";
    }

}
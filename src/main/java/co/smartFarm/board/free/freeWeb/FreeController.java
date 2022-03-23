package co.smartFarm.board.free.freeWeb;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.smartFarm.auction.aucnService.AucnMapper;
import co.smartFarm.board.free.freeService.FreeMapper;
import co.smartFarm.board.free.freeService.FreeVO;
import co.smartFarm.board.useRevw.useRevwService.UseRevwVO;
import co.smartFarm.grow.growService.GrowService;
import co.smartFarm.grow.growService.GrowVO;
import co.smartFarm.grow.growServiceImpl.GrowServiceImpl;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class FreeController {

    @Autowired
    FreeMapper freeDao;
    @Autowired
    AucnMapper aucnDao;
	@Autowired
	GrowService growDao;
	@Autowired
	private String saveDir;

	
	//자유게시판 리스트
    @RequestMapping(value = "/free.do") 
    public String free(Model model, MemberVO memberVo, FreeVO free) throws JsonProcessingException {
		ObjectMapper map = new ObjectMapper();
		String Str = map.writeValueAsString(freeDao.freeList());
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String memEmail = userDetails.getUsername();
			model.addAttribute("kitList", growDao.growListing(memEmail));
		}

		model.addAttribute("test", Str);
		model.addAttribute("recentlyFree", freeDao.recentlyFree());
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
		return "board/free";
    }

    //자유게시판 상세페이지
    @RequestMapping(value = "/freeOne.do")
    public String freeOne(int free_no, Model model ) {
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String memEmail = userDetails.getUsername();
			model.addAttribute("kitList", growDao.growListing(memEmail));
		}
		freeDao.freeHitUp(free_no);
		model.addAttribute("recentlyFree", freeDao.recentlyFree());
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
        model.addAttribute(freeDao.freeOne(free_no)); 
        model.addAttribute("comments", freeDao.freeCommList(free_no));
        model.addAttribute("count", freeDao.freeCommCount(free_no));
        System.out.println(model);
        return "board/freeone";
    }
    
    //자유게시판 댓글쓰기
    @RequestMapping(value = "/freeCommInsert.do")
    @ResponseBody
    public Map<String, List<FreeVO>> freeCommInsert(FreeVO vo, MemberVO memberVo) {
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setMem_email(userDetails.getUsername());
		vo.setMem_name(memberVo.getMem_name());
    	freeDao.freeCommInsert(vo);
		Map<String, List<FreeVO>> map = new HashMap<>();
		map.put("newcomments", freeDao.freeCommList(vo.getFree_no()));
		List<FreeVO> c = new ArrayList<>();
		c.add(freeDao.freeCommCount(vo.getFree_no()));
		map.put("newcount", c);
		return map;
    } 

    //자유게시판 글쓰기페이지
    @RequestMapping(value = "/freeInsertForm.do") 
    public String freeInsertForm() {
    	
        return "board/freeinsertform";
    }
	
	//자유게시판 글쓰기
	@RequestMapping("freeInsert.do")
	public String freeInsert(FreeVO free, MemberVO memberVo, @RequestParam("file") MultipartFile file) {
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
	
    //자유게시판 수정
    @RequestMapping(value = "/freeUpdateForm.do") 
    public String freeUpdateForm(int free_no, Model model) {
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return "redirect:free.do";
		}
        model.addAttribute(freeDao.freeOne(free_no)); 
        model.addAttribute("comments", freeDao.freeCommList(free_no));
        model.addAttribute("count", freeDao.freeCommCount(free_no));
        System.out.println(model);
        return "board/freeupdateform";
    }

	//자유게시판 글쓰기
	@RequestMapping("freeUpdate.do")
	public String freeUpdate(FreeVO free, MemberVO memberVo, @RequestParam("file") MultipartFile file) {
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
		
		freeDao.freeUpdate(free);
		
		return "redirect:free.do";
	}

    //자유게시판 삭제
    @RequestMapping(value = "/freeDelete.do")
    public String freeDelete(int free_no, Model model ) {
        freeDao.freeDelete(free_no); 

        return "redirect:free.do";
    }
	
}
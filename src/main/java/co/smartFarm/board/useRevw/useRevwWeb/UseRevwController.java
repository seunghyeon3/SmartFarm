package co.smartFarm.board.useRevw.useRevwWeb;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import co.smartFarm.board.useRevw.useRevwService.UseRevwService;
import co.smartFarm.board.useRevw.useRevwService.UseRevwVO;
import co.smartFarm.shopping.purHisService.PurHisService;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class UseRevwController {

	@Autowired
	UseRevwService useRevwDao;
	@Autowired
	PurHisService purHisDao;
	@Autowired
	private String saveDir; // 파일저장 경로를 자동 주입
	
	//이용후기 메인페이지 
	@RequestMapping("useRevwMain.do")
	public String UseRevwMain(Model model){
		
		model.addAttribute("useRevwList", useRevwDao.useRevwList());
		
		return "board/useRevwMain";
	}
	
	//이용후기 등록페이지
	@RequestMapping("useRevwInsertForm.do")
	public String useRevwInsertForm(Model model, HttpSession session){
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		
		model.addAttribute("purHisList", purHisDao.purHisRevwSelect(memEmail));
		System.out.println(model.getAttribute("purHisList"));
		
		return "board/useRevwInsertForm";
	}
	
	//이용후기 DB 등록 완료되면 다시 메인화면으로 고고
	@RequestMapping("useRevwInsert.do")
	public String useRevwInsert(UseRevwVO useRevw, HttpSession session, @RequestParam("file") MultipartFile file) {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		String memName = member.getMem_name();
		
		useRevw.setMem_email(memEmail);
		useRevw.setMem_name(memName);
		useRevw.setUse_revw_con(useRevw.getUse_revw_con().replace("\r\n", "<br>"));
		String originalFileName = file.getOriginalFilename(); // 원본 파일명 찾기
		if (!originalFileName.isEmpty()) {
			String uid = UUID.randomUUID().toString(); // 유니크한 파일명 생성
			// uuil에 파일확장자 추가하여 물리적 파일명을 만듬
			String saveFileName = uid + originalFileName.substring(originalFileName.lastIndexOf("."));
			try {
				file.transferTo(new File(saveDir, saveFileName));
				useRevw.setUse_revw_ori_rou(originalFileName);
				useRevw.setUse_revw_phy_rou(saveFileName);
				//news.setNewsboard_id(member_company + news.getNewsboard_pfile());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		useRevwDao.createRevw(useRevw);
		
		return "redirect:useRevwMain.do";
	}
	
	//이용후기 메인페이지 
	@RequestMapping("useRevwDetail.do")
	public String useRevwDetail(@RequestParam("useRevwNo") int useRevwNo, UseRevwVO useRevw, Model model) {
		useRevw = useRevwDao.useRevwDetail(useRevwNo);
		model.addAttribute("useRevwDetail", useRevw);
		return "board/useRevwDetail";
		}
	
	//이용후기 수정페이지
	@RequestMapping("useRevwUpdateForm.do")
	public String useRevwUpdateForm(@RequestParam("useRevwNo") int useRevwNo, @RequestParam("purHisNo") int purHisNo, 
										HttpSession session, Model model, UseRevwVO useRevw) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		
		model.addAttribute("useRevwOne", useRevwDao.useRevwDetail(useRevwNo));
		useRevw.setPur_his_order_no(purHisNo);
		useRevw.setMem_email(memEmail);
		model.addAttribute("purHisSelect", useRevwDao.purHisSelectNo(useRevw));
		return "board/useRevwUpdateForm";
	}
	
	//이용후기 수정
	@RequestMapping("useRevwUpdate.do")
	public String useRevwUpdate(UseRevwVO useRevw, HttpSession session, @RequestParam("file") MultipartFile file) {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		String memName = member.getMem_name();
		
		useRevw.setMem_email(memEmail);
		useRevw.setMem_name(memName);
		
		String originalFileName = file.getOriginalFilename(); // 원본 파일명 찾기
		if (!originalFileName.isEmpty()) {
			String uid = UUID.randomUUID().toString(); // 유니크한 파일명 생성
			// uuil에 파일확장자 추가하여 물리적 파일명을 만듬
			String saveFileName = uid + originalFileName.substring(originalFileName.lastIndexOf("."));
			try {
				file.transferTo(new File(saveDir, saveFileName));
				useRevw.setUse_revw_ori_rou(originalFileName);
				useRevw.setUse_revw_phy_rou(saveFileName);
				//news.setNewsboard_id(member_company + news.getNewsboard_pfile());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		useRevwDao.updateRevw(useRevw);
		
		return "redirect:useRevwMain.do";
	}
	
	//이용후기 삭제
	@RequestMapping("useRevwDelete.do")
	public String useRevwDelete(@RequestParam("useRevwNo") int useRevwNo) {
		
		useRevwDao.deleteRevw(useRevwNo);
		return "redirect:useRevwMain.do";
	}
}

package co.smartFarm.board.useRevw.useRevwWeb;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.smartFarm.board.useRevw.useRevwService.UseRevwService;
import co.smartFarm.board.useRevw.useRevwService.UseRevwVO;
import co.smartFarm.shopping.purHisService.PurHisService;
import co.smartFarm.shopping.purHisService.PurHisVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class UseRevwController {

	@Autowired
	UseRevwService useRevwDao;
	@Autowired
	PurHisService purHisDao;
	
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
	public String useRevwInsert(UseRevwVO useRevw, HttpSession session) {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		String memName = member.getMem_name();
		
		useRevw.setMem_email(memEmail);
		useRevw.setMem_name(memName);
		
		return "redirect:useRevwMain.do";
	}
	
	//이용후기 메인페이지 
	@RequestMapping("useRevwDetail.do")
	public String useRevwDetail() {
		return null;
		}
}

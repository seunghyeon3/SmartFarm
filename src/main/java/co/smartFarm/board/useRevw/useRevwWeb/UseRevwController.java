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
	
	@RequestMapping("useRevwMain.do")
	public String UseRevwMain(Model model){
		
		model.addAttribute("useRevwList", useRevwDao.useRevwList());
		
		return "board/useRevwMain";
	}
	
	@RequestMapping("useRevwInsertForm.do")
	public String useRevwInsert(Model model, HttpSession session){
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
		
		model.addAttribute("purHisList", purHisDao.purHisRevwSelect(memEmail));
		
		return "board/useRevwInsertForm";
	}
	
}

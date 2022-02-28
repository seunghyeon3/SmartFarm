package co.smartFarm.auction;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.smartFarm.user.MemberVO;

@Controller
public class AucnController {
	
	@Autowired
	AucnMapper aucnDao;
	
	@RequestMapping("/aucnMain.do")
	public String aucnMain(Model model) {
		model.addAttribute("aucnList", aucnDao.aucnList());
		return "auction/aucnMain";
	}

	@RequestMapping("/aucnInsert.do")
	public String aucnInsert(AucnVO aucn, HttpSession session, MemberVO mem) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		aucn.setMem_name(member.getMem_name());
		aucn.setMem_email(member.getMem_email());
		System.out.println(aucn);
		aucnDao.aucnInsert(aucn);
	    return "redirect:nftholdings.do";
}
}
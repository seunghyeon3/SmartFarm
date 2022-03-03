package co.smartFarm.auction.aucnWeb;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.smartFarm.NFT.service.NftService;
import co.smartFarm.auction.aucnService.AucnService;
import co.smartFarm.auction.aucnService.AucnVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class AucnController {
	
	@Autowired
	private AucnService aucnDao;
	@Autowired
	private NftService nftDao;
	
	@RequestMapping("/aucnMain.do")
	public String aucnMain(Model model) {
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
		
		return "auction/aucnMain";
	}

	@RequestMapping("/aucnInsert.do")
	public String aucnInsert(AucnVO aucn, HttpSession session, MemberVO mem) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		aucn.setMem_name(member.getMem_name());
		aucn.setMem_email(member.getMem_email());
		aucnDao.aucnInsert(aucn);
	    return "redirect:nftholdings.do";
}
	
	@RequestMapping("/aucnDetail.do")
	public String aucnDetail(@RequestParam(value="aucnNo") int aucnNo, AucnVO aucn, Model model) {
		aucn = aucnDao.aucnSelect(aucnNo);
		model.addAttribute("aucnSelect", aucn);
		return "auction/aucnDetail";
	}
	
	//nft보유현황 페이지에서 경매버튼 클릭시 경매 등록페이지로 이동
	//220302 PSH MypageController -> AucnController 구분 작업
	@RequestMapping("/aucnInsertForm.do")
	public String nftAucnInsertForm(@RequestParam (value="nftNo") int nftNo ,Model model) {
		model.addAttribute("nftVo",nftDao.selectMyNft(nftNo));
		return "auction/aucnInsertForm";
	}
	
}
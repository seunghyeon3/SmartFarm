package co.smartFarm.auction.aucnWeb;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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
		aucn.setNow_bid(aucn.getFirst_bid());
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
		model.addAttribute("aucnNo",aucnDao.aucnNoselect());
		return "auction/aucnInsertForm";
	}
	
	// 스케줄러로 1분마다 경매 체크후 끝난친구가 있으면 db 업데이트로 경매유무 변경하고 
	// 솔리디티 method 호출후 auctionend(aucnNo) 실행해서 경매 종료
	// web소켓 알림으로 최고입찰자를 제외한 입찰자들에게 알림 전송 (**최고입찰자에게 경매가 완료되었다 알림을 보낼지 물어보기**) 
	// -> 알림에서 버튼을 누를 시 솔리디티 method 호출후 withdraw(aucnNo) 실행해서 입찰금액 출금
	//@Scheduled(cron="0 0/1 * * * *")
	public void nftAuctionEnd() {
			System.out.println("test");
	}
}
package co.smartFarm.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.smartFarm.auction.aucnService.AucnService;
import co.smartFarm.board.free.freeService.FreeService;
import co.smartFarm.board.notice.noticeService.NoticeService;
import co.smartFarm.board.useRevw.useRevwService.UseRevwService;
import co.smartFarm.kit.kitService.KitService;
import co.smartFarm.shopping.purHisService.PurHisService;

@Controller
public class HomeController {
	
	@Autowired
	private AucnService aucnDao;
	
	@Autowired
	private PurHisService purHisDao;
	
	@Autowired
	private KitService kitDao;
	
	@Autowired
	private NoticeService noticeDao;
	
	@Autowired
	private FreeService freeDao;
	
	@Autowired
	private UseRevwService useRevwDao;
	//220309 PSH 메인페이지 슬라이드, 공지사항, 자유게시판, 이용후기 리스트 출력	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
		model.addAttribute("priceRank", purHisDao.purHisPriceSelect());
		model.addAttribute("kitRecommand", kitDao.kitRecommand());
		model.addAttribute("recentlyNotice", noticeDao.recentlyNotice());
		model.addAttribute("recentlyFree", freeDao.recentlyFree());
		model.addAttribute("recentlyUseRevw", useRevwDao.recentlyUseRevw());
		
		return "home/home";
	}
}
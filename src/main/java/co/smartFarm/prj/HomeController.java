package co.smartFarm.prj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.smartFarm.auction.aucnService.AucnService;
import co.smartFarm.board.free.freeService.FreeService;
import co.smartFarm.board.notice.noticeService.NoticeService;
import co.smartFarm.board.notice.noticeService.NoticeVO;
import co.smartFarm.board.useRevw.useRevwService.UseRevwService;
import co.smartFarm.kit.kitService.KitService;
import co.smartFarm.plant.plantSaleService.PlantSaleService;
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
	
	@Autowired
	private PlantSaleService plantSaleDao;
	
	@Autowired
	private MainMapper MainDao;
	//220309 PSH 메인페이지 슬라이드, 공지사항, 자유게시판, 이용후기 리스트 출력	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
		model.addAttribute("priceRank", purHisDao.purHisPriceSelect());
		model.addAttribute("kitRecommand", kitDao.kitRecommand());
		List<NoticeVO> list = noticeDao.recentlyNotice();
		list.get(0).setNotice_con(list.get(0).getNotice_con().replace("<br>", " "));
		list.get(1).setNotice_con(list.get(1).getNotice_con().replace("<br>", " "));
		System.out.println(list.toString());
		model.addAttribute("recentlyNotice", list);
		
		model.addAttribute("recentlyFree", freeDao.recentlyFree());
		model.addAttribute("recentlyUseRevw", useRevwDao.recentlyUseRevw());
		model.addAttribute("recentlyPlantSale" , plantSaleDao.plantSaleSelectListOrderNo());
		model.addAttribute("mainCount",MainDao.getCount());
		return "home/home";
	}
}
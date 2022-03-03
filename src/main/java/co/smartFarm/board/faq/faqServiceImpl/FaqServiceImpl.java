package co.smartFarm.board.faq.faqServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.faq.faqService.FaqMapper;
import co.smartFarm.board.faq.faqService.FaqVO;
import co.smartFarm.board.intro.introService.IntroVO;
import co.smartFarm.board.faq.faqService.FaqService;

@Repository("faqDao")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqMapper map;
	@Override
	public List<FaqVO> faqSelectList() {
		return map.faqSelectList();
	}

	@Override
	public FaqVO faqinsertSelect(int faq_no) {
		return map.faqinsertSelect(faq_no);
	}

	@Override
	public FaqVO faqSelect(FaqVO faq) {
		return map.faqSelect(faq);
	}

	@Override
	public int faqInsert(FaqVO faq) {
		return map.faqInsert(faq);
	}

	@Override
	public int faqDelete(FaqVO faq) {
		return map.faqDelete(faq);
	}

	@Override
	public int faqUpdate(FaqVO faq) {
		return map.faqUpdate(faq);
	}

	@Override
	public List<FaqVO> faqSearch(String key, String val) {
		return map.faqSearch(key, val);
	}

	@Override
	public String writeValueAsString(List<IntroVO> faqSelectList) {
		return map.writeValueAsString(faqSelectList);
	}

}

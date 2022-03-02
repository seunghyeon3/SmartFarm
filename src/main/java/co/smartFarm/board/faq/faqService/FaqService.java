package co.smartFarm.board.faq.faqService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.smartFarm.board.intro.introService.IntroVO;

public interface FaqService {

	List<FaqVO> faqSelectList();
	FaqVO faqinsertSelect(int faq_no);
	FaqVO faqSelect(FaqVO faq);
	int faqInsert(FaqVO faq);
	int faqDelete(FaqVO faq);
	int faqUpdate(FaqVO faq);
	
	List<FaqVO> faqSearch(@Param("key")String key, @Param("val") String val);
	String writeValueAsString(List<IntroVO> faqSelectList);
}

package co.smartFarm.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FaqMapper {

	List<FaqVO> faqSelectList();
	FaqVO faqinsertSelect(int faq_no);
	FaqVO faqSelect(FaqVO faq);
	int faqInsert(FaqVO faq);
	int faqDelete(FaqVO faq);
	int faqUpdate(FaqVO faq);
	
	List<FaqVO> faqSearch(@Param("key")String key, @Param("val") String val);
	String writeValueAsString(List<IntroVO> faqSelectList);
}

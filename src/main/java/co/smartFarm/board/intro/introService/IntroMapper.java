package co.smartFarm.board.intro.introService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IntroMapper {
	List<IntroVO> introSelectList();
	IntroVO introinsertSelect(int Intro_no);
	IntroVO introSelect(IntroVO intro);
	int introInsert(IntroVO intro);
	int introDelete(IntroVO intro);
	int introUpdate(IntroVO intro);
	
	List<IntroVO> introSearch(@Param("key")String key, @Param("val")String val);	
}

package co.smartFarm.board.intro.introService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IntroService {
	List<IntroVO> introSelectList();
	IntroVO introinsertSelect(int Intro_no);
	List<IntroVO> introSelect(IntroVO intro);
	int introInsert(IntroVO intro);
	int introUpdate(IntroVO intro);
	int introDelete(IntroVO intro);
	
	List<IntroVO> introSearch(@Param("key")String key, @Param("val")String val);	
}

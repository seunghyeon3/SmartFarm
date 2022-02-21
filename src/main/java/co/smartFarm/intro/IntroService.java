package co.smartFarm.intro;

import java.util.List;

public interface IntroService {
	
	List<IntroVO> introSelectList();
	IntroVO introinsertSelect();
	IntroVO introSelect();
	int introInsert(IntroVO intro);
	int introDelete(IntroVO intro);
	int introUpdate(IntroVO intro);
	
	List<IntroVO> introSearch(String key, String val);
	
	
	
}

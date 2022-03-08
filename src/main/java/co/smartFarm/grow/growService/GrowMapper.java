package co.smartFarm.grow.growService;

import java.util.List;
import java.util.Map;

public interface GrowMapper {
//	회원의 키트 조회
	List<GrowVO> growList(String memEmail);
//	회원의 상업용 키트 조회
	List<GrowVO> growComList(String memEmail);
	
	List<GrowVO> orderNumber(String memEmail);
	
	List<GrowVO> growListing(String memEmail);
	
	void addressUpdate(Map<String, String> val);

	void statusUpdate(Map<String, String> val);
	
	void diaryWrite(Map<String, String> val);
	
}

package co.smartFarm.grow;

import java.util.List;

public interface GrowMapper {
//	회원의 키트 조회
	List<GrowVO> growList(String memEmail);
//	회원의 상업용 키트 조회
	List<GrowVO> growComList(String memEmail);
	
	List<GrowVO> orderNumber(String memEmail);
}

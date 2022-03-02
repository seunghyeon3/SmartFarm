package co.smartFarm.grow.growDiaryService;

import java.util.List;

public interface GrowDiaryService {
	//영농일지 회원아이디를 통한 조건 조회 (마이페이지에서 사용)
	List<GrowDiaryVO> growDiaryMyList(String memEmail);
	
	GrowDiaryVO growDiaryNoList(int growDiaryGrowNo);
	
}

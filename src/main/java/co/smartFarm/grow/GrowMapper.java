package co.smartFarm.grow;

import java.util.List;

public interface GrowMapper {
	//영농일지 회원아이디를 통한 조건 조회 (마이페이지에서 사용)
	List<GrowVO> growList(String memEmail);
}

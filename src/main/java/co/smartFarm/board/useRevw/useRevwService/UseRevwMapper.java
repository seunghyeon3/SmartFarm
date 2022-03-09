package co.smartFarm.board.useRevw.useRevwService;

import java.util.List;

public interface UseRevwMapper {
	//이용후기 메인페이지 전체조회
	List<UseRevwVO> useRevwList();
	//이용후기 등록페이지
	int createRevw(UseRevwVO useRevw);
	List<UseRevwVO> recentlyUseRevw();
}

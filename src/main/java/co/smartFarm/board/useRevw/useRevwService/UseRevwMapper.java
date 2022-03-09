package co.smartFarm.board.useRevw.useRevwService;

import java.util.List;

public interface UseRevwMapper {
	//이용후기 메인페이지 전체조회
	List<UseRevwVO> useRevwList();
	List<UseRevwVO> recentlyUseRevw();
}

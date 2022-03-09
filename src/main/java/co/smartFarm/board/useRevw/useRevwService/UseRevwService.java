package co.smartFarm.board.useRevw.useRevwService;

import java.util.List;

public interface UseRevwService {
	//이용후기 메인페이지 전체조회
	List<UseRevwVO> useRevwList();
	//220309 PSH 최근 5개 이용후기 리스트 가져오기 위해 추가
	List<UseRevwVO> recentlyUseRevw();
}

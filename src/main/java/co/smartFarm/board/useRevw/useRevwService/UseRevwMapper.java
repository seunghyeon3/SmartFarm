package co.smartFarm.board.useRevw.useRevwService;

import java.util.List;

import co.smartFarm.shopping.purHisService.PurHisVO;

public interface UseRevwMapper {
	//이용후기 메인페이지 전체조회
	List<UseRevwVO> useRevwList();
	//이용후기 등록페이지
	Integer createRevw(UseRevwVO useRevw);
	//220309 PSH 최근 5개 이용후기 리스트 가져오기 위해 추가
	List<UseRevwVO> recentlyUseRevw();
	//이용후기 상세페이지
	UseRevwVO useRevwDetail(int useRevwNo);
	//이용후기 수정내역
	PurHisVO purHisSelectNo(UseRevwVO useRevw);
	//이용후기 수정
	int updateRevw(UseRevwVO useRevw);
	//이용후기 삭제
	int deleteRevw(int useRevwNo);
	//이용후기 검색
	List<UseRevwVO> useRevwSearchList(String useRevwTitle);
	//이용후기 조회수
	int updateRevwHit(int useRevwNo);
	//이용후기 댓글 조회
	List<UseRevwCommVO> useRevwCommList(int useRevwNo);
	//이용후기 댓글 입력
	int useRevwCommInsert(UseRevwCommVO useRevwComm);
	//이용후기 댓글 삭제
	int useRevwCommDelete(int useRevwCommNo);
}

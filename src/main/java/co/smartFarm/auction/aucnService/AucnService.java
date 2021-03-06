package co.smartFarm.auction.aucnService;

import java.util.List;
import java.util.Map;

public interface AucnService {
	//경매 전체 조회 (nft조인 nft이미지까지)
	List<AucnVO> aucnList();
	//경매등록
	int aucnInsert(AucnVO aucn);
	//경매 상세 조회(경매번호로 조회)
	AucnVO aucnSelect(int aucnNo);
	//SYSDATE 로 비교하여 설정시간부터 하루가 지나지 않은 경매 품목만 출력
	List<AucnVO> aucnEnable();
	//경매 입찰시 현재 최고 금액을 찾고 비교후 입찰금액이 현재 금액보다 높을시 입찰금액과 회원아이디 업데이트
	Integer aucnBid(AucnVO aucn);
	//경매등록시 만들어지는 최고 번호
	int aucnNoselect();
	//경매 끝난게 있는지 없는지 체크
	int aucnEndCheck();
	//경매 끝난게 있으면 종료 업데이트
	Integer aucnEnd();
	//경매 끝난 경매리스트 들고옴
	List<AucnVO> aucnEndNo();
	
	List<Map<String, Object>> aucnEndCheckdo();
	
	//경매가 끝난 입찰내역 불러오기
	List<BidHistoryVO> bidHistoryList(String memEmail);
	//출금시 입찰내역 삭제
	int bidHistoryDelete(int bidHistoryNo);
	//출금시 경매번호 들고오기
	int bidHistoryAucnNo(int bidHistoryNo);
}

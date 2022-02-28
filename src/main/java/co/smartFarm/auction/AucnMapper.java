package co.smartFarm.auction;

import java.util.List;

public interface AucnMapper {
	//경매 전체 조회 (nft조인 nft이미지까지)
	List<AucnVO> aucnList();
	//경매등록
	int aucnInsert(AucnVO aucn);
}

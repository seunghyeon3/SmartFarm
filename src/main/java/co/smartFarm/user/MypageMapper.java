package co.smartFarm.user;

import java.util.List;

import co.smartFarm.auction.NftVO;

public interface MypageMapper {
	// NFT 생성버튼을 누를시 NFT테이블에 데이터가 입력되고 
	// 재배일지 테이블 nft생성여부를 업데이트한다.
	List<NftVO> createNft(NftVO nft);
	
	
}

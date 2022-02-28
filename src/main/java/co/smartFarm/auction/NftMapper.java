package co.smartFarm.auction;

import java.util.List;

public interface NftMapper {
	//유저이메일로 소유하고 있는 nft조회 
	List<NftVO> selectNftMyList(String memEmail);
	
	//nft번호로 단건조회
	NftVO selectMyNft(int nftNo);
}

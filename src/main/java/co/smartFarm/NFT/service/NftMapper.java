package co.smartFarm.NFT.service;

import java.util.List;

public interface NftMapper {
	//유저이메일로 소유하고 있는 nft조회 
	List<NftVO> selectNftMyList(String memEmail);
	
	//nft번호로 단건조회
	NftVO selectMyNft(int nftNo);
	
	
	//220302 PSH MypageMapper -> NFTMapper 구분 작업
	// NFT 생성버튼을 누를시 NFT테이블에 데이터가 입력되고 
	// 재배일지 테이블 nft생성여부를 업데이트한다.
	List<NftVO> createNft(NftVO nft);
	
	//220302 PSH MypageMapper -> NFTMapper 구분 작업
	// NFT 생성버튼 누르고 createNft 완료될 시 nftNo 가져오기
	int noNft();
}

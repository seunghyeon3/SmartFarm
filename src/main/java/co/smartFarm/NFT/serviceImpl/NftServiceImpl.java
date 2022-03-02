package co.smartFarm.NFT.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.NFT.service.NftMapper;
import co.smartFarm.NFT.service.NftService;
import co.smartFarm.NFT.service.NftVO;

@Repository("nftDao")
public class NftServiceImpl implements NftService{

	
	@Autowired
	NftMapper map;

	@Override
	public List<NftVO> selectNftMyList(String memEmail) {
		return map.selectNftMyList(memEmail);
	}

	@Override
	public NftVO selectMyNft(int nftNo) {
		return map.selectMyNft(nftNo);
	}

	//220302 PSH Mypag -> NFT 구분 작업
	@Override
	public List<NftVO> createNft(NftVO nft) {
		return map.createNft(nft);
	}

	@Override
	public int noNft() {
		return map.noNft();
	}
	
	
}

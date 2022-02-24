package co.smartFarm.auction;

import java.util.List;

public interface NftMapper {
	List<NftVO> selectNftMyList(String memEmail);
}

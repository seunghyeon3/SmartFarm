package co.smartFarm.kit.kitService;

import java.util.List;

public interface KitMapper {
	List<KitVO> kitSelectList(String kitPrpos);

	KitVO kitSelectOneByNo(int kitNo);

	int kitUpdateWhet(KitVO kitVo);
	List<KitVO> kitSelectOne(String kitName);
	List<KitVO> adminKitSelectList();
	
	List<KitVO> kitRecommand();
	List<KitVO> adminKitRankList(KitVO kitVo);
	int kitInsert(KitVO kitVo);
	int kitUpdateHit(int kitNo);
	List<KitVO> kitSelectOrderBy(String orderBy);
}

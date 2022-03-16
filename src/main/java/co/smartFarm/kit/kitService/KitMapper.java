package co.smartFarm.kit.kitService;

import java.util.List;
import java.util.Map;

public interface KitMapper {
	List<KitVO> kitSelectList(Map<String, String> map);

	KitVO kitSelectOneByNo(int kitNo);

	int kitUpdateWhet(KitVO kitVo);
	List<KitVO> kitSelectOne(String kitName);
	List<KitVO> adminKitSelectList();
	
	List<KitVO> kitRecommand();
	List<KitVO> adminKitRankList(KitVO kitVo);
	int kitInsert(KitVO kitVo);
	int kitUpdateHit(int kitNo);
	List<KitVO> kitSelectNameDis();
}

package co.smartFarm.kit.kitService;

import java.util.List;

public interface KitMapper {
	List<KitVO> kitSelectList();

	KitVO kitSelectOneByNo(int kitNo);

	int kitUpdateWhet(KitVO kitVo);
	List<KitVO> kitSelectOne(String kitName);
	List<KitVO> adminKitSelectList();
	
	List<KitVO> kitRecommand();
}

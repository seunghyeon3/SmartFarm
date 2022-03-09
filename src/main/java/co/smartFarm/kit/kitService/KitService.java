package co.smartFarm.kit.kitService;

import java.util.List;

public interface KitService {
	List<KitVO> kitSelectList();

	KitVO kitSelectOneByNo(int kitNo);

	int kitUpdateWhet(KitVO kitVo);
	List<KitVO> kitSelectOne(String kitName);
	List<KitVO> adminKitSelectList();
}

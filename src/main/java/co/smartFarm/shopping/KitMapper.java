package co.smartFarm.shopping;

import java.util.List;

public interface KitMapper {
	List<KitVO> kitSelectList();

	KitVO kitSelectOne(int kitNo);

	int kitUpdateWhet(KitVO kitVo);
	List<KitVO> kitSelectOne(String kitName);

}

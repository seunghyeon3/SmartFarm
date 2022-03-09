package co.smartFarm.kit.kitService;

import java.util.List;

public interface KitService {
	List<KitVO> kitSelectList();

	KitVO kitSelectOneByNo(int kitNo);

	int kitUpdateWhet(KitVO kitVo);
	List<KitVO> kitSelectOne(String kitName);

	List<KitVO> adminKitSelectList();

	//220309 PSH 메인 페이지 추천 키트 소개를 판매 순으로 출력하기 위해 추가
	List<KitVO> kitRecommand();
}

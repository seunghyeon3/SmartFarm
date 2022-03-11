package co.smartFarm.kit.kitServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.kit.kitService.KitMapper;
import co.smartFarm.kit.kitService.KitService;
import co.smartFarm.kit.kitService.KitVO;

@Repository("kitDao")
public class KitServiceImpl implements KitService{

	@Autowired
	KitMapper map;
	@Override
	public List<KitVO> kitSelectList() {
		return map.kitSelectList();
	}

	@Override
	public int kitUpdateWhet(KitVO kitVo) {
		return map.kitUpdateWhet(kitVo);
	}

	@Override
	public List<KitVO> kitSelectOne(String kitName) {
		return map.kitSelectOne(kitName);
	}

	@Override
	public KitVO kitSelectOneByNo(int kitNo) {
		return map.kitSelectOneByNo(kitNo);
	}

	@Override
	public List<KitVO> adminKitSelectList() {
		return map.adminKitSelectList();
	}
	@Override
	public List<KitVO> kitRecommand() {
		return map.kitRecommand();
	}

	@Override
	public List<KitVO> adminKitRankList(KitVO kitVo) {
		return map.adminKitRankList(kitVo);
	}

	@Override
	public int kitInsert(KitVO kitVo) {
		return map.kitInsert(kitVo);
	}

	
}

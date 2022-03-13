package co.smartFarm.shopping.purHisServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.shopping.purHisService.PurHisMapper;
import co.smartFarm.shopping.purHisService.PurHisService;
import co.smartFarm.shopping.purHisService.PurHisVO;

@Repository("purHisDao")
public class PurHisServiceImpl implements PurHisService{

	@Autowired
	PurHisMapper map;
	
	@Override
	public Integer purHisInsert(PurHisVO purHisVo) {
		
		return map.purHisInsert(purHisVo);
	}

	@Override
	public List<PurHisVO> adminPurHisSelectList(PurHisVO purHisVo) {
		
		return map.adminPurHisSelectList(purHisVo);
	}

	@Override
	public List<PurHisVO> purHisPriceSelect() {
		return map.purHisPriceSelect();
	}

	@Override
	public List<PurHisVO> purHisRevwSelect(String memEmail) {
		return map.purHisRevwSelect(memEmail);
	}

	@Override
	public List<PurHisVO> purHisSelect(String mem_email) {
		return map.purHisSelect(mem_email);
	}
}

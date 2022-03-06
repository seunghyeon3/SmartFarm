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
}

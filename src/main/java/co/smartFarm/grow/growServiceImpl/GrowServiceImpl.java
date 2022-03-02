package co.smartFarm.grow.growServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.grow.growService.GrowMapper;
import co.smartFarm.grow.growService.GrowService;
import co.smartFarm.grow.growService.GrowVO;

//220302 PSH 서비스 나누면서 DAO 명 수정 ( mapg -> GrowDao)
@Repository("growDao")
public class GrowServiceImpl implements GrowService{
	
	@Autowired
	GrowMapper map;

	@Override
	public List<GrowVO> growList(String memEmail) {
		return map.growList(memEmail);
	}

	@Override
	public List<GrowVO> growComList(String memEmail) {
		return map.growComList(memEmail);
	}

	@Override
	public List<GrowVO> orderNumber(String memEmail) {
		return map.orderNumber(memEmail);
	}

}

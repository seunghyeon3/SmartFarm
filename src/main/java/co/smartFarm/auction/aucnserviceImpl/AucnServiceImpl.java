package co.smartFarm.auction.aucnserviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.auction.aucnService.AucnMapper;
import co.smartFarm.auction.aucnService.AucnService;
import co.smartFarm.auction.aucnService.AucnVO;

@Repository("aucnDao")
public class AucnServiceImpl implements AucnService{

	@Autowired
	AucnMapper map;
	
	@Override
	public List<AucnVO> aucnList() {
		return map.aucnList();
	}

	@Override
	public int aucnInsert(AucnVO aucn) {
		return map.aucnInsert(aucn);
	}

	@Override
	public AucnVO aucnSelect(int aucnNo) {
		return map.aucnSelect(aucnNo);
	}

	@Override
	public List<AucnVO> aucnEnable() {
		return map.aucnEnable();
	}

	
}

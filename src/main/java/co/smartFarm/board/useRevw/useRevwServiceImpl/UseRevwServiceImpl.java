package co.smartFarm.board.useRevw.useRevwServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.useRevw.useRevwService.UseRevwMapper;
import co.smartFarm.board.useRevw.useRevwService.UseRevwService;
import co.smartFarm.board.useRevw.useRevwService.UseRevwVO;

@Repository("useRevwDao")
public class UseRevwServiceImpl implements UseRevwService{

	@Autowired
	UseRevwMapper map;
	
	@Override
	public List<UseRevwVO> useRevwList() {
		return map.useRevwList();
	}

	@Override
	public int createRevw(UseRevwVO useRevw) {
		return map.createRevw(useRevw);
	}
	
	@Override	
	public List<UseRevwVO> recentlyUseRevw() {
		return map.recentlyUseRevw();
	}
	
}

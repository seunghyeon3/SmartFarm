package co.smartFarm.board.useRevw.useRevwServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.useRevw.useRevwService.UseRevwCommVO;
import co.smartFarm.board.useRevw.useRevwService.UseRevwMapper;
import co.smartFarm.board.useRevw.useRevwService.UseRevwService;
import co.smartFarm.board.useRevw.useRevwService.UseRevwVO;
import co.smartFarm.shopping.purHisService.PurHisVO;

@Repository("useRevwDao")
public class UseRevwServiceImpl implements UseRevwService{

	@Autowired
	UseRevwMapper map;
	
	@Override
	public List<UseRevwVO> useRevwList() {
		return map.useRevwList();
	}

	@Override
	public Integer createRevw(UseRevwVO useRevw) {
		return map.createRevw(useRevw);
	}
	
	@Override	
	public List<UseRevwVO> recentlyUseRevw() {
		return map.recentlyUseRevw();
	}

	@Override
	public UseRevwVO useRevwDetail(int useRevwNo) {
		return map.useRevwDetail(useRevwNo);
	}

	@Override
	public PurHisVO purHisSelectNo(UseRevwVO useRevw) {
		return map.purHisSelectNo(useRevw);
	}

	@Override
	public int updateRevw(UseRevwVO useRevw) {
		return map.updateRevw(useRevw);
	}

	@Override
	public int deleteRevw(int useRevwNo) {
		return map.deleteRevw(useRevwNo);
	}

	@Override
	public List<UseRevwVO> useRevwSearchList(String useRevwTitle) {
		return map.useRevwSearchList(useRevwTitle);
	}

	@Override
	public int updateRevwHit(int useRevwNo) {
		return map.updateRevwHit(useRevwNo);
	}

	@Override
	public List<UseRevwCommVO> useRevwCommList(int use_revw_no) {
		return map.useRevwCommList(use_revw_no);
	}

	@Override
	public int useRevwCommInsert(UseRevwCommVO useRevwComm) {
		return map.useRevwCommInsert(useRevwComm);
	}

	@Override
	public int useRevwCommDelete(int useRevwCommNo) {
		return map.useRevwCommDelete(useRevwCommNo);
	}
	
}

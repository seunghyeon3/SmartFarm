package co.smartFarm.board.free.freeServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.free.freeService.FreeMapper;
import co.smartFarm.board.free.freeService.FreeService;
import co.smartFarm.board.free.freeService.FreeVO;

@Repository("freeDao")
public class FreeServiceImpl implements FreeService{

	@Autowired
	private FreeMapper map;

	@Override
	public List<FreeVO> freeList() {		
		return map.freeList();
	}

	@Override
	public FreeVO freeOne(int free_no) {
		return map.freeOne(free_no);
	}
	
	@Override
	public int freeInsert(FreeVO free) {
		return map.freeInsert(free);
	}
	
	@Override
	public FreeVO freeSelect(FreeVO free) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<FreeVO> freeCommList(int free_no) {
		return map.freeCommList(free_no);
	}
	
	@Override
	public int freeCommInsert(FreeVO free) {
		return map.freeCommInsert(free);
	}
	
	@Override
	public FreeVO freeCommCount(int free_no) {
		return map.freeCommCount(free_no);
	}
	
	@Override
	public int freeUpdate(FreeVO free) {
		return map.freeUpdate(free);
	}
	
	@Override
	public int freeDelete(int free_no) {
		return map.freeDelete(free_no);
	}

	
	@Override
	public List<FreeVO> recentlyFree() {
		return map.recentlyFree();
	}
}

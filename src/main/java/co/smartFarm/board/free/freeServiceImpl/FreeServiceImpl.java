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
	public FreeVO freeSelect(FreeVO free) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int noticeInsert(FreeVO free) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int noticeDelete(FreeVO free) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int freeUpdate(FreeVO free) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int freeNoUpdate(int free_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FreeVO> freeSearch(String key, String val) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}

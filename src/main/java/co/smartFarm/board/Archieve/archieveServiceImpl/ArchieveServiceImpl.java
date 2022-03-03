package co.smartFarm.board.Archieve.archieveServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.Archieve.archieveService.ArchieveMapper;
import co.smartFarm.board.Archieve.archieveService.ArchieveService;
import co.smartFarm.board.Archieve.archieveService.ArchieveVO;


@Repository("archieveDao")
public class ArchieveServiceImpl implements ArchieveService{

	@Autowired
	ArchieveMapper map;

	@Override
	public List<ArchieveVO> archieveSelectList() {
		return map.archieveSelectList();
	}

	@Override
	public ArchieveVO archieveSelect(int archieve_no) {
		return map.archieveSelect(archieve_no);
	}

	@Override
	public ArchieveVO archieveSelect(ArchieveVO archieve) {
		return map.archieveSelect(archieve);
	}

	@Override
	public int archieveInsert(ArchieveVO archieve) {
		return map.archieveInsert(archieve);
	}

	@Override
	public int archieveDelete(ArchieveVO archieve) {
		return map.archieveDelete(archieve);
	}

	@Override
	//220302 해당부분 쓰는거 맞는지 재확인
	public int archieveUpdate(ArchieveVO archieve) {
		return map.archieveUpdate(archieve);
	}

	@Override
	public int archieveHitUpdate(int archive_no) {
		return map.archieveHitUpdate(archive_no);
	}

	@Override
	public int archieveNoUpdate(int archive_no) {
		return map.archieveNoUpdate(archive_no);
	}

	@Override
	public List<ArchieveVO> archieveSearch(String key, String val) {
		return map.archieveSearch(key, val);
	}

	@Override
	public String writeValueAsString(List<ArchieveVO> archieveSelectList) {
		return map.writeValueAsString(archieveSelectList);
	} 
}

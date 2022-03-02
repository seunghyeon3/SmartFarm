package co.smartFarm.board.Archieve.archieveService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

//220302 PSH Service 추가
public interface ArchieveService {
	List<ArchieveVO> archieveSelectList();
	ArchieveVO archieveSelect(int archieve_no);
	ArchieveVO archieveSelect(ArchieveVO archieve);
	int archieveInsert(ArchieveVO archieve);
	int archieveDelete(ArchieveVO archieve);
	int archieveUpdate(ArchieveVO archieve);
	
	int archieveHitUpdate(int archive_no);
	int archieveNoUpdate(int archive_no);
	List<ArchieveVO> archieveSearch(@Param("key")String key, @Param("val")String val);
	String writeValueAsString(List<ArchieveVO> archieveSelectList);
}

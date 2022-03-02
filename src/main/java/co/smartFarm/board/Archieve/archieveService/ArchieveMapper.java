package co.smartFarm.board.archieve.archieveService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ArchieveMapper {
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

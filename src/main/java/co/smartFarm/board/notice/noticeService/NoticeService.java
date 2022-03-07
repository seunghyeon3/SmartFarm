package co.smartFarm.board.notice.noticeService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.smartFarm.board.Archieve.archieveService.ArchieveVO;

public interface NoticeService {

	List<NoticeVO> noticeSelectList();
	NoticeVO noticeinsertSelect(int notice_no);
	NoticeVO noticeSelect(NoticeVO notice);
	int noticeInsert(NoticeVO notice);
	int noticeDelete(NoticeVO notice);
	int noticeUpdate(NoticeVO notice);
	
	int noticeHitUpdate(int notice_no); 
	int noticeNoUpdate(int notice_no); 
	List<NoticeVO> noticeSearch(@Param("key")String key, @Param("val") String val);
	String writeValueAsString(List<NoticeVO> noticeSelectList);

}

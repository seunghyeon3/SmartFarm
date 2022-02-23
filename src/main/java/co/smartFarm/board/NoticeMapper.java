package co.smartFarm.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NoticeMapper {
	
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeinsertSelect(int notice_no);
	NoticeVO noticeSelect(NoticeVO notice);
	int noticeInsert(NoticeVO notice);
	int noticeDelete(NoticeVO notice);
	int noticeUpdate(NoticeVO notice);
	
	int noticeHitUpdate(int notice_no); 
	int noticeIdUpdate(int notice_no); 
	List<NoticeVO> noticeSearch(@Param("key")String key, @Param("val") String val);
	

}

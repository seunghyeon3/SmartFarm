package co.smartFarm.board.notice.noticeServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.notice.noticeService.NoticeMapper;
import co.smartFarm.board.notice.noticeService.NoticeService;
import co.smartFarm.board.notice.noticeService.NoticeVO;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper map;
	@Override
	public List<NoticeVO> noticeSelectList() {
		return map.noticeSelectList();
	}

	@Override
	public NoticeVO noticeinsertSelect(int notice_no) {
		return map.noticeinsertSelect(notice_no);
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO notice) {
		return map.noticeSelect(notice);
	}

	@Override
	public int noticeInsert(NoticeVO notice) {
		return map.noticeInsert(notice);
	}

	@Override
	public int noticeDelete(NoticeVO notice) {
		return map.noticeDelete(notice);
	}

	@Override
	public int noticeUpdate(NoticeVO notice) {
		return map.noticeUpdate(notice);
	}

	@Override
	public int noticeHitUpdate(int notice_no) {
		return map.noticeHitUpdate(notice_no);
	}

	@Override
	public int noticeNoUpdate(int notice_no) {
		return map.noticeNoUpdate(notice_no);
	}

	@Override
	public List<NoticeVO> noticeSearch(String key, String val) {
		return map.noticeSearch(key, val);
	}

	
	
}

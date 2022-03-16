package co.smartFarm.board.qna.qnaServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.qna.qnaService.ReplyMapper;
import co.smartFarm.board.qna.qnaService.ReplyService;
import co.smartFarm.board.qna.qnaService.ReplyVO;

@Repository("replyDao")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper map;
	
	@Override
	public List<ReplyVO> replySelectList() {
		return map.replySelectList();
	}

	@Override
	public ReplyVO replySelect(int reply_no) {
		return map.replySelect(reply_no);
	}

	@Override
	public List<ReplyVO> replySelectList(ReplyVO reply) {
		return map.replySelectList(reply);
	}

	@Override
	public int replyInsert(ReplyVO reply) {
		return map.replyInsert(reply);
	}

	@Override
	public int replyDelete(ReplyVO reply) {
		return map.replyDelete(reply);
	}

	@Override
	public int replyUpdate(ReplyVO reply) {
		return map.replyUpdate(reply);
	}


}

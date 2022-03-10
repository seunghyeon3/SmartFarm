package co.smartFarm.board.qna.qnaService;

import java.util.List;

public interface ReplyMapper {
	List<ReplyVO> replySelectList();
	ReplyVO replySelect(int reply_no);
	List<ReplyVO> replySelectList(ReplyVO reply);
	int replyInsert(ReplyVO reply);
	int replyDelete(ReplyVO reply);
	int replyUpdate(ReplyVO reply);
	int replyUpdate(int reply_no);
	/* int replySelectUnion(); */
}

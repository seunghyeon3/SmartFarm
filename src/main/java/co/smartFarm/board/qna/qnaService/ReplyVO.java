package co.smartFarm.board.qna.qnaService;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
 
	private int reply_no; //답글 번호
	private int qna_no; //게시글 번호
	private String mem_name; //작성자
	private String reply_con; //내용
	private Date reply_day; //일시
}

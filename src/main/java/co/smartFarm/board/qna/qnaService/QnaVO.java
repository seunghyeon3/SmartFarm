package co.smartFarm.board.qna.qnaService;

import lombok.Data;

@Data
public class QnaVO {

	private int qna_no;
	private String qna_open_whet;
	private String qna_title;
	private String qna_con;
	private String qna_name;
	private int qna_hit;
	private String qna_day;
	private String qna_ori_rou;
	private String qna_pht_rou;
	private String mem_email;
}

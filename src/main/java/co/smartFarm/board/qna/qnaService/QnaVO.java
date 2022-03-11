package co.smartFarm.board.qna.qnaService;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QnaVO {

	private int qna_no; //번호 
	private String qna_open_whet; //공개 비공개
	private String qna_title; //제목
	private String qna_con; //내용
	private String mem_name; //작성자
	private int qna_hit; //조회수
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date qna_day;//일식
	private String qna_ori_rou;//원본경로
	private String qna_phy_rou;//물리경로
	private String mem_email;//이메일
}

package co.smartFarm.board.notice.noticeService;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_no;
	private String notice_title;
	private String notice_con;
	private int notice_hit;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date notice_day;
	private String notice_img;
	private String mem_name;
	
}

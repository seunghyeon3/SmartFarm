package co.smartFarm.board;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_no;
	private String notice_title;
	private String notice_con;
	private int notice_hit;
	private String notice_day;
	private String notice_img;
	private String mem_name;
	
}

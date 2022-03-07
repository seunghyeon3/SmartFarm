package co.smartFarm.board.useRevw.useRevwService;


import java.sql.Date;

import lombok.Data;

@Data
public class UseRevwVO {
	private int use_revw_no;
	private String use_revw_title;
	private String use_revw_con;
	private String mem_name;
	private String mem_email;
	private int use_revw_hit;
	private Date use_revw_write_day;
	private String use_revw_ori_rou;
	private String use_revw_phy_rou;
	private int pur_his_order_no;
	
}

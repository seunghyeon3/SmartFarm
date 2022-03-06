package co.smartFarm.shopping.purHisService;

import java.sql.Date;

import lombok.Data;

@Data
public class PurHisVO {
	private int pur_his_order_no;
	private String mem_email;
	private int kit_no;
	private int plant_sale_no;
	private String pur_his_recv;
	private String pur_his_tel;
	private String pur_his_addr;
	private int pur_his_sale_count;
	private int pur_his_price;
	private String pur_his_revw_write;
	private Date pur_his_pur_day;
	private String pur_his_state;
}

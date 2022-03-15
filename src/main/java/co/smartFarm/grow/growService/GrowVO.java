package co.smartFarm.grow.growService;

import lombok.Data;

@Data
public class GrowVO {

	private int gorw_diary_grow_no;
	private String mem_email;
	private String grow_diary_log_rou;
	private int grow_diary_point;
	private String grow_diary_grd;
	private String grow_diary_grow_nick;
	private String plant_name;
	private String grow_diary_start_day;
	private String grow_diary_nft_create_ennc;
	
//	보유키트 조회를 위한 컬럼
	private int kit_no;
	private int pur_his_order_no;
	private String pur_his_kit_address;
//	private String grow_status;
	private int kit_grow_day;
	private String kit_plant_name;
	private String kit_prpos;
	private int percent;
	private String end_estimate;
	
	private String kit_tp;
	private String kit_hd;
	private String kit_sun;
	private String kit_water;
	private String kit_pes;
	
	private int nft_no;

}

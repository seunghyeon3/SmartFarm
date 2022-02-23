package co.smartFarm.grow;

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
	
	

}

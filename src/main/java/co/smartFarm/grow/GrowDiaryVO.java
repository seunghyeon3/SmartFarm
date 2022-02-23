package co.smartFarm.grow;

import java.util.Date;

import lombok.Data;

@Data
public class GrowDiaryVO {
	private int grow_diary_grow_no;
	private String mem_email;
	private String grow_diary_log_rou;
	private int grow_diary_point;
	private String grow_diary_grd;
	private String grow_diary_grow_nick;
	private String plant_name;
	private Date grow_diary_start_day;
	private String grow_diary_nft_create_ennc;
	private int kit_no;
}

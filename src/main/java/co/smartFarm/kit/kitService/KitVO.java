package co.smartFarm.kit.kitService;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/*@Getter
@Setter*/
//220302 PSH Getter, Setter -> Data 로 변경
@Data
public class KitVO {
	private int kit_no;
	private String kit_name;
	private String kit_prpos;
	private String kit_plant_class;
	private String kit_plant_name;
	private int kit_grow_day;
	private int kit_tp;
	private int kit_hd;
	private int kit_sun;
	private int kit_water;
	private int kit_pes;
	private String kit_cctv;
	private int kit_price;
	private String kit_main_img;
	private String kit_exp_img;
	private String kit_sale_whet;
	private int kit_hit;
	private int kit_sale_count;

	// admin에서 kit rank를 확인하기 위한 컬럼
	private int pur_rank;
	private String start_date;
	private String end_date;
	private int pur_his_sale_count;

}

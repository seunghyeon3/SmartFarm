package co.smartFarm.plant.plantSaleService;

import lombok.Data;

//plant_sale vo
@Data
public class PlantSaleVO {
	private int plant_sale_no;
	private String plant_no;
	private String plant_sale_title;
	private String plant_sale_con;
	private String plant_sale_price;
	private String plant_count;
	private String plant_sale_ori_rou;
	private String plant_sale_phy_rou;
	private String plant_sale_plant_class;
	private String mem_email;
	private String mem_name;
	private String plant_sale_whet;
	
	//작물수정을 위해 필요한 컬럼
	private String plant_grd;
	private String plant_name;
	private String plant_ivy;
	private String plant_tot_grow_amnt;

}

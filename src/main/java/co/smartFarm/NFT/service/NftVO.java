package co.smartFarm.NFT.service;

import lombok.Data;

@Data
public class NftVO {
	private int nft_no;
	private String mem_email;
	private String grow_diary_log_rou;
	private String nft_img;
	private int kit_no;
	private String grow_diary_grd;
	//프로시저 때문에 생성
	private int grow_diary_grow_no;
	//admin에서 nft 조회하기 위해 필요한 컬럼
	private String kit_name;
	private int kit_sum;
	private String kit_plant_class;
	
}

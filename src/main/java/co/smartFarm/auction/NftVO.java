package co.smartFarm.auction;

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
}

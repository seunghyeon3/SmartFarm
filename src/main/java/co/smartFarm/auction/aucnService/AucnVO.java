package co.smartFarm.auction.aucnService;

import lombok.Data;

@Data
public class AucnVO {
	
	private int aucn_no;
	private String aucn_title;
	private String aucn_con;
	private String mem_name;
	private String aucn_start_time;
	private int first_bid;
	private int now_bid;
	private String now_bid_mem_email;
	private String aucn_whet;
	private String mem_email;
	private int nft_no;
	//경매메인페이지를 위한 nft 사진
	private String nft_img;
	//경매디테일페이지를 위한 kit 용도
	private String kit_prpos;
	//경매디테일페이지를 위한 kit 작물 이름
	private String kit_plant_name;
}

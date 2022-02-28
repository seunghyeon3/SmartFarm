package co.smartFarm.auction;

import lombok.Data;

@Data
public class AucnVO {
	
	private int aucn_no;
	private String aucn_title;
	private String aucn_con;
	private String mem_name;
	private String aucn_start_time;
	private double first_bid;
	private double now_bid;
	private String now_bid_mem_email;
	private String aucn_whet;
	private String mem_email;
	private int nft_no;
	//경매메인페이지를 위한 nft 사진
	private String nft_img;
}

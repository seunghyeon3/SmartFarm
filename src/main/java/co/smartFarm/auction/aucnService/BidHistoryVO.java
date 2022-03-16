package co.smartFarm.auction.aucnService;

import lombok.Data;

@Data
public class BidHistoryVO {
	
	private int bid_history_no;
	private int bid_history_bid;
	private String bid_history_mem_email;
	private String withdraw_whet;
	private int aucn_no;
	private String aucn_whet;
	
}

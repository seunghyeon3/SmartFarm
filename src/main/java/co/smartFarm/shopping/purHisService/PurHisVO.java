package co.smartFarm.shopping.purHisService;

import java.sql.Date;

import lombok.Data;

@Data
public class PurHisVO {
	private int pur_his_order_no;
	private String mem_email;
	private int kit_no;
	private int plant_sale_no;
	private String pur_his_recv;
	private String pur_his_tel;
	private String pur_his_addr;
	private int pur_his_sale_count;
	private int pur_his_price;
	private String pur_his_revw_write;
	private String pur_his_pur_day;
	private String pur_his_state;

	// admin 페이지에서 매출을 표시하기 위한 컬럼
	private int pur_count; // 구매수
	private int plant_sum; // 작물 판매 금액
	private int kit_sum; // 키트 판매 금액
	private int pur_sum; // 전체 판매 금액
	private String start_date;
	private String end_date; // 일자 받아오기
	
	// 이용후기 페이지에서 상품 이름을 표시하기 위한 컬럼
	private String kit_name;
	private String plant_sale_title;
	
}

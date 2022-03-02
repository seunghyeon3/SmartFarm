package co.smartFarm.shopping;

import java.sql.Date;

import lombok.Data;

@Data
public class CartVO {
	private int cart_sale_count;
	private int cart_price;
	private int cart_plant_no;
	private int cart_kit_no;
	private Date cart_day;
	private String mem_email;
	
	//장바구니 삭제버튼 입력하기 위한 변수
	private String cart_option;
	//장바구니 총액을 위한 변수
	private int cart_sum;
}

package co.smartFarm.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private String mem_email;
	private String mem_pw;
	private String mem_addr;
	private String mem_det_addr;
	private String mem_name;
	private String mem_athr; //B0:관리자 | B1:일반회원 | B2:농부
	private String mem_fm_req;
	private String mem_tel;
	
	//농부신청 결과를 보기위해 추가
	private String mem_fm_result;
}

package co.smartFarm.user;

import java.util.List;

public interface MemberMapper {
	List<MemberVO> memberSelectList();
	MemberVO memberEmailCheck(String email);
	
	
}

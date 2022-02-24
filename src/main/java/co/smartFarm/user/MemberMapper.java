package co.smartFarm.user;

import java.util.List;

public interface MemberMapper {
	List<MemberVO> memberSelectList();
	MemberVO emailCheck(MemberVO memberVo);
	int memberReqAccept(String memEmail);
	MemberVO loginCheck (MemberVO memberVo);
	int memberInsert(MemberVO memberVo);
	
}

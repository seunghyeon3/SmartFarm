package co.smartFarm.user.memberService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberService {
	List<MemberVO> memberSelectList();
	MemberVO emailCheck(MemberVO memberVo);
	MemberVO loginCheck (MemberVO memberVo);
	int memberInsert(MemberVO memberVo);
	int memberUpdatePw(MemberVO memberVo);
	int memberAcceptAthr(String mem_email);
	int memberRejectAthr(String mem_email);
	List<MemberVO> memberSelectKeyList(@Param("key") String key, @Param("val") String val);
	int memberDelete(String mem_email);
	int memberUpdate(MemberVO memberVo);
	int memberUpdateFarmer(MemberVO memberVo);
}

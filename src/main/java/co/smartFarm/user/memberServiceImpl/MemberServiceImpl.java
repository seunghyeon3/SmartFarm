package co.smartFarm.user.memberServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.user.memberService.MemberMapper;
import co.smartFarm.user.memberService.MemberService;
import co.smartFarm.user.memberService.MemberVO;

@Repository("memberDao")
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper map;
	
	@Override
	public List<MemberVO> memberSelectList() {
		return map.memberSelectList();
	}

	@Override
	public MemberVO emailCheck(MemberVO memberVo) {
		return map.emailCheck(memberVo);
	}

	@Override
	public MemberVO loginCheck(MemberVO memberVo) {
		return map.loginCheck(memberVo);
	}

	@Override
	public int memberInsert(MemberVO memberVo) {
		return map.memberInsert(memberVo);
	}

	@Override
	public int memberUpdatePw(MemberVO memberVo) {
		return map.memberUpdatePw(memberVo);
	}

	@Override
	public int memberAcceptAthr(String mem_email) {
		return map.memberAcceptAthr(mem_email);
	}

	@Override
	public int memberRejectAthr(String mem_email) {
		return map.memberRejectAthr(mem_email);
	}

	@Override
	public List<MemberVO> memberSelectKeyList(String key, String val) {
		return map.memberSelectKeyList(key, val);
	}

	@Override
	public int memberDelete(String mem_email) {
		return map.memberDelete(mem_email);
	}

	@Override
	public int memberUpdate(MemberVO memberVo) {
		return map.memberUpdate(memberVo);
	}

	@Override
	public int memberUpdateFarmer(MemberVO memberVo) {
		return map.memberUpdateFarmer(memberVo);
	}

}

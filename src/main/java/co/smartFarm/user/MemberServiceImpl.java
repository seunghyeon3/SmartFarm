package co.smartFarm.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper map;

	@Override
	public List<MemberVO> memberSelectList() {
		return map.memberSelectList();
	}

}

package co.smartFarm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import co.smartFarm.user.memberService.MemberMapper;
import co.smartFarm.user.memberService.MemberVO;


public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	MemberMapper memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		MemberVO membervo = new MemberVO();
		membervo.setMem_email(username);
		membervo = memberDao.loginCheck(membervo);
		if(membervo == null) {
			throw new UsernameNotFoundException("no user");
		}
		return membervo;
	}

}

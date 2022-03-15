package co.smartFarm.user.memberService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Nonnull;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

/*@Getter
@Setter*/
//220302 PSH Getter, Setter -> Data로 수정
@Data
@NoArgsConstructor // 기본생성자
@RequiredArgsConstructor // nonNull만 생성하는 생성자
public class MemberVO implements UserDetails{
	
	@Nonnull
	private String mem_email;
	private String mem_pw;
	private String mem_addr;
	private String mem_det_addr;
	@Nonnull
	private String mem_name;
	@Nonnull
	private String mem_athr; //B0:관리자 | B1:일반회원 | B2:농부
	@Nonnull
	private String mem_fm_req;
	private String mem_tel;
	
	//농부신청 결과를 보기위해 추가
	@Nonnull
	private String mem_fm_result;
	
	private String role_athr;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority(this.getRole()));
		return auth;
	}

	private String getRole() {
		return role_athr;
	}

	@Override
	public String getPassword() {
		return mem_pw;
	}

	@Override
	public String getUsername() {
		return mem_email;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}

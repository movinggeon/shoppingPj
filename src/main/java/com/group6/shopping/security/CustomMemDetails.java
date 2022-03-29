package com.group6.shopping.security;

import java.util.ArrayList;
import java.util.Collection;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CustomMemDetails implements UserDetails{

    private String mem_name;
    private String mem_id;
    private String mem_password;
    private String mem_email;
	private String mem_phone;
    private String mem_birth;
    private String mem_post_code;
    private String mem_address;
    private int mem_point;
    private String mem_auth;
    private int mem_enable;
    
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		authList.add(new SimpleGrantedAuthority(mem_auth));
		return authList;
	}

	@Override
	public String getPassword() {
		return mem_password;
	}

	@Override
	public String getUsername() {
		return mem_id;
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
		return mem_enable==1?true:false;
	}

	public String getName() {
		return mem_name;
	}

	public void setName(String name) {
		this.mem_name = name;
	}
}

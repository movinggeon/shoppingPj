package com.group6.shopping.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.group6.shopping.batis.MembersDAO;

public class CustomMemDetailsService implements UserDetailsService{
	
	@Autowired
	MembersDAO membersDAO;
	
	@Override
	public UserDetails loadUserByUsername(String memId) {
		CustomMemDetails members = null;
		
		try {
			members = membersDAO.getMemById(memId);

			if(members == null) {
				throw new InternalAuthenticationServiceException(memId);
			}
			/*System.out.println("**************Found user***************");
			System.out.println("id : " + members.getUsername());*/
			return members;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return members;
		
	}

}

package com.group6.shopping.login.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.MembersDAO;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	MembersDAO membersDAO;

	@Override
	public List<String> findId(String memEmail) throws Exception {
		return membersDAO.findId(memEmail);
	}

	@Override
	public int findIdCheck(String memEmail) throws Exception {
		return membersDAO.findIdCheck(memEmail);
	}

	@Override
	public int findPwCheck(HashMap<String, String> param) throws Exception {
		return membersDAO.findPwCheck(param);
	}

	@Override
	public void findPw(HashMap<String, String> param) throws Exception {
		membersDAO.findPw(param);
	}
}

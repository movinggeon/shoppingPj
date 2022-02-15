package com.group6.shopping.members.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.group6.shopping.members.dao.MembersDAO;
import com.group6.shopping.members.vo.MembersVO;

@Service
public class MembersServiceImpl implements MembersService{

	@Inject
	private MembersDAO membersDAO;
	
	@Override
	public List<MembersVO> getAllMembers() throws Exception{
		
		return membersDAO.getAllMembers();
	}
}

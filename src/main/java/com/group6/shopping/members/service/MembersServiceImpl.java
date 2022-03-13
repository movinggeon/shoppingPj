package com.group6.shopping.members.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.members.dao.MembersDAO;
import com.group6.shopping.members.vo.MembersVO;

@Service("memberService")
public class MembersServiceImpl implements MembersService{

	@Autowired
	private MembersDAO membersDAO;
	
	@Override
	public List<MembersVO> getAllMembers() throws Exception{
		System.out.println("여기");
		return membersDAO.getAllMembers();
	}
	
	@Override
	public String lookupId(String memId) throws Exception{

		return membersDAO.lookupId(memId);
	}
	
	@Override
	 public void insertMem(MembersVO membersVO) throws Exception{
		
		membersDAO.insertMem(membersVO);
	}
}

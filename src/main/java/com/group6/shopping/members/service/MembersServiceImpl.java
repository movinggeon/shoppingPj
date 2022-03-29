package com.group6.shopping.members.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.MembersDAO;
import com.group6.shopping.members.vo.MembersVO;

@Service("memberService")
public class MembersServiceImpl implements MembersService{

	@Autowired
	MembersDAO membersDAO;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public List<MembersVO> getAllMembers() throws Exception{
		return membersDAO.getAllMembers();
	}
	
	@Override
	public String lookupId(String memId) throws Exception{
		return membersDAO.lookupId(memId);
	}
	
	@Override
	 public void insertMem(MembersVO membersVO) throws Exception{
		membersVO.setMem_password(bcryptPasswordEncoder.encode(membersVO.getMem_password()));
		membersDAO.insertMem(membersVO);
	}

	@Override
	public int usePoint(MembersVO membersVO) throws Exception {
		return membersDAO.usePoint(membersVO);
	}

	@Override
	public int addPoint(MembersVO membersVO) throws Exception {
		return membersDAO.addPoint(membersVO);
	}

	@Override
	public void modifyMem(HashMap<String, String> param) throws Exception {
		membersDAO.modifyMem(param);
	}

	@Override
	public String pwCheck(String memId) throws Exception {
		return membersDAO.pwCheck(memId);
	}

	@Override
	public void modifyPw(HashMap<String, String> param) throws Exception {

		membersDAO.modifyPw(param);
	}

	@Override
	public void deleteMem(String memId) throws Exception {
		membersDAO.deleteMem(memId);
	}


}

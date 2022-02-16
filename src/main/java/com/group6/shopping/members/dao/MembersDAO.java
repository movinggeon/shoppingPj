package com.group6.shopping.members.dao;

import java.util.List;

import com.group6.shopping.members.vo.MembersVO;


public interface MembersDAO {
    
    public List<MembersVO> getAllMembers() throws Exception;
    public String lookupId(String memId) throws Exception;
    public void insertMem(MembersVO membersVO) throws Exception;
}

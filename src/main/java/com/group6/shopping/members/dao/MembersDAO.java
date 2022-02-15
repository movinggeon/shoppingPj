package com.group6.shopping.members.dao;

import java.util.List;

import com.group6.shopping.members.vo.MembersVO;

//@Mapper
public interface MembersDAO {
    
    public List<MembersVO> getAllMembers() throws Exception;
}

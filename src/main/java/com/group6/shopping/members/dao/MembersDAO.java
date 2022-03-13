package com.group6.shopping.members.dao;

import java.util.List;

import com.group6.shopping.members.vo.MembersVO;
import com.group6.shopping.security.CustomMemDetails;
import org.apache.ibatis.annotations.Mapper;

public interface MembersDAO {
    
    public List<MembersVO> getAllMembers() throws Exception;
    public String lookupId(String memId) throws Exception;
    public void insertMem(MembersVO membersVO) throws Exception;
    public CustomMemDetails getMemById(String memId) throws Exception;
}
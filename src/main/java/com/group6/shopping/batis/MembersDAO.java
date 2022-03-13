package com.group6.shopping.batis;

import java.util.List;

import com.group6.shopping.members.vo.MembersVO;
import com.group6.shopping.security.CustomMemDetails;
import org.springframework.stereotype.Repository;

@Repository
public interface MembersDAO {
    
    public List<MembersVO> getAllMembers() throws Exception;
    public String lookupId(String memId) throws Exception;
    public void insertMem(MembersVO membersVO) throws Exception;
    public CustomMemDetails getMemById(String memId) throws Exception;
}
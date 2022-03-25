package com.group6.shopping.members.service;

import java.util.HashMap;
import java.util.List;

import com.group6.shopping.members.vo.MembersVO;

public interface MembersService {
    
    public List<MembersVO> getAllMembers() throws Exception;
    public String lookupId(String memId) throws Exception;
    public void insertMem(MembersVO membersVO) throws Exception;
   public void modifyMem(HashMap<String, String> param) throws Exception;
   public String pwCheck(String memId) throws Exception;
    public void modifyPw(HashMap<String, String> param) throws Exception;
    public void deleteMem(String memId) throws Exception;
}

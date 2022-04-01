package com.group6.shopping.batis;

import com.group6.shopping.members.vo.MembersVO;
import com.group6.shopping.security.CustomMemDetails;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface MembersDAO {

    public List<MembersVO> getAllMembers() throws Exception;
    public String lookupId(String memId) throws Exception;
    public void insertMem(MembersVO membersVO) throws Exception;
    public CustomMemDetails getMemById(String memId) throws Exception;
    public int usePoint(MembersVO membersVO) throws Exception;
    public int addPoint(MembersVO membersVO) throws Exception;
    public void modifyMem(HashMap<String, String> param) throws Exception;
    public String pwCheck(String memId) throws Exception;
    public void modifyPw(HashMap<String, String> param) throws Exception;
    public void deleteMem(String memId) throws Exception;
    public List<String> findId(String memEmail) throws Exception;
    public int findIdCheck(String memEmail) throws Exception;
    public int findPwCheck(HashMap<String, String> param) throws Exception;
    public void findPw(HashMap<String, String> param) throws Exception;
}

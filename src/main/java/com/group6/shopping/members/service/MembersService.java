package com.group6.shopping.members.service;

import java.util.List;

import com.group6.shopping.members.vo.MembersVO;

public interface MembersService {
    
    public List<MembersVO> getAllMembers() throws Exception;
}

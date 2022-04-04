package com.group6.shopping.login.service;

import java.util.HashMap;
import java.util.List;

public interface LoginService {

    public List<String> findId(String memEmail) throws Exception;
    public int findIdCheck(String memEmail) throws Exception;
    public int findPwCheck(HashMap<String, String> param) throws Exception;
    public void findPw(HashMap<String, String> param) throws Exception;
}

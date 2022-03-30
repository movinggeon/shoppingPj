package com.group6.shopping.admin.controllers;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.group6.shopping.members.service.MembersService;

@RestController
public class AdminRestController {
	
    @Autowired
    private MembersService membersService;
    
    @PostMapping(value = "/admin/delete/deleteMem")
    public HashMap<String, String> DeleteMem(@RequestBody HashMap<String, Object> param, HttpSession session) throws Exception {
        HashMap<String, String> result = new HashMap<String, String >();

        String memId = (String) param.get("mem_id");
        
        membersService.deleteMem(memId);
        
        result.put("success", "계정삭제 완료");
        
        return result;
    }
}

package com.group6.shopping.members.controllers;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;

@Controller
public class MembersController {
    
	@Inject
	private MembersService membersService;

    @RequestMapping(value = "/join")
    public String join(Model model) throws Exception{
    	
    	//mybatis 실행 확인
    	List<MembersVO> membersList = membersService.getAllMembers();
    	model.addAttribute("memberList", membersList);

        System.out.println("joinController 호출됨");
        
        int year = Calendar.getInstance().get(Calendar.YEAR);
        model.addAttribute("year", year);

        return "login/join";
    }
}

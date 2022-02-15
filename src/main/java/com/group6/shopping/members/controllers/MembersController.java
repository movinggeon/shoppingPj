package com.group6.shopping.members.controllers;

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

        System.out.println("joinController 호출됨");

        List<MembersVO> membersList = membersService.getAllMembers();

        model.addAttribute("memberList", membersList);

        return "login/join";
    }
}

package com.group6.shopping.admin.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;

@Controller
public class AdminController {

	@Autowired
	MembersService membersService;
	
	@RequestMapping(value = "/admin")
	public String accessAdmin() {

		return "admin/index";
	}

	@RequestMapping(value = "/admin/nofragment/memberList")
	public String memberList(Model model) throws Exception {
		
		List<MembersVO> memberList = new ArrayList<MembersVO>();
		memberList = membersService.getAllMembers();
		
		model.addAttribute("memberList", memberList);
		
		return "admin/nofragment/members/memberList";
	}
}

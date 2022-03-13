package com.group6.shopping.members.controllers;

import com.group6.shopping.members.dao.MembersDAO;
import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/member")
public class MembersController {

	@Autowired
	MembersService membersService;

	@GetMapping(value = "/")
	public String accessMember(Model model) throws Exception {
		List<MembersVO> vo = membersService.getAllMembers();
		for(MembersVO tmp : vo){
			System.out.println(tmp.getMem_name());
		}
		model.addAttribute("vo",vo);
		return "member/index";
	}
}

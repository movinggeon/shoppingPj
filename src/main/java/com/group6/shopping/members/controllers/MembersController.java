package com.group6.shopping.members.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MembersController {

	
	@GetMapping(value = "/")
	public String accessMember() {
		
		return "member/index";
	}
}

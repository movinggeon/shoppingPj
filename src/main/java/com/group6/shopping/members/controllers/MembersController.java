package com.group6.shopping.members.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/member")
public class MembersController {


	@GetMapping(value = "/")
	public String accessMember(Model model) throws Exception {
		return "member/index";
	}
}

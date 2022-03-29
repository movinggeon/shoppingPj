package com.group6.shopping.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@GetMapping(value = "/qwe/admin")
	public String accessAdmin() {

		return "/admin/index";
	}

	@GetMapping(value = "/qwe/member")
	public String accessMember() {

		return "/members/index";
	}


}

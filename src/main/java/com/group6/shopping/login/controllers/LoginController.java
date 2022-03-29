package com.group6.shopping.login.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request) {
		System.out.println("loginController 호출됨");
		return "members/login/login";
	}
}

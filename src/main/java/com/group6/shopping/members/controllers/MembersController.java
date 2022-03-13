package com.group6.shopping.members.controllers;

import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/member")
public class MembersController {

	
	@GetMapping(value = "/")
	public String accessMember() throws Exception {

		return "member/index";
	}
}

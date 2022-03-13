package com.group6.shopping.members.controllers;

import com.group6.shopping.members.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/members")
public class MembersController {


	@Autowired
	private MembersService membersService;


	@GetMapping(value = "/")
	public String accessMember(Model model) throws Exception {
		return "members/index";
	}

	@GetMapping(value = "/join")
	public String join(Model model) throws Exception{

		//mybatis 실행 확인
		//필요없을듯
    	/*List<MembersVO> membersList = membersService.getAllMembers();
    	model.addAttribute("memberList", membersList);*/
		System.out.println("joinController 호출됨");

		int year = Calendar.getInstance().get(Calendar.YEAR);
		model.addAttribute("year", year);

		return "members/login/join";
	}

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request) {
		System.out.println("loginController 호출됨");
		return "members/login/login";
	}

	@GetMapping(value = "/accessDenied")
	public void accessDenied() {

	}
}

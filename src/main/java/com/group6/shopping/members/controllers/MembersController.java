package com.group6.shopping.members.controllers;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.shopping.members.service.MembersService;

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

	@RequestMapping(value="/member/mypage")
	public String mypage(HttpServletRequest request) {
		System.out.println("mypage로 이동");
		return "members/mypage/mypage";
	}

	@RequestMapping(value = "/member/modify")
	public String modify(HttpServletRequest request) {
		System.out.println("modify 호출");
		return "members/mypage/modify";
	}
	@RequestMapping(value ="/member/delete")
	public String delete(HttpServletRequest requet){
		System.out.println("회원탈퇴 이동");
		return "members/mypage/delete";
	}

	@RequestMapping(value = "/member/modifyPassword")
	public String modifyPassword(HttpServletRequest request){
		System.out.println("비밀번호 변경 이동");
		return "members/mypage/modifyPassword";
	}


}

package com.group6.shopping.everyone.controllers;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;

@Controller
@RequestMapping("/everyone")
public class EveryoneController {
    
	@Inject
	private MembersService membersService;

    @GetMapping(value = "/join")
    public String join(Model model) throws Exception{
    	
    	//mybatis 실행 확인
        //필요없을듯
    	/*List<MembersVO> membersList = membersService.getAllMembers();
    	model.addAttribute("memberList", membersList);*/
        System.out.println("joinController 호출됨");
        
        int year = Calendar.getInstance().get(Calendar.YEAR);
        model.addAttribute("year", year);

        return "everyone/login/join";
    }
    
    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request) {
    	System.out.println("loginController 호출됨");
    	return "everyone/login/login";
    }

    @GetMapping(value = "/accessDenied")
    public void accessDenied() {

    }
    
/*  필요없음
    @PostMapping(value = "/login/loginProcess")
    public void loginProcess() {
    	System.out.println("로그인 처리 중...");
    }*/
}

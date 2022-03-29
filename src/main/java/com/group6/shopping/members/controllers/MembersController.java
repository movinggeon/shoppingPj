package com.group6.shopping.members.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.Calendar;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.security.CustomMemDetails;
import com.group6.shopping.security.LogoutHandler;

@Controller
@RequestMapping("/members")
public class MembersController {


	@Autowired
	private MembersService membersService;

//	/*JavaMailSender 객체타입 의존성 주입위해 사용*/
//	@Autowired
//	private JavaMailSender mailSender;

	@GetMapping(value = "/")
	public String accessMember(Model model) throws Exception {
		return "members/index";
	}

//	@GetMapping(value = "/join")
//	public String join(Model model) throws Exception{
//
//		//mybatis 실행 확인
//		//필요없을듯
//    	/*List<MembersVO> membersList = membersService.getAllMembers();
//    	model.addAttribute("memberList", membersList);*/
//		System.out.println("joinController 호출됨");
//
//		int year = Calendar.getInstance().get(Calendar.YEAR);
//		model.addAttribute("year", year);
//
//		return "members/login/join";
//	}

	@GetMapping(value = "/accessDenied")
	public void accessDenied() {

	}

	@RequestMapping(value="/member/mypage")
	public String mypage() {
		
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
	
	@RequestMapping(value = "/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		LogoutHandler logoutHandler = new LogoutHandler();
		logoutHandler.onLogoutSuccess(request, response, auth);
	}

//	/* 이메일 인증 */
//	@RequestMapping(value="/mailCheck", method= RequestMethod.GET)
//	@ResponseBody
//	public String mailCheckGET(String email) throws Exception{
//
//		/* 뷰(View)로부터 넘어온 데이터 확인 */
//		System.out.println("이메일 데이터 전송확인");
//		System.out.println("인증번호:"+email);
//		/*인증번호 생성*/
//		Random random=new Random();
//		int checkNum=random.nextInt(888888)+111111;
//		System.out.println("인증번호:"+checkNum);
//
//		/*이메일 인증*/
//		String setFrom="clothes.test.teamsix@gmail.com";
//		String toMail=email;
//		String title="SIX STORE 회원가입 인증 메일입니다.";
//		String content=
//				"홈페이지를 방문해 주셔서 감사합니다"+
//						"<br><br>"+
//						"회원님의 인증번호는 "+checkNum	+"입니다."+
//						"<br>"+
//						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
//
//		try{
//
//			MimeMessage message=mailSender.createMimeMessage();
//			MimeMessageHelper helper =new MimeMessageHelper(message, true,"utf-8");
//			helper.setFrom(setFrom);
//			helper.setTo(toMail);
//			helper.setSubject(title);
//			helper.setText(content,true);
//			mailSender.send(message);
//
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		String num=Integer.toString(checkNum);
//		return num;
//	}

}

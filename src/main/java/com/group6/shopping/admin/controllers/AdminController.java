package com.group6.shopping.admin.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.shopping.coupons.services.CouponsService;
import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;
import com.group6.shopping.security.CustomMemDetails;

@Controller
public class AdminController {

	@Autowired
	MembersService membersService;
	
	@Autowired
	CouponsService couponsService;
	
	@RequestMapping(value = "/admin")
	public String accessAdmin() {

		return "admin/index";
	}

	@RequestMapping(value = "/admin/nofragment/memberList")
	public String memberList(Model model) throws Exception {
		
		List<MembersVO> memberList = new ArrayList<MembersVO>();
		memberList = membersService.getAllMembers();
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("memberCount", memberList.size());
		
		return "admin/nofragment/members/memberList";
	}
	
	@RequestMapping(value = "/admin/nofragment/createCoupon")
	public String createCoupon(Model model) throws Exception {
		
		return "admin/nofragment/coupons/createCoupon";
	}
	
	@RequestMapping(value = "/admin/nofragment/CouponList")
	public String couopnList(HttpSession session, Model model) throws Exception {
		
		List<CouponsVO> couponList = new ArrayList<CouponsVO>();
		
		CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");
		String memId = cs.getMem_id();
		
		System.out.println("접속한 관리자 계정 -> " + memId);
		
		couponList = couponsService.getAdminCoupons(memId);
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("couponCount", couponList.size());
		
		return "admin/nofragment/coupons/couponList";
	}
}

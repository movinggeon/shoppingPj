package com.group6.shopping.admin.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.group6.shopping.boards.vo.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
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
	public String memberList(Model model, String page) throws Exception {
		Integer cntMemers = membersService.getCntMember();
		PagingVO pTmp = new PagingVO(cntMemers, Integer.parseInt(page));

		List<MembersVO> memberList = new ArrayList<MembersVO>();
		memberList = membersService.getAllMembers(pTmp);
		if(!pTmp.pageCheck()){
			model.addAttribute("pageError", "Page Number is not valid");
		}else{
			model.addAttribute("page", pTmp);
		}

		model.addAttribute("memberList", memberList);
		model.addAttribute("memberCount", cntMemers);

		return "admin/nofragment/members/memberList";
	}

	@RequestMapping(value = "/admin/nofragment/createCoupon")
	public String createCoupon(Model model) throws Exception {

		return "admin/nofragment/coupons/createCoupon";
	}

	@RequestMapping(value = "/admin/nofragment/couponList")
	public String couopnList(HttpSession session, Model model, String page, String mem_id) throws Exception {

		List<CouponsVO> couponList = new ArrayList<CouponsVO>();

		CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");
		String memId = cs.getMem_id();

		Integer countNum = couponsService.getCountAdminCoupons(memId);
		PagingVO pTmp = new PagingVO(countNum,Integer.parseInt(page));

		couponList = couponsService.getAdminCoupons(memId, pTmp);


		model.addAttribute("couponList", couponList);
		if(!pTmp.pageCheck()){
			model.addAttribute("pageError", "Page Number is not valid");
		}else{
			model.addAttribute("page", pTmp);
		}

		return "admin/nofragment/coupons/couponList";
	}
}

package com.group6.shopping.coupons.controllers;

import com.group6.shopping.coupons.services.CouponsService;
import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.security.CustomMemDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/members")
public class CouponsController {
	
	@Autowired
	private CouponsService couponsService;
	
	@RequestMapping(value = "/coupons")
	public String couponList(HttpSession session, Model model) throws Exception {
		
		List<CouponsVO> couponList = new ArrayList<CouponsVO>();
		CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");
		
		couponList = couponsService.getAllCoupons(cs.getMem_id());

		int count = couponsService.countCoupon(cs.getMem_id());
		//System.out.println(couponList);
		
		model.addAttribute("couponList", couponList);

		model.addAttribute("couponEA", count);

		return "members/mypage/nofragment/couponList";
	}
}

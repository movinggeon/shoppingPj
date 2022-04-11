package com.group6.shopping.members.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.receipts.service.ReceiptsService;
import com.group6.shopping.receipts.vo.ReceiptsDisplayVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.shopping.coupons.services.CouponsService;
import com.group6.shopping.security.CustomMemDetails;
import com.group6.shopping.security.LogoutHandler;

@Controller
@RequestMapping("/members")
public class MembersController {
	
	@Autowired
	private CouponsService couponsService;
	@Autowired
	private ReceiptsService receiptsService;

	@GetMapping(value = "/")
	public String accessMember(Model model) throws Exception {
		return "members/index";
	}


	@GetMapping(value = "/accessDenied")
	public void accessDenied() {

	}

	@RequestMapping(value="/member/mypage")
	public String mypage(HttpSession session, Model model) throws Exception {

		CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");

		List<ReceiptsDisplayVO> receiptsDisplayVOList = receiptsService.getAllReceiptsInfo(cs.getMem_id());

		for(ReceiptsDisplayVO tmp : receiptsDisplayVOList){
			System.out.println(tmp.getReceiptsVO().toString());
			for(CartsVO cTmp : tmp.getCartsVOList()){
				System.out.println(cTmp.toString());
				System.out.println(cTmp.getSpecVO().toString());
				System.out.println(cTmp.getProductsVO().getProduct_name() + cTmp.getModelsVO().getModel_name());
			}
			System.out.println("--------------------");
		}
		
		int count = couponsService.countCoupon(cs.getMem_id());
		

		model.addAttribute("couponEA", count);
		
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

}

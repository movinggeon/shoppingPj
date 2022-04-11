package com.group6.shopping.receipts.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.receipts.services.ReceiptsService;
import com.group6.shopping.receipts.vo.ReceiptsDisplayVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;
import com.group6.shopping.security.CustomMemDetails;

@Controller
@RequestMapping("/receipts")
public class ReceiptsController {

	@Autowired
	ReceiptsService receiptsService;
	
	@RequestMapping(value = "/member/receiptList")
	public String receiptList(Model model, HttpSession session) throws Exception {

		CustomMemDetails user = (CustomMemDetails)  session.getAttribute("user");
		List<ReceiptsVO> receiptList = new ArrayList<ReceiptsVO>();
		List<List<CartsVO>> cartList = new ArrayList<List<CartsVO>>();
		
        
		List<ReceiptsDisplayVO> receiptDisPlayList = new ArrayList<ReceiptsDisplayVO>();
        receiptDisPlayList = receiptsService.getAllReceiptsInfo(user.getMem_id());
        
        //상세정보 넣기
        for(int i = 0; i < receiptDisPlayList.size(); i++) {
        	
        	receiptList.add(receiptDisPlayList.get(i).getReceiptsVO());
        	cartList.add(receiptDisPlayList.get(i).getCartsVOList());

        }
        
        model.addAttribute("receiptList", receiptList);
        model.addAttribute("cartList", cartList);
        
        //model.addAttribute("cartList", cartList.get(0).get(0).getCart_isCare());
        //model.addAttribute("cartList", cartList.get(0).get(0).getCart_isCare());
//        System.out.println("스팩 값");
//        System.out.println(receiptList.size());
//        for(int i = 0; i < 4; i++) {
//        	System.out.println("카트 사이즈 -> " + cartList.get(i).size());
//        }
       // System.out.println(cartList.get(0).get(0).getCart_refund());
        //System.out.println(receiptList.get(0));
//        
//        for(int i = 0; i < cartList.size(); i++) {
//        	System.out.println(cartList.get(i).get(0).getCart_refund());
//        }

		return "/members/mypage/nofragment/receiptList";
	}
}

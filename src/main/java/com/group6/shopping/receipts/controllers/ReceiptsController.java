package com.group6.shopping.receipts.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.group6.shopping.boards.vo.PagingVO;
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
	public String receiptList(Model model, HttpSession session, String page) throws Exception {

		CustomMemDetails user = (CustomMemDetails)  session.getAttribute("user");
		List<ReceiptsVO> receiptList = new ArrayList<ReceiptsVO>();
		List<List<CartsVO>> cartList = new ArrayList<List<CartsVO>>();

		Integer cntBuy = receiptsService.getCntReceipts(user.getMem_id());
		PagingVO pTmp =  new PagingVO(cntBuy, Integer.parseInt(page));

		List<ReceiptsDisplayVO> receiptDisPlayList = new ArrayList<ReceiptsDisplayVO>();
        receiptDisPlayList = receiptsService.getAllReceiptsInfo(user.getMem_id(), pTmp);
        
        //상세정보 넣기
        for(int i = 0; i < receiptDisPlayList.size(); i++) {
        	
        	receiptList.add(receiptDisPlayList.get(i).getReceiptsVO());
        	cartList.add(receiptDisPlayList.get(i).getCartsVOList());

        }

		if(!pTmp.pageCheck()){
			model.addAttribute("pageError", "Page Number is not valid");
		}else{
			model.addAttribute("page", pTmp);
		}
        model.addAttribute("receiptList", receiptList);
        model.addAttribute("cartList", cartList);

		return "/members/mypage/nofragment/receiptList";
	}
}

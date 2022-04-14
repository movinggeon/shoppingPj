package com.group6.shopping.members.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.receipts.services.ReceiptsService;
import com.group6.shopping.receipts.vo.ReceiptsDisplayVO;
import com.group6.shopping.coupons.services.CouponsService;
import com.group6.shopping.likes.services.LikesService;
import com.group6.shopping.likes.vo.LikesVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;
import com.group6.shopping.security.CustomMemDetails;
import com.group6.shopping.security.LogoutHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/members")
public class MembersController {
	
	@Autowired
	private CouponsService couponsService;

	@Autowired
	private LikesService likesService;

	@Autowired
	ReceiptsService receiptsService;

	@GetMapping(value = "/")
	public String accessMember(Model model) throws Exception {
		return "members/index";
	}


	@GetMapping(value = "/accessDenied")
	public void accessDenied() {

	}

	@RequestMapping(value="/member/mypage")
	public String mypage(HttpSession session, Model model) throws Exception {
		
		/*System.out.println("mypage로 이동");*/
		
		CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");

		Integer count = couponsService.countCoupon(cs.getMem_id());
		System.out.println("쿠폰 갯수 : " + count);

		List<LikesVO> likesVOList = likesService.LikeList(cs.getMem_id());
		List<LikesVO> tmpListList = new ArrayList<>();
		for(int i = 0; i < likesVOList.size(); i++){
			if(i == 3){
				break;
			}
			tmpListList.add(likesVOList.get(i));
		}

		model.addAttribute("likeList",tmpListList);


		model.addAttribute("couponEA", count);
		/*System.out.println(count);*/



		CustomMemDetails user = (CustomMemDetails)  session.getAttribute("user");
		List<ReceiptsVO> receiptList = new ArrayList<ReceiptsVO>();
		List<List<CartsVO>> cartList = new ArrayList<List<CartsVO>>();

		Integer cntBuy = receiptsService.getCntReceipts(user.getMem_id());
		PagingVO pTmp =  new PagingVO(cntBuy, Integer.parseInt("1"));

		List<ReceiptsDisplayVO> receiptDisPlayList = new ArrayList<ReceiptsDisplayVO>();
		receiptDisPlayList = receiptsService.getAllReceiptsInfo(user.getMem_id(), pTmp);

		//상세정보 넣기
		for(int i = 0; i < receiptDisPlayList.size(); i++) {
			if(i == 2){
				break;
			}
			receiptList.add(receiptDisPlayList.get(i).getReceiptsVO());
			cartList.add(receiptDisPlayList.get(i).getCartsVOList());

		}

		if(receiptList.size() > 0){
			model.addAttribute("receiptList", receiptList);
			model.addAttribute("cartList", cartList);
		}


		return "members/mypage/mypage";
	}



	@RequestMapping(value = "/member/modify")
	public String modify(HttpServletRequest request) {
		/*System.out.println("modify 호출");*/
		return "members/mypage/nofragment/modify";
	}
	@RequestMapping(value ="/member/delete")
	public String delete(HttpServletRequest requet){
		/*System.out.println("회원탈퇴 이동");*/
		return "members/mypage/nofragment/delete";
	}

	@RequestMapping(value = "/member/modifyPassword")
	public String modifyPassword(HttpServletRequest request){
		/*System.out.println("비밀번호 변경 이동");*/
		return "members/mypage/nofragment/modifyPassword";
	}
	
	@RequestMapping(value = "/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		LogoutHandler logoutHandler = new LogoutHandler();
		logoutHandler.onLogoutSuccess(request, response, auth);
	}

}

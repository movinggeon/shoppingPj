package com.group6.shopping.carts.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.group6.shopping.api.CancelPayment;
import com.group6.shopping.carts.services.CartsService;
import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.receipts.services.ReceiptsService;
import com.group6.shopping.security.CustomMemDetails;

@RestController
@RequestMapping("/carts")
public class CartsRestController {

    @Autowired
    CartsService cartsService;

    @Autowired
    ReceiptsService receiptsService;

    @RequestMapping("/member/addCart")
    public String addCart(@RequestBody HashMap<String, Object> map, HttpSession session) throws Exception {
        //db work add spec_id to cart


        for(Map.Entry<String, Object> tmp : map.entrySet()){
            System.out.println(tmp.getKey() + " : " + tmp.getValue());
        }

        CustomMemDetails user =  (CustomMemDetails) session.getAttribute("user");
        map.put("mem_id", user.getMem_id());

        String isCareStr = (String) map.get("cart_isCare");
        int spec_isCare = Integer.parseInt(isCareStr);
        int spec_price = (int) map.get("spec_price");

       if(spec_isCare == -1){
           spec_price+=10;
           map.replace("spec_price", spec_price);
       }

       cartsService.insertCart(map);

        return "success";
    }

    @RequestMapping("/member/deleteCart")
    public HashMap<String, Object> deleteCart(CartsVO cartsVO, HttpSession session) throws Exception {
        CustomMemDetails user = (CustomMemDetails)  session.getAttribute("user");
        cartsService.deleteCart(cartsVO);
        int total = cartsService.getTotal(user.getMem_id(), "null");
        
        //json 으로 변경후 map으로 토탈 값 전송
        HashMap<String, Object> result = new HashMap<>();
        result.put("total", total);

        return result;
    }

    @RequestMapping("/member/updateQty")
    public HashMap<String, Object> updateQty(CartsVO cartsVO, HttpSession session) throws Exception{
    	
        CustomMemDetails user = (CustomMemDetails)  session.getAttribute("user");
        cartsService.updateQty(cartsVO);
        CartsVO tmp = cartsService.getSingleCart(cartsVO);

        int total = cartsService.getTotal(user.getMem_id(), "null");
        int itemPrice = tmp.getCart_price() * tmp.getCart_qty();

        //json 으로 변경후 map으로 토탈 값 전송
        HashMap<String, Object> result = new HashMap<>();
        result.put("total", total);
        result.put("itemPrice", itemPrice);

        return result;
    }
    
    @RequestMapping("/member/payment")
    public HashMap<String, Object> payment(@RequestBody HashMap<String, Object> param) throws Exception{

    	HashMap<String, Object> result = new HashMap<String, Object>();
    	HashMap<String, Object> queryMap = new HashMap<String, Object>();
    	
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    	
    	String receipt_imp_uid = (String)param.get("imp_uid");
    	String receipt_merchant_uid = (String)param.get("merchant_uid");
    	int receipt_price = Integer.parseInt(  String.valueOf(param.get("totalPrice")) );
    	int receipt_discount = Integer.parseInt( String.valueOf(param.get("buyer_discount")) );
    	String receipt_date = df.format(cal.getTime());; //RestController 에서 관리
    	String receipt_address = (String) param.get("buyer_addr");
    	String receipt_phone = (String) param.get("buyer_tel");
    	String mem_id = (String) param.get("buyer_id");
    	int coupon_id;
    	int receipt_point;
    	
    	queryMap.put("receipt_imp_uid", receipt_imp_uid);
    	queryMap.put("receipt_merchant_uid", receipt_merchant_uid);
    	queryMap.put("receipt_price", receipt_price);
    	queryMap.put("receipt_discount", receipt_discount);
    	queryMap.put("receipt_date", receipt_date);
    	queryMap.put("receipt_address", receipt_address);
    	queryMap.put("receipt_phone", receipt_phone);
    	queryMap.put("mem_id", mem_id);
    	
    	if(param.get("coupon_id") != null) {
    		coupon_id = Integer.parseInt( String.valueOf(param.get("coupon_id")) );
    		queryMap.put("coupon_id", coupon_id);
    	}else {
    		queryMap.put("coupon_id", null);
    	}
    	
    	
    	if( param.get("buyer_point") != null) {
    		receipt_point = Integer.parseInt( String.valueOf(param.get("buyer_point")) );
    		queryMap.put("receipt_point", receipt_point);
    	}else {
    		queryMap.put("receipt_point", null);
    	}
    	
    	//영수증 테이블에 삽입
    	receiptsService.insertReceipts(queryMap);

    	System.out.println("영수증 아이디 -> " + queryMap.get("receipt_id"));
    	//카트 테이블에 영수증 아이디 갱신
    	cartsService.updateRecId(queryMap);
    	
    	return result;
    }
    
    @PostMapping(value = "/member/payment/cancel")
	public HashMap<String, Object> cancelProcess(@RequestBody HashMap<String, Object>map) throws Exception{
    	
		System.out.println("결제 취소 시작");
		System.out.println(map);
		
		CancelPayment cancelPayment = new CancelPayment(); // 결제취소
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(map.size() > 0) {
			
			int receipt_id = Integer.parseInt(  String.valueOf(map.get("receipt_id")) );
			String reason = (String)map.get("reason");
			String imp_uid = (String)map.get("imp_uid");
			int cancel_request_amount = Integer.parseInt(  String.valueOf(map.get("cancel_request_amount")));
			
			cancelPayment.doCanelPayment( reason, imp_uid, cancel_request_amount ); 
			
			//db에서 내역수정
			cartsService.updateRefund(receipt_id);
			
			result.put("result", "결제 취소 완료");
			result.put("everythings_fine", true);
		}
		
		return result;
	}
}

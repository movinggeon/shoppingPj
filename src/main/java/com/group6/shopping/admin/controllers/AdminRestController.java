package com.group6.shopping.admin.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.group6.shopping.coupons.services.CouponsService;
import com.group6.shopping.members.service.MembersService;

@RestController
public class AdminRestController {
	
    @Autowired
    private MembersService membersService;
    
    @Autowired
    private CouponsService couponsService;
    
    @PostMapping(value = "/admin/delete/deleteMem")
    public HashMap<String, String> DeleteMem(@RequestBody HashMap<String, Object> param) throws Exception {
    	
        HashMap<String, String> result = new HashMap<String, String >();

        String memId = (String) param.get("mem_id"); 
        membersService.deleteMem(memId);
        
        result.put("success", "계정삭제 완료");
        
        return result;
    }
    
    @PostMapping(value = "/admin/block/blockMem")
    public HashMap<String, Object> blockMem(@RequestBody HashMap<String, Object> param) throws Exception{
    	
    	HashMap<String, Object> result = new HashMap<String, Object>();
    	
    	String memId = (String) param.get("mem_id");
    	
    	membersService.updateEnableMem(0, memId);
    	
    	result.put("success", "차단완료");
    	
    	return result;
    }
    
    @PostMapping(value = "/admin/block/unblockMem")
    public HashMap<String, Object> unblockMem(@RequestBody HashMap<String, Object> param) throws Exception{
    	
    	HashMap<String, Object> result = new HashMap<String, Object>();
    	
    	String memId = (String) param.get("mem_id");
    	
    	membersService.updateEnableMem(1, memId);
    	
    	result.put("success", "차단해제완료");
    	
    	return result;
    }
    
    @PostMapping(value = "/admin/coupons/createCoupon")
    public HashMap<String, Object> createCoupon(@RequestBody HashMap<String, Object> param) throws Exception{
    	
    	List<String> adminList = membersService.searchAdmin();
    	HashMap<String, Object> result = new HashMap<String, Object>();
    	
    	String coupon_desc = (String) param.get("coupon_desc");
    	int coupon_pct = Integer.parseInt((String)param.get("coupon_pct"));
    	int coupon_price = Integer.parseInt((String)param.get("coupon_price"));
    	String coupon_valid_date = (String) param.get("coupon_valid_date");
    	
    	if(adminList.size() > 0) {
    		for(int i = 0; i < adminList.size(); i++) {
    			
    			HashMap<String, Object> queryMap = new HashMap<String, Object>();
    			
    			queryMap.put("mem_id", adminList.get(i));
    			queryMap.put("coupon_desc", coupon_desc);
    			queryMap.put("coupon_pct", coupon_pct);
    			queryMap.put("coupon_price", coupon_price);
    			queryMap.put("coupon_valid_date", coupon_valid_date);
    			
    			couponsService.createCoupon(queryMap);
    			
    			result.put("success", "쿠폰생성완료");
    		}
    	}else {
    		result.put("error", "관리자 계정이 없음");
    	}
    	return result;
    }
    
    
    @PostMapping(value = "/admin/coupons/deleteCoupon")
    public HashMap<String, Object> deleteCoupon(@RequestBody HashMap<String, Object> param) throws Exception{
    	
    	HashMap<String, Object> result = new HashMap<String, Object>();
    	
    	String couponDesc = (String) param.get("coupon_id");
    	
    	couponsService.deleteCoupon(couponDesc);
    	
    	result.put("success", "쿠폰삭제완료");
    	
    	return result;
    }
    
    @PostMapping(value = "/admin/coupons/giveCoupon")
    public HashMap<String, Object> giveCoupon(@RequestBody HashMap<String, Object> param) throws Exception{
    	
    	HashMap<String, Object> result = new HashMap<String, Object>();
    	HashMap<String, Object> queryMap = new HashMap<String, Object>();
    	
    	String memId = (String) param.get("mem_id");
    	String coupon_desc = (String) param.get("coupon_desc");
    	int coupon_pct = Integer.parseInt((String)param.get("coupon_pct"));
    	int coupon_price = Integer.parseInt((String)param.get("coupon_price"));
    	String coupon_valid_date = (String) param.get("coupon_valid_date");
    	
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        cal.add(Calendar.MONTH, Integer.parseInt(coupon_valid_date));
        coupon_valid_date = df.format(cal.getTime());
        
        queryMap.put("mem_id", memId);
        queryMap.put("coupon_desc", coupon_desc);
        queryMap.put("coupon_pct", coupon_pct);
        queryMap.put("coupon_price", coupon_price);
        queryMap.put("coupon_valid_date", coupon_valid_date);
        couponsService.insertCoupon(queryMap);
        
        result.put("success", "쿠폰지급 완료");
        
    	return result;
    }
}

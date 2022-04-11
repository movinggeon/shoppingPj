package com.group6.shopping.join.controllers;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.group6.shopping.coupons.services.CouponsService;
import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;

@RestController
public class JoinRestController {

    @Autowired
    private MembersService membersService;
    
    @Autowired
    private CouponsService couponsService;

    @PostMapping(value = "/join/idLookup")
    public HashMap<String, Object> idLookup(@RequestBody HashMap<String, Object> param) throws Exception {

        HashMap<String, Object> result = new HashMap<String, Object>();
        String memId = (String) param.get("memId");
        String lookupResult = membersService.lookupId(memId);

      /*  System.out.println(memId.isEmpty());
        System.out.println(memId.length());*/

        if (memId.isEmpty()) {

            result.put("error", "아이디를 입력해주세요.");
        } else if (lookupResult == null) {

            result.put("success", "사용 가능한 아이디 입니다.");
            result.put("memId", memId);

        } else {

            result.put("error", "중복된 아이디 입니다.");
        }
        return result;
    }

    @PostMapping(value = "/join/joinProcess")
    public HashMap<String, Object> joinProcess(@RequestBody HashMap<String, Object> param) throws Exception {
    	
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        cal.add(Calendar.MONTH, 1);
        
        String coupon_valid_date = df.format(cal.getTime());
        String coupon_desc = "신규가입 쿠폰";

        HashMap<String, Object> result = new HashMap<String, Object>();
        HashMap<String, Object> queryMap = new HashMap<String, Object>();

        String memName = (String) param.get("memName");
        String memId = (String) param.get("memId");
        String memPassword = (String) param.get("memPassword");
        String memEmail = (String) param.get("memEmail");
        String memPhone = (String) param.get("memPhone");
        String memBirth = (String) param.get("memBirth");
        String memPostCode = (String) param.get("memPostCode");
        String memAddress = (String) param.get("memAddress");
        String memAuth = "ROLE_MEMBER";
        int memPoint = 0;

        memPhone = memPhone.trim();
        memPhone = memPhone.substring(0, 3) + "-" + memPhone.substring(3, 7) + "-" + memPhone.substring(7, 11);

        MembersVO membersVO = new MembersVO(memName, memId, memPassword, memEmail, memPhone, memBirth, memPostCode, memAddress, memPoint, memAuth, 1);
        membersService.insertMem(membersVO);
        
        queryMap.put("mem_id", memId);
        queryMap.put("coupon_desc", coupon_desc);
        queryMap.put("coupon_pct", 30);
        queryMap.put("coupon_price", 0);
        queryMap.put("coupon_valid_date", coupon_valid_date);
        couponsService.insertCoupon(queryMap);

        result.put("success", "회원가입이 완료되었습니다.");

        return result;
    }

    @PostMapping(value = "/join/kakaoProcess")
    public HashMap<String, Object> kakaoProcess(@RequestBody HashMap<String, Object> param) throws Exception {

        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        cal1.add(Calendar.MONTH, 1);

        String coupon_valid_date = df.format(cal1.getTime());
        String coupon_desc = "신규가입 쿠폰";

        HashMap<String, Object> result = new HashMap<String, Object>();
        HashMap<String, Object> queryMap = new HashMap<String, Object>();

        String memName = (String) param.get("memName");
        String memId = (String) param.get("memId");
        String memEmail = (String) param.get("memEmail");

       /* System.out.println("카카오컨트롤러호출");
        System.out.println(memName);
        System.out.println(memId);
        System.out.println(memEmail);*/

        String memPassword = "kakao";
        String memPhone = "";
        String memBirth = "";
        String memPostCode = "";
        String memAddress = "";
        String memAuth = "ROLE_MEMBER";
        int memPoint = 0;


        MembersVO membersVO = new MembersVO(memName, memId, memPassword, memEmail, memPhone, memBirth, memPostCode, memAddress, memPoint, memAuth, 1);
        queryMap.put("mem_id", memId);
        queryMap.put("coupon_desc", coupon_desc);
        queryMap.put("coupon_pct", 30);
        queryMap.put("coupon_price", 0);
        queryMap.put("coupon_valid_date", coupon_valid_date);
        membersService.insertMem(membersVO);
        couponsService.insertCoupon(queryMap);

        return result;
    }
    @PostMapping(value = "/join/kakaoidLookup")
    public HashMap<String, Object> kakaoidLookup(@RequestBody HashMap<String, Object> param) throws Exception {

        HashMap<String, Object> result = new HashMap<String, Object>();
        String memId = (String) param.get("memId");
        String lookupResult = membersService.lookupId(memId);

     /*   System.out.println("카카오 아이디 중복 체크");
        System.out.println(memId);*/

        if (memId.isEmpty()) {
            result.put("error", "아이디를 입력해주세요.");
        } else if (lookupResult == null) {
            result.put("kakaoid", memId);
            result.put("success", true);
        } else {
            result.put("idExists", true);
            result.put("kakaoid",memId);
        }
        return result;
    }

}

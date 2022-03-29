package com.group6.shopping.coupons.controllers;

import com.group6.shopping.batis.CouponsDAO;
import com.group6.shopping.coupons.services.CouponsService;
import com.group6.shopping.coupons.vo.CouponsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/coupons")
public class CouponsRestController {

    @Autowired
    CouponsService couponsService;

    @RequestMapping("/member/getCoupon")
    public String getCoupon(CouponsVO couponsVO, String totalPrice) throws Exception {
        System.out.println("여기");
        CouponsVO tmp = couponsService.getCoupon(couponsVO);

        System.out.println(tmp.getCoupon_pct());
        System.out.println(tmp.getCoupon_price());

        double priceInt = Double.parseDouble(totalPrice);
        System.out.println(priceInt);

        if(tmp.getCoupon_pct() == 0){
            priceInt -= tmp.getCoupon_price();
            System.out.println(priceInt);
        }else{
            double pct = (100 - tmp.getCoupon_pct()) / 100;
            priceInt *= pct;
        }
        String tmpResult = priceInt + "";
        int decimal = tmpResult.indexOf(".");
        String result = tmpResult.substring(0, decimal);

        return result;
    }
}

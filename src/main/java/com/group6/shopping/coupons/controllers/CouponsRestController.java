package com.group6.shopping.coupons.controllers;

import com.group6.shopping.batis.CouponsDAO;
import com.group6.shopping.carts.services.CartsService;
import com.group6.shopping.coupons.services.CouponsService;
import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.security.CustomMemDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/coupons")
public class CouponsRestController {

    @Autowired
    CouponsService couponsService;
    @Autowired
    CartsService cartsService;

    @RequestMapping("/member/getCoupon")
    public Map<String, Object> getCoupon(HttpSession session, CouponsVO couponsVO) throws Exception {
        CustomMemDetails user = (CustomMemDetails) session.getAttribute("user");
        String totalPrice = cartsService.getTotal(user.getMem_id(), "null") + "";

/*      System.out.println("coupon Id: " + couponsVO.getCoupon_id());
        System.out.println("총가격: " + totalPrice);*/
        CouponsVO tmp = couponsService.getCoupon(couponsVO);

        double priceInt = Double.parseDouble(totalPrice);
        Map<String, Object> result = new HashMap<>();

        if(tmp.getCoupon_pct() == 0){
            if(priceInt < tmp.getCoupon_price()){
                result.put("fail", "쿠폰 가격이 상품 가격보다 높습니다.");
                result.put("success", totalPrice);
                return result;
            }
            priceInt -= tmp.getCoupon_price();
        }else{
            double pct = (100 - tmp.getCoupon_pct()) / 100.0;
            priceInt *= pct;
        }
        String tmpResult = priceInt + "";
        int decimal = tmpResult.indexOf(".");
        result.put("fail", "");
        result.put("success", tmpResult.substring(0, decimal));

        return result;
    }
}

package com.group6.shopping.carts.controllers;

import com.group6.shopping.carts.services.CartsService;
import com.group6.shopping.security.CustomMemDetails;
import com.group6.shopping.specifications.vo.SpecVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/carts")
public class CartsRestController {

    @Autowired
    CartsService cartsService;


    @RequestMapping("/member/addCart")
    public String addCart(@RequestBody HashMap<String, Object> map, HttpSession session) throws Exception {
        //db work add spec_id to cart

        CustomMemDetails user =  (CustomMemDetails) session.getAttribute("user");
        map.put("mem_id", user.getMem_id());

        String isCareStr = (String) map.get("cart_isCare");
        int spec_isCare = Integer.parseInt(isCareStr);
        int spec_price = (int) map.get("spec_price");

       if(spec_isCare == 1){
           spec_price+=10;
           map.replace("spec_price", spec_price);
       }

       cartsService.insertCart(map);

        return "success";
    }
}

package com.group6.shopping.carts.controllers;

import com.group6.shopping.carts.services.CartsService;
import com.group6.shopping.models.services.ModelsService;
import com.group6.shopping.specifications.vo.SpecVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/carts")
public class CartsController {

    @Autowired
    private CartsService cartsService;

    @RequestMapping("/member/Cart")
    public String addCart(ModelsService model){
        //select * from carts and spec where mem_id = mem_id and uuid = null

        return "/carts/cart";
    }
}

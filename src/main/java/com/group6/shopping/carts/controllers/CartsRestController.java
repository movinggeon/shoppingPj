package com.group6.shopping.carts.controllers;

import com.group6.shopping.specifications.vo.SpecVO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/carts")
public class CartsRestController {

    @RequestMapping("/member/addCart")
    public String addCart(SpecVO specVO){
        System.out.println(specVO.getSpec_id());
        return "success";
    }
}

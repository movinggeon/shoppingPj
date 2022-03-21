package com.group6.shopping.carts.controllers;

import com.group6.shopping.carts.services.CartsService;
import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.models.services.ModelsService;
import com.group6.shopping.security.CustomMemDetails;
import com.group6.shopping.specifications.vo.SpecVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/carts")
public class CartsController {

    @Autowired
    private CartsService cartsService;

    @RequestMapping("/member/cart")
    public String addCart(Model models, HttpSession session) throws Exception {
        CustomMemDetails user = (CustomMemDetails) session.getAttribute("user");
        //select * from carts and spec where mem_id = mem_id and uuid = null
        List<CartsVO> cartsVOList = cartsService.getCart(user.getMem_id());

        models.addAttribute("carts", cartsVOList);
        return "/carts/cart";
    }
}

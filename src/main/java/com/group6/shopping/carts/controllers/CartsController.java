package com.group6.shopping.carts.controllers;

import com.group6.shopping.carts.services.CartsService;
import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.coupons.services.CouponsService;
import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.models.services.ModelsService;
import com.group6.shopping.security.CustomMemDetails;
import com.group6.shopping.specifications.vo.SpecVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/carts")
public class CartsController {

    @Autowired
    private CartsService cartsService;

    @Autowired
    private CouponsService couponsService;

    @RequestMapping("/member/cart")
    public String addCart(Model models, HttpSession session) throws Exception {
        CustomMemDetails user = (CustomMemDetails) session.getAttribute("user");
        List<CartsVO> cartsVOList = cartsService.getCart(user.getMem_id(), "null");

        Iterator<CartsVO> iter = cartsVOList.iterator();
        int totalPrice = 0;

        while(iter.hasNext()){
            CartsVO tmp = iter.next();
            if(tmp.getSpecVO().getSpec_qty() == 0){
                cartsService.deleteCart(tmp);
                iter.remove();
                models.addAttribute("qtyZero"," 수량이 부족하여 장바구니에서 삭제되었습니다..");
            }else if(tmp.getCart_qty() > tmp.getSpecVO().getSpec_qty()){
                tmp.setCart_qty(1);
                cartsService.updateQty(tmp);
                models.addAttribute("qtyError"," 수량이 부족하여 갯수가 1개로 재설정 되었습니다.");
                totalPrice += (tmp.getCart_price() * tmp.getCart_qty());
            }else{
                totalPrice += (tmp.getCart_price() * tmp.getCart_qty());
            }
        }

        models.addAttribute("carts", cartsVOList);
        models.addAttribute("totalPrice", totalPrice);
        return "/carts/cart";
    }

    @RequestMapping("/member/mailinginformation")
    public String mailingInformation(Model models, HttpSession session) throws Exception {
        CustomMemDetails user = (CustomMemDetails)  session.getAttribute("user");

        List<CouponsVO> couponsVOList = couponsService.getAllCoupons(user.getMem_id());
        int totalPrice = cartsService.getTotal(user.getMem_id(), "null");
        user.getClass().getName();
        models.addAttribute("coupons", couponsVOList);
        models.addAttribute("totalPrice", totalPrice);

        return "/carts/mailing";
    }
}

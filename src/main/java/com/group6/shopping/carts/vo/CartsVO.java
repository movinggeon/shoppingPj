package com.group6.shopping.carts.vo;


import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.products.vo.ProductsVO;
import com.group6.shopping.specifications.vo.SpecVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//필드 추가후 noargs 주석 해제 모든 vo 동일
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CartsVO {
    private int cart_id, spec_id, cart_price, cart_qty, cart_refund, cart_isCare;
    private String mem_id, cart_imp_uid, cart_merchant_uid, cart_date, cart_repair_date, cart_r_est_date, cart_address, cart_phone;

    private SpecVO specVO;
    private ModelsVO modelsVO;
    private ProductsVO productsVO;

}

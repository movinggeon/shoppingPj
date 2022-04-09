package com.group6.shopping.carts.vo;


import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.products.vo.ProductsVO;
import com.group6.shopping.specifications.vo.SpecVO;
import lombok.*;

//필드 추가후 noargs 주석 해제 모든 vo 동일
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CartsVO {
    private int cart_id, spec_id, receipt_id, cart_price, cart_qty, cart_isCare;
    private String mem_id;

    private SpecVO specVO;
    private ModelsVO modelsVO;
    private ProductsVO productsVO;

}

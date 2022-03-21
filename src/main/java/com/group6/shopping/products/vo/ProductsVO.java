package com.group6.shopping.products.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//필드 추가 후 noargs 주석 제거 이하 모든 vo 동일
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductsVO {
    private int product_id;
    private String product_name;
}

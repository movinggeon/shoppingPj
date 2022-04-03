package com.group6.shopping.models.vo;

import com.group6.shopping.products.vo.ProductsVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Comparator;

//필드 추가 후 noargs 주석 제거 이하 모든 vo 동일
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsVO {
    private int model_id, product_id;
    private String model_name;

    private ProductsVO productsVO;
}
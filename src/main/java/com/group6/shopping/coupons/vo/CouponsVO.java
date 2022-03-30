package com.group6.shopping.coupons.vo;

import lombok.*;

//필드 생성 후 noargs 주석 제거 이하 모든 vo 동일
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CouponsVO {
    private int coupon_id;
    private String mem_id;
    private String coupon_desc;
    private int coupon_pct;
    private int coupon_price;
    private String coupon_valid_date;
    
}

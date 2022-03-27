package com.group6.shopping.coupons.vo;

import lombok.*;

//필드 생성 후 noargs 주석 제거 이하 모든 vo 동일
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor@ToString
public class CouponsVO {
    private int coupon_id, coupon_pct, coupon_price;
    private String mem_id, coupon_desc, coupon_valid_date;
}

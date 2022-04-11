package com.group6.shopping.specifications.vo;

import lombok.*;
import org.springframework.stereotype.Service;

//필드 추가 후 noargs 주석 제거 이하 모든 vo 동일
@Getter@Setter
@Service
@AllArgsConstructor
@NoArgsConstructor@ToString
public class SpecVO{
    private int spec_id, model_id, spec_weight, spec_price, spec_qty;
    private String spec_processor, spec_memory, spec_display, spec_network, spec_color;
}

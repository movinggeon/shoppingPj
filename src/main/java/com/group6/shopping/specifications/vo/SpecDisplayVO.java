package com.group6.shopping.specifications.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter@NoArgsConstructor@AllArgsConstructor
public class SpecDisplayVO {
    private int product_id, model_id;
    private String product_name, model_name;
    private List<?> spec_processor, spec_memory, spec_display, spec_network, spec_color, spec_weight, spec_price;
}

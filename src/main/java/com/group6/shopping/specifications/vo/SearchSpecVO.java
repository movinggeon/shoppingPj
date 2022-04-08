package com.group6.shopping.specifications.vo;

import lombok.*;

import java.util.List;

@Getter@Setter@NoArgsConstructor@AllArgsConstructor@ToString
public class SearchSpecVO {
    private List<String> product_name, model_name, spec_processor, spec_memory, spec_display, spec_network, spec_color;
}

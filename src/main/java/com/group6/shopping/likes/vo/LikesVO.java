package com.group6.shopping.likes.vo;


import lombok.*;

//필드 생성후 noargs 주석 제거
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LikesVO {
    private int like_id;
    private int spec_id;
    private String mem_id;
}

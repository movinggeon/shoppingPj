package com.group6.shopping.members.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MembersVO {
    
    private String mem_name;
    private String mem_id;
    private String mem_password;
    private String mem_email;
    private String mem_phone;
    private String mem_birth;
    private String mem_post_code;
    private String mem_address;
    private int mem_point;
    private String mem_auth;
    private int mem_enable;

}

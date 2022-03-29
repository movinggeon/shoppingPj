package com.group6.shopping.files.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//필드 추가 후 noargs 주석 제거 이하 모든 vo 동일
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FilesVO {
    private int file_id, board_id;
    private String file_name;
}

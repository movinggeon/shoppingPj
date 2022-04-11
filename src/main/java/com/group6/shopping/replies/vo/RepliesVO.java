package com.group6.shopping.replies.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//필드 추가 후 noargs 주석 제거 이하 모든 vo 동일
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RepliesVO {
    private int reply_id, board_id;
    private String mem_id, reply_content, reply_date;
}

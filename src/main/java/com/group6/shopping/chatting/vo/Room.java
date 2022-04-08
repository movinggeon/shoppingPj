package com.group6.shopping.chatting.vo;

import lombok.*;

import java.util.List;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Room {
    int roomNumber;
    String roomName;
    String userSessionId;

}

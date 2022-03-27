package com.group6.shopping.boards.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/boards")
public class BoardsController {

    @PostMapping("/somethingform")
    public String something(String something){
        System.out.println(something + "도착");
        return "home";
    }
}

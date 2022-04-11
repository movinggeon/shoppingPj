package com.group6.shopping.likes.controllers;

import com.group6.shopping.likes.services.LikesService;
import com.group6.shopping.likes.vo.LikesVO;
import com.group6.shopping.security.CustomMemDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/likes")

public class LikesController {
    @Autowired
    private LikesService likesService;

    @RequestMapping(value = "/members/likeslist")
    public String likeList(HttpSession session, Model model) throws Exception {
        CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");
        String memId = cs.getMem_id();
        List<LikesVO> likesVOList = likesService.LikeList(memId);
        model.addAttribute("likeList",likesVOList);
        return "members/mypage/nofragment/likeList";
    }
}
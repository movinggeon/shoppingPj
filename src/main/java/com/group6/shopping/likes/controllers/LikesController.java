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
/*@RequestMapping("/likes")*/
@RequestMapping("/members")
public class LikesController {
    @Autowired
    private LikesService likesService;

    @RequestMapping(value = "/likeslist")
    public String likeList(HttpSession session, Model model) throws Exception {
        List<LikesVO> likeList=new ArrayList<LikesVO>();
        CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");
        String memId = cs.getMem_id();
        System.out.println("접속한유저" + memId);
        likeList=likesService.getAlllikes(memId);
        model.addAttribute("likeList",likeList);
        return "members/mypage/likeList";
    }
}
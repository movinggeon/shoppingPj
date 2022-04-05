package com.group6.shopping.likes.controllers;

import com.group6.shopping.likes.services.LikesService;
import com.group6.shopping.likes.vo.LikesVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@RequestMapping("/likes")
public class LikesRestController {
    @Autowired
    private LikesService likesService;

    @RequestMapping("/member/likeinsert")
    public HashMap<String, Object> likeinsert(@RequestBody HashMap<String, Object> param) throws Exception {
        HashMap<String, Object> result = new HashMap<String, Object>();
        HashMap<String, Object> queryMap = new HashMap<String, Object>();

        //정보받아야함
        int spec_id = Integer.parseInt((String)param.get("spec_id"));
        String mem_id = (String) param.get("mem_Id");

        queryMap.put("mem_id",mem_id);
        queryMap.put("spec_id",spec_id);
        likesService.likeinsert(queryMap);

        result.put("success","좋아요추가");
        return result;

    }

    @RequestMapping("/member/likedelete")
    public HashMap<String, Object> deleteCoupon(@RequestBody HashMap<String, Object> param) throws Exception{
        HashMap<String, Object> result = new HashMap<String, Object>();
        int spec_id = Integer.parseInt((String)param.get("spec_id"));
        String mem_id = (String) param.get("mem_Id");
        likesService.likedelete(spec_id,mem_id);
        result.put("success","좋아요삭제");
        return result;
    }
}
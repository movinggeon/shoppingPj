package com.group6.shopping.likes.controllers;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.group6.shopping.likes.services.LikesService;
import com.group6.shopping.security.CustomMemDetails;

@RestController
@RequestMapping("/likes")
public class LikesRestController {
    @Autowired
    private LikesService likesService;

    @RequestMapping("/member/likeinsert")
    public HashMap<String, Object> likeinsert(@RequestBody HashMap<String, Object> param, HttpSession session) throws Exception {
        HashMap<String, Object> result = new HashMap<String, Object>();
        HashMap<String, Object> queryMap = new HashMap<String, Object>();
        
        CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");
        //정보받아야함
        String mem_id = (String)cs.getMem_id();
        int model_id = Integer.parseInt(String.valueOf(param.get("model_id")));

        queryMap.put("mem_id",mem_id);
        queryMap.put("model_id",model_id);
        likesService.likeinsert(queryMap);

        result.put("success","좋아요추가");
        return result;

    }
    
    @RequestMapping("/member/likedelete")
    public HashMap<String, Object> likedelete(@RequestBody HashMap<String, Object> param, HttpSession session) throws Exception {
    	HashMap<String, Object> result = new HashMap<String, Object>();
    	HashMap<String, Object> queryMap = new HashMap<String, Object>();
    	
    	CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");
    	//정보받아야함
    	String mem_id = (String)cs.getMem_id();
    	int model_id = Integer.parseInt(String.valueOf(param.get("model_id")));
    	
    	queryMap.put("mem_id",mem_id);
    	queryMap.put("model_id",model_id);
    	likesService.likedelete(queryMap);
    	
    	result.put("success","좋아요취소");
    	return result;
    	
    }

}
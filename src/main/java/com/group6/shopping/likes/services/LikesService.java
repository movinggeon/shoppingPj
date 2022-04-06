package com.group6.shopping.likes.services;

import com.group6.shopping.likes.vo.LikesVO;

import java.util.HashMap;
import java.util.List;

public interface LikesService {
    public List<LikesVO> getAlllikes(String memId) throws Exception;
    public void likeinsert(HashMap<String, Object> param) throws Exception;
    public void likedelete(int spec_id, String mem_id) throws Exception;
    public List<LikesVO> LikeList(String memId) throws Exception;
}

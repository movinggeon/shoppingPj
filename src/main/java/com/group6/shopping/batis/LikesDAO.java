package com.group6.shopping.batis;

import java.util.HashMap;
import java.util.List;

import com.group6.shopping.likes.vo.LikesVO;

public interface LikesDAO {
    public List<LikesVO> getAlllikes(String memId) throws Exception;
    public void likeinsert(HashMap<String, Object> param) throws Exception;
    public void likedelete(HashMap<String, Object>param) throws Exception;
    public List<LikesVO> LikeList(String memId) throws Exception;
    public List<LikesVO> mostLikedList() throws Exception;

}

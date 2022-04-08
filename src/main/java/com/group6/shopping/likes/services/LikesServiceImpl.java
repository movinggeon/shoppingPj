package com.group6.shopping.likes.services;

import com.group6.shopping.batis.LikesDAO;
import com.group6.shopping.likes.vo.LikesVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class LikesServiceImpl implements LikesService{

    @Autowired
    private LikesDAO likesDAO;

    @Override
    public List<LikesVO> getAlllikes(String memId) throws Exception{
        return likesDAO.getAlllikes(memId);
    }
    @Override
    public void likeinsert(HashMap<String, Object> param) throws Exception{
        likesDAO.likeinsert(param);
    }
    @Override
    public void likedelete(HashMap<String, Object>param) throws Exception {
        likesDAO.likedelete(param);
    }
    @Override
    public List<LikesVO> LikeList(String memId) throws Exception{
        return likesDAO.LikeList(memId);
    }

    @Override
    public List<LikesVO> mostLikedList() throws Exception {
        return likesDAO.mostLikedList();
    }
}

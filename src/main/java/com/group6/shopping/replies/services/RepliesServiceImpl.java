package com.group6.shopping.replies.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.RepliesDAO;
import com.group6.shopping.replies.vo.RepliesVO;

@Service
public class RepliesServiceImpl implements RepliesService {
	
	@Autowired
	private RepliesDAO repliesDAO;
	
	@Override
	public int updateReply(RepliesVO repliesVO) {
		return repliesDAO.updateReply(repliesVO);
	}
	@Override
	public int deleteReply(int reply_id){
		return repliesDAO.deleteReply(reply_id);
		
	}
	@Override
	public void insertReply(RepliesVO repliesVO) throws Exception {
		repliesDAO.insertReply(repliesVO);
	}
}

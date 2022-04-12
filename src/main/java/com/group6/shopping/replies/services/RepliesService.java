package com.group6.shopping.replies.services;

import com.group6.shopping.replies.vo.RepliesVO;

public interface RepliesService {
	
	public int updateReply(RepliesVO repliesVO);
	public int deleteReply(int reply_id);
	public void insertReply(RepliesVO repliesVO) throws Exception;
}

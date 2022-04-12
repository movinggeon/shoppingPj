package com.group6.shopping.replies.services;

import com.group6.shopping.replies.vo.RepliesVO;

public interface RepliesService {
	
	public int updateReply(RepliesVO repliesvo);
	public int deleteReply(int reply_id);
	public Integer cntRep() throws Exception;
}

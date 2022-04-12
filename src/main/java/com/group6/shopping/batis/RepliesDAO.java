package com.group6.shopping.batis;

import com.group6.shopping.replies.vo.RepliesVO;

public interface RepliesDAO {
	public int updateReply(RepliesVO repliesVO);
	public int deleteReply(int reply_id);
	public void insertReply(RepliesVO repliesVO) throws Exception;
	
}

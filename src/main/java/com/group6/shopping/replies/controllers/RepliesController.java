package com.group6.shopping.replies.controllers;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.shopping.replies.services.RepliesService;
import com.group6.shopping.replies.vo.RepliesVO;

@Controller
@RequestMapping("/replies")
public class RepliesController {
	@Autowired
	private RepliesService repliesService;

	// 이벤트 글 삭제
	@RequestMapping(value = "/deleteReply")
	public String deleteReply(@RequestBody HashMap<String, Object> map) {
		String strReplyId = (String) map.get("repid");
		int reply_id = Integer.parseInt(strReplyId);
		repliesService.deleteReply(reply_id);
		return "/boards/event";
	}

	// 이벤트 글 수정
	@RequestMapping(value = "/updateReply")
	public String updateReply(@RequestBody HashMap<String, Object> map, RepliesVO repliesVO) {

		repliesService.updateReply(repliesVO);
		return "";
	}
}

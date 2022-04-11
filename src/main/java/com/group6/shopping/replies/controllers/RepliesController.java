package com.group6.shopping.replies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.shopping.replies.services.RepliesService;

@Controller
@RequestMapping("/replies")
public class RepliesController {
	@Autowired
	private RepliesService repliesService;
	//이벤트 글 삭제
		@RequestMapping(value = "/deleteReply")
		public String deleteReply(@PathVariable("reply_id") int reply_id) {
			System.out.println("컨트롤러 진입");
			System.out.println(reply_id);
			repliesService.deleteReply(reply_id);
			return "/boards/event";
		}
}

package com.group6.shopping.boards.controllers;

import com.group6.shopping.boards.services.BoardsService;
import com.group6.shopping.boards.vo.BoardsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/boards")
public class BoardsController {
    @Autowired
    private BoardsService boardsService;

    @RequestMapping("/viewBoard")
    public String viewBoard(String board_id, Model models) throws Exception {
        BoardsVO boardsVO = boardsService.viewBoard(board_id);

        models.addAttribute("rep_id", boardsVO.getRepliesVOList().get(boardsVO.getRepliesVOList().size()-1).getReply_id());
        models.addAttribute("boardsVO", boardsVO);
        return "/boards/board";
    }

    @RequestMapping("/tmp")
    public String tmp(){
        return "/boards/tmp";
    }
}

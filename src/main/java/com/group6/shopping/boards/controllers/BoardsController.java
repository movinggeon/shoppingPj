package com.group6.shopping.boards.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group6.shopping.boards.services.BoardsService;
import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.EventPagingVO;
import com.group6.shopping.boards.vo.PagingVO;

@Controller
@RequestMapping("/boards")
public class BoardsController {

    @PostMapping("/somethingform")
    public String something(String something){
        System.out.println(something + "도착");
        return "home";
        
    }
        @Autowired
    	private BoardsService boardsservice;
    	
    	
    	 //이벤트 메인페이지 진행중게시글 목록조회
    	  
		
    	  @GetMapping("/event")
      	public String EventBoardslist(EventPagingVO vo, Model model
      			, @RequestParam(value="nowPage", required=false)String nowPage
      			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
      		
      		int total = boardsservice.countBoard();
      		if (nowPage == null && cntPerPage == null) {
      			nowPage = "1";
      			cntPerPage = "6";
      		} else if (nowPage == null) {
      			nowPage = "1";
      		} else if (cntPerPage == null) { 
      			cntPerPage = "6";
      		}
      		vo = new EventPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      		model.addAttribute("paging", vo);
      		model.addAttribute("eventboardlist", boardsservice.EventBoardslist(vo));
      		return "boards/event";
      	}
      

     	
    	  //이벤트 메인페이지 종료게시글 목록조회
    	  
    	@GetMapping("/endevent")
      	public String EndEventBoardslist(EventPagingVO vo, Model model
      			, @RequestParam(value="nowPage", required=false)String nowPage
      			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
      		
      		int total = boardsservice.endcountBoard();
      		if (nowPage == null && cntPerPage == null) {
      			nowPage = "1";
      			cntPerPage = "6";
      		} else if (nowPage == null) {
      			nowPage = "1";
      		} else if (cntPerPage == null) { 
      			cntPerPage = "6";
      		}
      		vo = new EventPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      		model.addAttribute("paging", vo);
      		model.addAttribute("endeventboardlist", boardsservice.EndEventBoardslist(vo));
      		return "boards/endevent";
      	}
    		
    	//게시글 보기
    	@RequestMapping(value = "/readView")
    	public String read(BoardsVO boardsVO, Model model) throws Exception{
    		System.out.println("/readView22");
    		System.out.println("/boardsVO : "+boardsVO.getBoard_id());
    		System.out.println("/boardsVO : "+boardsVO.getBoard_type());
    		
    		model.addAttribute("read", boardsservice.read(boardsVO.getBoard_id()));
    		
    		return "boards/readView";
    	}
    	
    	//리뷰글쓰기
    	@RequestMapping(value = "/insertView")
    	public String insertView(BoardsVO boardsVO, Model model) throws Exception{
    		
    		System.out.println("/insertView");
    		return "boards/insertView";
    	}
    	//이벤트 글쓰기
    	@RequestMapping(value = "/eventinsertView")
    	public String eventinsertView(BoardsVO boardsVO, Model model) throws Exception{
    		
    		System.out.println("/insertView");
    		return "boards/eventinsertView";
    	}
    		
    	//이벤트글쓰기	
    	@RequestMapping(value = "/eventinsert")
    	public String eventinsert(BoardsVO boardsVO, RedirectAttributes rttr) throws Exception{
    		System.out.println("/eventinsert클릭");
    		System.out.println("/eventinsert클릭"+boardsVO.getBoard_type());
    		boardsservice.eventinsert(boardsVO);
    		return "redirect:"+boardsVO.getBoard_type();
    	}
    	
    	
    	@RequestMapping(value = "/reviewinsert")
    	public String insert(BoardsVO boardsVO, RedirectAttributes rttr) throws Exception{
    		System.out.println("/reviewinsert클릭");
    		boardsservice.reviewinsert(boardsVO);
    		return "redirect:"+boardsVO.getBoard_type();
    	}
    	
    	@RequestMapping(value = "/delete")
    	public String delete(BoardsVO boardsVO, RedirectAttributes rttr) throws Exception{
    		
    		boardsservice.delete(boardsVO.getBoard_id());
    		System.out.println(boardsVO.getBoard_id());
    		System.out.println(boardsVO.getBoard_type());
    		return "redirect:"+boardsVO.getBoard_type(); 
    	}
    	
    	
}

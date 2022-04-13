package com.group6.shopping.boards.services;

import java.util.List;
import java.util.Map;

import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.EventPagingVO;
import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.files.vo.FilesVO;
import com.group6.shopping.models.vo.ModelsVO;

public interface BoardsService {
    public List<BoardsVO> getModelBoards(ModelsVO modelsVO, PagingVO pagingVO, Map<String,String> cateMap) throws Exception;
    public int getNumOfBoards(ModelsVO modelsVO) throws Exception;
    public int sumOfBoardRate(ModelsVO modelsVO) throws Exception;
    public double avgOfBoardRate(ModelsVO modelsVO) throws Exception;
    public List<Integer> numOfBoardRate(ModelsVO modelsVo) throws Exception;
    public List<Integer> boardRateList(ModelsVO modelsVO) throws Exception;

    
    
	//이벤트 메인페이지 게시글 목록조회
    public List<BoardsVO> EventBoardslist(EventPagingVO vo);
	//이벤트 메인페이지 종료게시글 목록조회
	public List<BoardsVO> EndEventBoardslist(EventPagingVO vo);
	//게시글 조회
    public BoardsVO read(int board_id) throws Exception;
    //이벤트 게시글 작성
    public void eventinsert(BoardsVO vo) throws Exception;
    //리뷰 게시글 작성
    public void reviewinsert(BoardsVO vo) throws Exception;
    // 게시글 삭제
    public void delete(int board_id) throws Exception;
    //게시글 수정
    public void update(BoardsVO vo) throws Exception;
    //진행중이벤트갯수
    public int countBoard();
    //종료이벤트갯수
    public int endcountBoard();
   
    public BoardsVO viewBoard(String board_id) throws Exception;
    
    public void reviewupdate(BoardsVO vo) throws Exception;

    public List<BoardsVO> eventMainDisplay() throws Exception;
  
}

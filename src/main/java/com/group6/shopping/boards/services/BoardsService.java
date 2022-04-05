package com.group6.shopping.boards.services;

import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.models.vo.ModelsVO;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface BoardsService {
    public List<BoardsVO> getModelBoards(ModelsVO modelsVO, PagingVO pagingVO, Map<String,String> cateMap) throws Exception;
    public int getNumOfBoards(ModelsVO modelsVO) throws Exception;
    public int sumOfBoardRate(ModelsVO modelsVO) throws Exception;
    public double avgOfBoardRate(ModelsVO modelsVO) throws Exception;
    public List<Integer> numOfBoardRate(ModelsVO modelsVo) throws Exception;
    public List<Integer> boardRateList(ModelsVO modelsVO) throws Exception;
    

	//리뷰 메인페이지 게시글 목록조회
	public List<BoardsVO> ReviewBoardslist() throws Exception;
	//이벤트 메인페이지 게시글 목록조회
	public List<BoardsVO> EventBoardslist() throws Exception;
	//이벤트 메인페이지 종료게시글 목록조회
	public List<BoardsVO> EndEventBoardslist() throws Exception;
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
    
   
}

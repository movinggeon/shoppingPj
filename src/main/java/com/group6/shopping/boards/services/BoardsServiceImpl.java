package com.group6.shopping.boards.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.BoardsDAO;
import com.group6.shopping.batis.FilesDAO;
import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.EventPagingVO;
import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.files.vo.FilesVO;
import com.group6.shopping.models.vo.ModelsVO;

@Service
public class BoardsServiceImpl implements BoardsService {

	@Autowired
	private BoardsDAO boardsDAO;
	@Autowired
	private FilesDAO filesDAO;
	
	@Override
	public List<BoardsVO> getModelBoards(ModelsVO modelsVO, PagingVO pagingVO, Map<String, String> cateMap)
			throws Exception {
		return boardsDAO.getModelBoards(modelsVO, pagingVO, cateMap);
	}

	@Override
	public int getNumOfBoards(ModelsVO modelsVO) throws Exception {
		return boardsDAO.getNumOfBoards(modelsVO);
	}

	@Override
	public int sumOfBoardRate(ModelsVO modelsVO) throws Exception {
		return boardsDAO.sumOfBoardRate(modelsVO);
	}

	@Override
	public double avgOfBoardRate(ModelsVO modelsVO) throws Exception {
		return boardsDAO.avgOfBoardRate(modelsVO);
	}

	@Override
	public List<Integer> numOfBoardRate(ModelsVO modelsVo) throws Exception {
		return boardsDAO.numOfBoardRate(modelsVo);
	}

	@Override
	public List<Integer> boardRateList(ModelsVO modelsVO) throws Exception {
		return boardsDAO.boardRateList(modelsVO);
	}

	// 이벤트 메인페이지 게시글 목록조회
	@Override
	public List<BoardsVO> EventBoardslist(EventPagingVO vo) {
		return boardsDAO.EventBoardslist(vo);
	}

	// 이벤트 메인페이지 종료게시글 목록조회
	@Override
	public List<BoardsVO> EndEventBoardslist(EventPagingVO vo) {
		return boardsDAO.EndEventBoardslist(vo);
	}

	// 게시글 조회
	@Override
	public BoardsVO read(int board_id) throws Exception {
		return boardsDAO.read(board_id);
	}

	// 이벤트게시글 작성
	@Override
	public void eventinsert(BoardsVO vo) throws Exception {
		boardsDAO.eventinsert(vo);
	}
	
	
	
	// 리뷰게시글 작성
	@Override
	public void reviewinsert(BoardsVO vo) throws Exception {
		boardsDAO.reviewinsert(vo);
		
	}

	// 리뷰게시글 삭제
	@Override
	public void delete(int board_id) throws Exception {
		boardsDAO.delete(board_id);
	}

	// 이벤트 게시글 수정
	@Override
	public void update(BoardsVO vo) throws Exception {
		boardsDAO.update(vo);
	}
	//진행중이벤트갯수
	@Override
	public int countBoard() {
		return boardsDAO.countBoard();
	}
	//종료이벤트갯수
	@Override
	public int endcountBoard() {
		return boardsDAO.endcountBoard();
	}


    @Override
    public BoardsVO viewBoard(String board_id) throws Exception {
        return boardsDAO.viewBoard(board_id);
    }

   @Override
   public void reviewupdate(BoardsVO vo) throws Exception {
	   boardsDAO.reviewupdate(vo);
   }

	@Override
	public List<BoardsVO> eventMainDisplay() throws Exception {
		return boardsDAO.eventMainDisplay();
	}
}

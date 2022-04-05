package com.group6.shopping.boards.services;

import com.group6.shopping.batis.BoardsDAO;
import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.models.vo.ModelsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

@Service
public class BoardsServiceImpl implements BoardsService{
    
	@Autowired
    private BoardsDAO boardsDAO;
	

    @Override
    public List<BoardsVO> getModelBoards(ModelsVO modelsVO, PagingVO pagingVO, Map<String, String> cateMap) throws Exception {
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
    
  //리뷰 메인페이지 게시글 목록조회
  	@Override
  	public List<BoardsVO> ReviewBoardslist() throws Exception{
  		return boardsDAO.ReviewBoardslist();
  		
  	}
  	
  	//이벤트 메인페이지 게시글 목록조회
  		@Override
  		public List<BoardsVO> EventBoardslist() throws Exception{
  			return boardsDAO.EventBoardslist();
  			
  		}
  		
  	//이벤트 메인페이지 종료게시글 목록조회
  		@Override
  		public List<BoardsVO> EndEventBoardslist() throws Exception{
  			return boardsDAO.EndEventBoardslist();
  			
  		}
  		
  		//게시글 조회
  		@Override
  	    public BoardsVO read(int board_id) throws Exception{
  			return boardsDAO.read(board_id);
  		}
  		
  	    //이벤트게시글 작성
  		@Override
  	    public void eventinsert(BoardsVO vo) throws Exception{
  			boardsDAO.eventinsert(vo);
  		}
  		 //리뷰게시글 작성
  		@Override
  	    public void reviewinsert(BoardsVO vo) throws Exception{
  			boardsDAO.reviewinsert(vo);
  		}
  	    //리뷰게시글 삭제
  		@Override
  	    public void delete(int board_id) throws Exception{
  	    	boardsDAO.delete(board_id);
  	    }
  	    //이벤트 게시글 수정
  		@Override
  	    public void update(BoardsVO vo) throws Exception{
  	    	boardsDAO.update(vo);
  	    }
  		
  		
  		
}

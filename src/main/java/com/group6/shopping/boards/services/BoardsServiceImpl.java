package com.group6.shopping.boards.services;

import com.group6.shopping.batis.BoardsDAO;
import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.models.vo.ModelsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}

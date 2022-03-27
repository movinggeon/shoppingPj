package com.group6.shopping.boards.services;

import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.models.vo.ModelsVO;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface BoardsService {
    public List<BoardsVO> getModelBoards(ModelsVO modelsVO, PagingVO pagingVO) throws Exception;
    public int getNumOfBoards(ModelsVO modelsVO) throws Exception;
    public int sumOfBoardRate(ModelsVO modelsVO) throws Exception;
    public double avgOfBoardRate(ModelsVO modelsVO) throws Exception;
    public List<Integer> numOfBoardRate(ModelsVO modelsVo) throws Exception;
    public List<Integer> boardRateList(ModelsVO modelsVO) throws Exception;
}

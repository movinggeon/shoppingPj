package com.group6.shopping.batis;

import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.models.vo.ModelsVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BoardsDAO {
    public List<BoardsVO> getModelBoards(@Param("modelsVO") ModelsVO modelsVO, @Param("pagingVO")PagingVO pagingVO, @Param("cateMap")Map<String,String> cateMap) throws Exception;
    public int getNumOfBoards(ModelsVO modelsVO) throws Exception;
    public int sumOfBoardRate(ModelsVO modelsVO) throws Exception;
    public double avgOfBoardRate(ModelsVO modelsVO) throws Exception;
    public List<Integer> numOfBoardRate(ModelsVO modelsVo) throws Exception;
    public List<Integer> boardRateList(ModelsVO modelsVO) throws Exception;
    public BoardsVO viewBoard(String board_id) throws Exception;
}

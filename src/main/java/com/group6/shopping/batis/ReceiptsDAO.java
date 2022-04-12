package com.group6.shopping.batis;

import java.util.HashMap;
import java.util.List;

import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.receipts.vo.ReceiptsDisplayVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;
import org.apache.ibatis.annotations.Param;

public interface ReceiptsDAO {

	public int insertReceipts(HashMap<String, Object>param) throws Exception;
	public List<ReceiptsVO> getAllReceipts(@Param("mem_id")   String mem_id , @Param("pagingVO") PagingVO pagingVO) throws Exception;
	public List<ReceiptsDisplayVO> getAllReceiptsInfo(String mem_id) throws Exception;
	public Integer getCntReceipts(String mem_id) throws Exception;
}

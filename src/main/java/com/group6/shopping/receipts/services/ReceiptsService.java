package com.group6.shopping.receipts.services;

import java.util.HashMap;
import java.util.List;

import com.group6.shopping.receipts.vo.ReceiptsDisplayVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;

public interface ReceiptsService {

	public void insertReceipts(HashMap<String, Object>param) throws Exception;
    public List<ReceiptsVO> getAllReceipts(String mem_id) throws Exception;
    public List<ReceiptsDisplayVO> getAllReceiptsInfo(String mem_id) throws Exception;
}

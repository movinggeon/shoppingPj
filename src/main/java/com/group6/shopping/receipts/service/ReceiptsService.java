package com.group6.shopping.receipts.service;

import com.group6.shopping.receipts.vo.ReceiptsDisplayVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;

import java.util.List;

public interface ReceiptsService {
    public List<ReceiptsVO> getAllReceipts(String mem_id) throws Exception;
    public List<ReceiptsDisplayVO> getAllReceiptsInfo(String mem_id) throws Exception;
}

package com.group6.shopping.batis;

import com.group6.shopping.receipts.vo.ReceiptsDisplayVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;

import java.util.List;

public interface ReceiptsDAO {
    public List<ReceiptsVO> getAllReceipts(String mem_id) throws Exception;
}

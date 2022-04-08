package com.group6.shopping.receipts.services;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.ReceiptsDAO;

@Service("receiptsService")
public class ReceiptsServiceImpl implements ReceiptsService{

	@Autowired
	ReceiptsDAO receiptsDAO;
	
	@Override
	public void insertReceipts(HashMap<String, Object>param) throws Exception{
		receiptsDAO.insertReceipts(param);
	}
}

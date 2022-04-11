package com.group6.shopping.receipts.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.CartsDAO;
import com.group6.shopping.batis.ReceiptsDAO;
import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.receipts.vo.ReceiptsDisplayVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;

@Service("receiptsService")
public class ReceiptsServiceImpl implements ReceiptsService{

	@Autowired
	ReceiptsDAO receiptsDAO;
	
	@Autowired
	CartsDAO cartsDAO;
	
	@Override
	public void insertReceipts(HashMap<String, Object>param) throws Exception{
		receiptsDAO.insertReceipts(param);
	}
	
    @Override
    public List<ReceiptsVO> getAllReceipts(String mem_id) throws Exception {
        return receiptsDAO.getAllReceipts(mem_id);
    }

    @Override
    public List<ReceiptsDisplayVO> getAllReceiptsInfo(String mem_id) throws Exception {
        List<ReceiptsVO> receiptsVOList = receiptsDAO.getAllReceipts(mem_id);
        List<ReceiptsDisplayVO> receiptsDisplayVOList = new ArrayList<>();
        if(receiptsVOList.size() > 0){
            for(ReceiptsVO tmp: receiptsVOList){
                List<CartsVO> cartsVOList = cartsDAO.getPaidCart(tmp);
                ReceiptsDisplayVO receiptsDisplayVO = new ReceiptsDisplayVO(tmp, cartsVOList);
                receiptsDisplayVOList.add(receiptsDisplayVO);
            }
        }
        return receiptsDisplayVOList;
    }
}

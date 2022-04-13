package com.group6.shopping.carts.services;

import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;

public interface CartsService {
    public int insertCart(HashMap<String, Object> map) throws Exception;
    public List<CartsVO> getCart(String mem_id, String history) throws Exception;
    public int deleteCart(CartsVO cartsVO) throws  Exception;
    public int updateQty(CartsVO cartsVO) throws Exception;
    public Integer getTotal(String mem_id,String history) throws Exception;
    public CartsVO getSingleCart(CartsVO cartsVO) throws Exception;
    public int updateCart(CartsVO cartsVO, int salePrice) throws Exception;
    public List<ModelsVO> getPopularItem(int totalshow) throws Exception;
    public void updateRecId(HashMap<String, Object> param) throws Exception;
    public List<CartsVO> getPaidCart(ReceiptsVO receiptsVO) throws Exception;
    public void updateRefund(int cart_id) throws Exception;

    public Integer duplicationItem(HashMap<String, Object> map) throws Exception;
    public int updateDuplicate(String cart_id)throws Exception;
}

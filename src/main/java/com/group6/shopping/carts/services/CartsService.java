package com.group6.shopping.carts.services;

import com.group6.shopping.carts.vo.CartsVO;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface CartsService {
    public int insertCart(HashMap<String, Object> map) throws Exception;
    public List<CartsVO> getCart(String mem_id, String history) throws Exception;
    public int deleteCart(CartsVO cartsVO) throws  Exception;
    public int updateQty(CartsVO cartsVO) throws Exception;
    public int getTotal(String mem_id,String history) throws Exception;
    public CartsVO getSingleCart(CartsVO cartsVO) throws Exception;
    public int updateCart(CartsVO cartsVO, int salePrice) throws Exception;

}

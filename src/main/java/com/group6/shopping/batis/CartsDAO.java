package com.group6.shopping.batis;

import com.group6.shopping.carts.vo.CartsVO;

import java.util.HashMap;
import java.util.List;

public interface CartsDAO {
    public int insertCart(HashMap<String, Object> map) throws Exception;
    public List<CartsVO> getCart(String mem_id) throws Exception;
    public List<CartsVO> getCartHistory(String mem_id) throws Exception;
}

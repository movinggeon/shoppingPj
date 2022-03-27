package com.group6.shopping.batis;

import com.group6.shopping.carts.vo.CartsVO;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface CartsDAO {
    public int insertCart(HashMap<String, Object> map) throws Exception;
    public List<CartsVO> getCart(@Param("mem_id") String mem_id, @Param("history") String history) throws Exception;
    public int deleteCart(CartsVO cartsVO) throws  Exception;
    public int updateQty(CartsVO cartsVO) throws Exception;
    public int getTotal(@Param("mem_id") String mem_id, @Param("history") String history) throws Exception;
    public CartsVO getSingleCart(CartsVO cartsVO) throws Exception;
}

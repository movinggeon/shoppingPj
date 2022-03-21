package com.group6.shopping.carts.services;

import com.group6.shopping.batis.CartsDAO;
import com.group6.shopping.carts.vo.CartsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CartsServiceImpl implements CartsService{
    @Autowired
    private CartsDAO cartsDAO;

    @Override
    public int insertCart(HashMap<String, Object> map) throws Exception {
        return cartsDAO.insertCart(map);
    }

    @Override
    public List<CartsVO> getCart(String mem_id) throws Exception {
        return cartsDAO.getCart(mem_id);
    }

    @Override
    public List<CartsVO> getCartHistory(String mem_id) throws Exception {
        return null;
    }
}

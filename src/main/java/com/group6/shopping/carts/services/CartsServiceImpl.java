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
    public List<CartsVO> getCart(String mem_id, String history) throws Exception {
        return cartsDAO.getCart(mem_id, history);
    }

    @Override
    public int deleteCart(CartsVO cartsVO) throws Exception {
        return cartsDAO.deleteCart(cartsVO);
    }

    @Override
    public int updateQty(CartsVO cartsVO) throws Exception {
        return cartsDAO.updateQty(cartsVO);
    }

    @Override
    public int getTotal(String mem_id, String history) throws Exception {
        return cartsDAO.getTotal(mem_id, history);
    }

    @Override
    public CartsVO getSingleCart(CartsVO cartsVO) throws Exception {
        return cartsDAO.getSingleCart(cartsVO);
    }

    @Override
    public int updateCart(CartsVO cartsVO, int salePrice) throws Exception {
        return cartsDAO.updateCart(cartsVO, salePrice);
    }
}

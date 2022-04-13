package com.group6.shopping.carts.services;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.CartsDAO;
import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;

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
    public List<CartsVO> getPaidCart(ReceiptsVO receiptsVO) throws Exception {
        return cartsDAO.getPaidCart(receiptsVO);
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
    public Integer getTotal(String mem_id, String history) throws Exception {
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

    @Override
    public List<ModelsVO> getPopularItem(int totalshow) throws Exception {
        return cartsDAO.getPopularItem(totalshow);
    }

    @Override
    public void updateRecId(HashMap<String, Object> param) throws Exception {
    	cartsDAO.updateRecId(param);
    }

    @Override
    public void updateRefund(int cart_id) throws Exception {
    	cartsDAO.updateRefund(cart_id);
    }

    @Override
    public Integer duplicationItem(HashMap<String, Object> map) throws Exception {
        return cartsDAO.duplicationItem(map);
    }

    @Override
    public int updateDuplicate(String cart_id) throws Exception {
        return cartsDAO.updateDuplicate(cart_id);
    }
}

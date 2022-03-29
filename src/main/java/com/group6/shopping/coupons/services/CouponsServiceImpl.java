package com.group6.shopping.coupons.services;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.CouponsDAO;
import com.group6.shopping.coupons.vo.CouponsVO;

@Service
public class CouponsServiceImpl implements CouponsService{
    @Autowired
    private CouponsDAO couponsDAO;


    @Override
    public List<CouponsVO> getAllCoupons(String memId) throws Exception {
        return couponsDAO.getAllCoupons(memId);
    }

    @Override
    public int usedCoupon(CouponsVO couponsVO) throws Exception {
        return couponsDAO.usedCoupon(couponsVO);
    }

    @Override
    public CouponsVO getCoupon(CouponsVO couponsVO) throws Exception {
        return couponsDAO.getCoupon(couponsVO);
    }

    @Override
    public int countCoupon(String memId) throws Exception {
    	return couponsDAO.countCoupon(memId);
    }

    @Override
    public void insertCoupon(HashMap<String, Object> param) throws Exception {
    	couponsDAO.insertCoupon(param);
    }
}

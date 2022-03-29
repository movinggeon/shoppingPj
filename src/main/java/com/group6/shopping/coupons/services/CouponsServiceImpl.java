package com.group6.shopping.coupons.services;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.CouponsDAO;
import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.security.CustomMemDetails;

@Service
public class CouponsServiceImpl implements CouponsService{
    @Autowired
    private CouponsDAO couponsDAO;


    @Override
    public List<CouponsVO> getAllCoupons(CustomMemDetails user) throws Exception {
        return couponsDAO.getAllCoupons(user);
    }

    @Override
    public int usedCoupon(CouponsVO couponsVO) throws Exception {
        return couponsDAO.usedCoupon(couponsVO);
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

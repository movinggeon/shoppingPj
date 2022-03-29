package com.group6.shopping.coupons.services;

import com.group6.shopping.batis.CouponsDAO;
import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.security.CustomMemDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public CouponsVO getCoupon(CouponsVO couponsVO) throws Exception {
        return couponsDAO.getCoupon(couponsVO);
    }
}

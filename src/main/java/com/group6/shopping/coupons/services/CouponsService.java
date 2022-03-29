package com.group6.shopping.coupons.services;

import java.util.HashMap;
import java.util.List;

import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.security.CustomMemDetails;

public interface CouponsService {
    public List<CouponsVO> getAllCoupons(CustomMemDetails user) throws Exception;
    public int usedCoupon(CouponsVO couponsVO) throws Exception;
    public int countCoupon(String memId) throws Exception;
    public void insertCoupon(HashMap<String, Object> param) throws Exception;
}

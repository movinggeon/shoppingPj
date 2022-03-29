package com.group6.shopping.batis;

import java.util.HashMap;
import java.util.List;

import com.group6.shopping.coupons.vo.CouponsVO;

public interface CouponsDAO {
    public List<CouponsVO> getAllCoupons(String memId) throws Exception;
    public int usedCoupon(CouponsVO couponsVO) throws Exception;
    public CouponsVO getCoupon(CouponsVO couponsVO) throws Exception;
    public int countCoupon(String memId) throws Exception;
    public void insertCoupon(HashMap<String, Object> param) throws Exception;
}

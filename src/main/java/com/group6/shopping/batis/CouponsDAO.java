package com.group6.shopping.batis;

import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.security.CustomMemDetails;

import java.util.HashMap;
import java.util.List;

public interface CouponsDAO {
    public List<CouponsVO> getAllCoupons(CustomMemDetails user) throws Exception;
    public int usedCoupon(CouponsVO couponsVO) throws Exception;
    public int countCoupon(String memId) throws Exception;
    public void insertCoupon(HashMap<String, Object> param) throws Exception;
}

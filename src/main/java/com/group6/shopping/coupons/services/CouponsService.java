package com.group6.shopping.coupons.services;

import java.util.HashMap;
import java.util.List;

import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.coupons.vo.CouponsVO;

public interface CouponsService {
    public List<CouponsVO> getAllCoupons(String memId, PagingVO pagingVO) throws Exception;
    public List<CouponsVO> getAllCoupon(String memId) throws Exception;
    public int usedCoupon(CouponsVO couponsVO) throws Exception;
    public CouponsVO getCoupon(CouponsVO couponsVO) throws Exception;
    public Integer countCoupon(String memId) throws Exception;
    public void insertCoupon(HashMap<String, Object> param) throws Exception;
    public void createCoupon(HashMap<String, Object> param) throws Exception;
    public List<CouponsVO> getAdminCoupons(String memId, PagingVO page) throws Exception;
    public void deleteCoupon(String couponDecs) throws Exception;
    public Integer getCountAdminCoupons(String memId) throws Exception;
}

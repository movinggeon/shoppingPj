package com.group6.shopping.coupons.services;

import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.members.vo.MembersVO;
import com.group6.shopping.security.CustomMemDetails;

import java.util.List;

public interface CouponsService {
    public List<CouponsVO> getAllCoupons(CustomMemDetails user) throws Exception;
    public int usedCoupon(CouponsVO couponsVO) throws Exception;
}

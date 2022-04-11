package com.group6.shopping.batis;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;

public interface CartsDAO {
    public int insertCart(HashMap<String, Object> map) throws Exception;
    public List<CartsVO> getCart(@Param("mem_id") String mem_id, @Param("history") String history) throws Exception;
    public int deleteCart(CartsVO cartsVO) throws  Exception;
    public int updateQty(CartsVO cartsVO) throws Exception;
    public Integer getTotal(@Param("mem_id") String mem_id, @Param("history") String history) throws Exception;
    public CartsVO getSingleCart(CartsVO cartsVO) throws Exception;
    public int updateCart(@Param("cartsVO") CartsVO cartsVO, @Param("salePrice") int salePrice) throws Exception;
    public List<ModelsVO> getPopularItem(int totalshow) throws Exception;
    public void updateRecId(HashMap<String, Object> param) throws Exception;
    public List<CartsVO> getPaidCart(ReceiptsVO receiptsVO) throws Exception;
    public void updateRefund(int cart_id) throws Exception;
}

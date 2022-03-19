package com.group6.shopping.batis;

import com.group6.shopping.specifications.vo.SpecDisplayVO;
import com.group6.shopping.specifications.vo.SpecVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface SpecificationsDAO {
    public List<SpecVO> getModels(String product) throws Exception;
    public List<SpecDisplayVO> getModelNames(@Param("product") String product) throws Exception;
    public List<Object> getSpecDisplay(@Param("spec") String spec, @Param("product")String product, @Param("model") String model) throws Exception;
    public Integer getMaxPrice( @Param("product")String product, @Param("model") String model) throws Exception;
    public Integer getMinPrice( @Param("product")String product, @Param("model") String model) throws Exception;
    public SpecVO getSpec(SpecVO specVO) throws Exception;

}

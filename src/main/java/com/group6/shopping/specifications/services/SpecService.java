package com.group6.shopping.specifications.services;

import com.group6.shopping.specifications.vo.SpecDisplayVO;
import com.group6.shopping.specifications.vo.SpecVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SpecService {
    public List<SpecVO> getModels(String product) throws Exception;
    public List<SpecDisplayVO> getModelNames(String product) throws Exception;
    public SpecDisplayVO getSpec(String product, int productId, String model, int modelId) throws Exception;


}

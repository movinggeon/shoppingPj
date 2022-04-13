package com.group6.shopping.models.services;

import com.group6.shopping.models.vo.ModelsVO;

import java.util.List;

public interface ModelsService {
    public ModelsVO getModel(ModelsVO modelsVO) throws Exception;
    public List<ModelsVO> getBrandNewModels() throws Exception;
}

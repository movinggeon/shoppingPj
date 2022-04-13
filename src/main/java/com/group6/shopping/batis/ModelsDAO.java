package com.group6.shopping.batis;

import com.group6.shopping.models.vo.ModelsVO;

import java.util.List;

public interface ModelsDAO {
    public ModelsVO getModel(ModelsVO modelsVO) throws Exception;
    public List<ModelsVO> getBrandNewModels() throws Exception;

}

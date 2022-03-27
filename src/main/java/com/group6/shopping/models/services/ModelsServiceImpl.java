package com.group6.shopping.models.services;

import com.group6.shopping.batis.ModelsDAO;
import com.group6.shopping.models.vo.ModelsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ModelsServiceImpl implements ModelsService{
    @Autowired
    private ModelsDAO modelsDAO;

    @Override
    public ModelsVO getModel(ModelsVO modelsVO) throws Exception {
        return modelsDAO.getModel(modelsVO);
    }
}

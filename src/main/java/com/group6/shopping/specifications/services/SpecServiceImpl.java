package com.group6.shopping.specifications.services;

import com.group6.shopping.batis.SpecificationsDAO;
import com.group6.shopping.specifications.vo.SpecDisplayVO;
import com.group6.shopping.specifications.vo.SpecVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("specService")
public class SpecServiceImpl implements SpecService {

    @Autowired
    SpecificationsDAO specificationsDAO;

    @Override
    public List<SpecVO> getModels(String product) throws Exception {

        return specificationsDAO.getModels(product);
    }

    @Override
    public List<SpecDisplayVO> getModelNames(String product) throws Exception {
        return specificationsDAO.getModelNames(product);
    }

    @Override
    public SpecDisplayVO getSpec(String product, int productId, String model, int modelId) throws Exception {

        SpecDisplayVO tmp = new SpecDisplayVO(
                productId, modelId, product, model,
                specificationsDAO.getSpec("spec_processor",product,model),
                specificationsDAO.getSpec("spec_memory",product,model),
                specificationsDAO.getSpec("spec_display",product,model),
                specificationsDAO.getSpec("spec_network",product,model),
                specificationsDAO.getSpec("spec_color",product,model),
                specificationsDAO.getSpec("spec_weight",product,model),
                specificationsDAO.getSpec("spec_price",product,model)
        );

        return tmp;
    }
}

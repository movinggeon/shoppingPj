package com.group6.shopping.specifications.controllers;

import com.group6.shopping.specifications.services.SpecService;
import com.group6.shopping.specifications.vo.SpecDisplayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/spec")
public class SpecController {

    @Autowired
    private SpecService specService;

    @RequestMapping("/viewModels")
    public String viewModels(Model models, String product) throws Exception {
        //List<SpecVO> specVOList = specService.getModels(product);

        List<SpecDisplayVO> modelNamesList = specService.getModelNames(product);
        List<SpecDisplayVO> specDisplayVOList = new ArrayList<SpecDisplayVO>();

        for(int i = 0; i < modelNamesList.size(); i++){
            String model = modelNamesList.get(i).getModel_name();
            int modelId = modelNamesList.get(i).getModel_id();
            int productId = modelNamesList.get(i).getProduct_id();

            SpecDisplayVO tmp = specService.getSpecDisplay(product, productId, model, modelId);

            specDisplayVOList.add(tmp);
        }

        models.addAttribute("specDisplayVOList",specDisplayVOList);

        return "spec/viewModelList";
    }

    @RequestMapping("/chooseModel")
    public String chooseModel(Model models,SpecDisplayVO specDisplayVO) throws Exception {
        SpecDisplayVO tmp = specService.getSpecDisplay(
                specDisplayVO.getProduct_name(), specDisplayVO.getProduct_id(),
                specDisplayVO.getModel_name(),specDisplayVO.getModel_id());

        models.addAttribute("specDisplayVO", tmp);

        return "spec/chooseModel";
    }



}

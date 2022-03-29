package com.group6.shopping.specifications.controllers;

import com.group6.shopping.specifications.services.SpecService;
import com.group6.shopping.specifications.vo.SpecVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/spec")
public class SpecRestController {

    @Autowired
    private SpecService specService;

    @RequestMapping("/findSpec")
    public SpecVO findSpec(@RequestBody SpecVO specVO) throws Exception {
        return specService.getSpec(specVO);
    }
}

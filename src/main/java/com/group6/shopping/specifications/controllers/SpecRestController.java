package com.group6.shopping.specifications.controllers;

import com.group6.shopping.specifications.services.SpecService;
import com.group6.shopping.specifications.vo.SpecVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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

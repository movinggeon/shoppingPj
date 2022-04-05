package com.group6.shopping.models.vo;

import java.util.Comparator;

public class ModelsComparator implements Comparator<ModelsVO> {
    @Override
    public int compare(ModelsVO o1, ModelsVO o2) {
        if(o1.getModel_name().compareTo(o2.getModel_name()) < 0){
            return 1;
        }else if(o1.getModel_name().compareTo(o2.getModel_name()) > 0){
            return -1;
        }
        return 0;
    }
}

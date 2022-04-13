package com.group6.shopping.specifications.services;

import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.security.CustomMemDetails;
import com.group6.shopping.specifications.vo.SearchSpecVO;
import com.group6.shopping.specifications.vo.SpecDisplayVO;
import com.group6.shopping.specifications.vo.SpecVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SpecService {
    public List<SpecVO> getModels(String product) throws Exception;
    public List<SpecDisplayVO> getModelNames(String product) throws Exception;
    public SpecDisplayVO getSpecDisplay(String product, int productId, String model, int modelId) throws Exception;
    public Integer getMaxPrice(String product, String model) throws Exception;
    public Integer getMinPrice(String product, String model) throws Exception;
    public SpecVO getSpec(SpecVO specVO) throws Exception;
    public int updateSpecQty(CustomMemDetails user) throws Exception;
    public SearchSpecVO searchSpec() throws Exception;
    public Map<String, Object> getSearchContext(SearchSpecVO searchSpecVO, String searchInput) throws Exception;
    public List<String> getFieldList(String searchInputLower, List<String> field);
    public List<ModelsVO> getModel(Map<String, Object> searchContext) throws Exception;
    public Map<Integer, Integer> orderByModelCount(List<ModelsVO> modelsVOList);


}

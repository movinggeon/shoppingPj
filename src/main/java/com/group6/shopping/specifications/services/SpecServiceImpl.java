package com.group6.shopping.specifications.services;

import com.group6.shopping.batis.SpecificationsDAO;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.security.CustomMemDetails;
import com.group6.shopping.specifications.vo.SearchSpecVO;
import com.group6.shopping.specifications.vo.SpecDisplayVO;
import com.group6.shopping.specifications.vo.SpecVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
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
    public SpecDisplayVO getSpecDisplay(String product, int productId, String model, int modelId) throws Exception {

        List<Integer> maxmin = new ArrayList<Integer>();

        int maxPrice = getMaxPrice(product, model);
        int minPrice = getMinPrice(product, model);

        maxmin.add(minPrice); maxmin.add(maxPrice);

        SpecDisplayVO tmp = new SpecDisplayVO(
                productId, modelId, product, model,
                specificationsDAO.getSpecDisplay("spec_processor",product,model),
                specificationsDAO.getSpecDisplay("spec_memory",product,model),
                specificationsDAO.getSpecDisplay("spec_display",product,model),
                specificationsDAO.getSpecDisplay("spec_network",product,model),
                specificationsDAO.getSpecDisplay("spec_color",product,model),
                specificationsDAO.getSpecDisplay("spec_weight",product,model),
                maxmin
        );

        return tmp;
    }

    @Override
    public Integer getMaxPrice(String product, String model) throws Exception {
        return specificationsDAO.getMaxPrice(product,model);
    }

    @Override
    public Integer getMinPrice(String product, String model) throws Exception {
        return specificationsDAO.getMinPrice(product,model);
    }

    @Override
    public SpecVO getSpec(SpecVO specVO) throws Exception {
        return specificationsDAO.getSpec(specVO);
    }

    @Override
    public int updateSpecQty(CustomMemDetails user) throws Exception {
        return specificationsDAO.updateSpecQty(user);
    }

    @Override
    public SearchSpecVO searchSpec() throws Exception {
        SearchSpecVO searchSpecVO = new SearchSpecVO(
                specificationsDAO.searchSpec("product_name"),
                specificationsDAO.searchSpec("model_name"),
                specificationsDAO.searchSpec("spec_processor"),
                specificationsDAO.searchSpec("spec_memory"),
                specificationsDAO.searchSpec("spec_display"),
                specificationsDAO.searchSpec("spec_network"),
                specificationsDAO.searchSpec("spec_color")
        );
        return searchSpecVO;
    }

    public List<String> getFieldList(String searchInputLower, List<String> field){
        List<String> result = new ArrayList<>();
        for(String tmp : field){
            if(searchInputLower.contains(tmp.toLowerCase())){
                result.add(tmp);
            }
        }
        return result;
    }

    @Override
    public Map<String, Object> getSearchContext(SearchSpecVO searchSpecVO, String searchInput) throws Exception {
        Map<String, Object> searchContext = new HashMap<>();
        String searchInputLower = searchInput.toLowerCase();

        List<String> product_nameList = getFieldList(searchInputLower, searchSpecVO.getProduct_name());
        List<String> model_nameList = getFieldList(searchInputLower, searchSpecVO.getModel_name());
        List<String> spec_processorList = getFieldList(searchInputLower, searchSpecVO.getSpec_processor());
        List<String> spec_memoryList = getFieldList(searchInputLower, searchSpecVO.getSpec_memory());
        List<String> spec_displayList = getFieldList(searchInputLower, searchSpecVO.getSpec_display());
        List<String> spec_networkList = getFieldList(searchInputLower, searchSpecVO.getSpec_network());
        List<String> spec_colorList = getFieldList(searchInputLower, searchSpecVO.getSpec_color());

       searchContext.put("product_name", product_nameList);
       searchContext.put("model_name", model_nameList);
       searchContext.put("spec_processor", spec_processorList);
       searchContext.put("spec_memory", spec_memoryList);
       searchContext.put("spec_display", spec_displayList);
       searchContext.put("spec_network", spec_networkList);
       searchContext.put("spec_color", spec_colorList);

       return searchContext;
    }

    @Override
    public List<ModelsVO> getModel(Map<String, Object> searchContext) throws Exception {
        return specificationsDAO.getModel(searchContext);
    }
}

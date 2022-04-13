package com.group6.shopping.specifications.controllers;

import com.group6.shopping.boards.services.BoardsService;
import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.PagingVO;
import com.group6.shopping.likes.services.LikesService;
import com.group6.shopping.likes.vo.LikesVO;
import com.group6.shopping.models.services.ModelsService;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.security.CustomMemDetails;
import com.group6.shopping.specifications.services.SpecService;
import com.group6.shopping.specifications.vo.SearchSpecVO;
import com.group6.shopping.specifications.vo.SpecDisplayVO;
import com.group6.shopping.url.UrlHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.parser.Entity;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.util.*;

@Controller
@RequestMapping("/spec")
public class SpecController {

    @Autowired
    private SpecService specService;
    @Autowired
    private ModelsService modelsService;
    @Autowired
    private BoardsService boardsService;
    @Autowired
    private LikesService likesService;

    @RequestMapping("/viewModels")
    public String viewModels(HttpServletResponse response, Model models, String product) throws Exception {
        //List<SpecVO> specVOList = specService.getModels(product);

        List<SpecDisplayVO> modelNamesList = specService.getModelNames(product);
        if(modelNamesList.size() == 0){
            UrlHandler.alert(response, "Wrong Url");
            return "home";
        }
        List<SpecDisplayVO> specDisplayVOList = new ArrayList<SpecDisplayVO>();

        for(int i = 0; i < modelNamesList.size(); i++){
            String model = modelNamesList.get(i).getModel_name();
            int modelId = modelNamesList.get(i).getModel_id();
            int productId = modelNamesList.get(i).getProduct_id();

            SpecDisplayVO tmp = specService.getSpecDisplay(product, productId, model, modelId);

            specDisplayVOList.add(tmp);
        }

        models.addAttribute("specDisplayVOList",specDisplayVOList);

        return "/spec/viewModelList2";
        //return "spec/viewModelList";
    }

    @RequestMapping("/chooseModel")
    public String chooseModel(HttpServletResponse response, Model models, ModelsVO modelsVO, PagingVO pagingVO, String category, HttpSession session) throws Exception {
        ModelsVO mTmp = modelsService.getModel(modelsVO);

        if(mTmp == null){
            UrlHandler.alert(response, "Wrong Url");
            return "home";
        }

        SpecDisplayVO tmp = specService.getSpecDisplay(
                mTmp.getProductsVO().getProduct_name(), mTmp.getProduct_id(),
                mTmp.getModel_name(), mTmp.getModel_id()
        );
        models.addAttribute("specDisplayVO", tmp);

        int numOfBoards = boardsService.getNumOfBoards(modelsVO);
        PagingVO pTmp = new PagingVO(numOfBoards, pagingVO.getCurrPage());

        if(!pTmp.pageCheck()){
            models.addAttribute("pageError", "Page Number is not valid");
        }else{
            Map<String, String> cateMap = new HashMap<>();
            if(category.equals("new") || category.equals("old")){
                cateMap.put("field", "board_date");
                if(category.equals("new")){
                    cateMap.put("order", "desc");
                }else{
                    cateMap.put("order", "asc");
                }
            }else if(category.equals("high") || category.equals("low")){
                cateMap.put("field", "board_rate");
                if(category.equals("high")){
                    cateMap.put("order", "desc");
                }else{
                    cateMap.put("order", "asc");
                }
            }else{
                UrlHandler.alert(response, "Wrong Url");
                return "home";
            }

            List<BoardsVO> boardsVOList = boardsService.getModelBoards(modelsVO, pTmp, cateMap);
            List<Integer> numByRate = boardsService.numOfBoardRate(modelsVO);
            List<Integer> boardRateList = boardsService.boardRateList(modelsVO);

            Map<Integer, Integer> rateList = new LinkedHashMap<>();

            for(int i = 0; i < boardRateList.size(); i++){
                rateList.put(boardRateList.get(i),numByRate.get(i));
            }

            double avgRate = boardsService.avgOfBoardRate(modelsVO);
            int roundRate = (int) Math.round(avgRate);

            models.addAttribute("category", category);
            models.addAttribute("rateList", rateList);
            models.addAttribute("numOfBoards", numOfBoards);
            models.addAttribute("avgRate", avgRate);
            models.addAttribute("roundRate", roundRate);
            models.addAttribute("boardList", boardsVOList);
            models.addAttribute("page", pTmp);
        }

        //좋아요
        List<LikesVO> likeList = new ArrayList<LikesVO>();

        CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user");
        List<String> modelIdList = new ArrayList<String>();
        if(cs != null) {

        	likeList = likesService.getAlllikes(cs.getMem_id());
        	for(int i = 0; i < likeList.size(); i++) {

        		modelIdList.add( likeList.get(i).getModel_id() + "" );

        	}

        	if(modelIdList.size() > 0) {
        		models.addAttribute("modelIdList", modelIdList);
        	}
        }
        return "/spec/chooseModel2";
        //return "spec/chooseModel";
    }

    @RequestMapping("/searchItems")
    public String searchItems(String searchInput, Model models, HttpServletRequest request, HttpServletResponse response) throws Exception {
       // System.out.println("입력값: " + searchInput);

        Cookie[] cookies = request.getCookies();
        Map<String, String> cookiesMap = new LinkedHashMap<>();
        List<String> cookieKey = new ArrayList<>();

        for(Cookie c: cookies){
            cookiesMap.put(c.getName(), c.getValue());
            cookieKey.add(c.getName());
        }

        if(!cookieKey.contains("search1")){
            cookiesMap.put("search1", URLEncoder.encode(searchInput, "utf-8"));
        }else if(!cookieKey.contains("search2")){
            cookiesMap.put("search2", URLEncoder.encode(searchInput, "utf-8"));
        }else if(!cookieKey.contains("search3")){
            cookiesMap.put("search3", URLEncoder.encode(searchInput, "utf-8"));
        }else{
            String search3 = cookiesMap.get("search3");
            String search2 = cookiesMap.get("search2");

            cookiesMap.put("search1", search2);
            cookiesMap.put("search2", search3);
            cookiesMap.put("search3" ,URLEncoder.encode(searchInput, "utf-8"));
        }

        for(Map.Entry<String, String> tmp : cookiesMap.entrySet()){
            Cookie c = new Cookie(tmp.getKey(), tmp.getValue());
            c.setPath("/");
            c.setMaxAge(60*60*24*7);
            response.addCookie(c);
        }
        //찾아야하는 값 리스트
        SearchSpecVO searchSpecVO = specService.searchSpec();
        //검색어 정제
        Map<String, Object> searchContext = specService.getSearchContext(searchSpecVO, searchInput);

        int searchFail = 0;
        String searchResult;
        for(Map.Entry<String, Object> tmp : searchContext.entrySet()){
            List<String> list = (List<String>) tmp.getValue();
            if(list.size() == 0){
                searchFail++;
            }
        }
        if(searchFail == 7){
            models.addAttribute("resultNum", 0);
            models.addAttribute("searchFail", "No Search Result");
        }else{
            //검색 결과
            List<ModelsVO> resultModels = specService.getModel(searchContext);


            models.addAttribute("resultNum", resultModels.size());
            models.addAttribute("result", resultModels);
        }

        models.addAttribute("searchInput", searchInput);
        return "spec/searchItems2";
        //return "spec/searchItems";
    }
}

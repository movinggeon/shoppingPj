package com.group6.shopping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import com.group6.shopping.boards.services.BoardsService;
import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.likes.services.LikesService;
import com.group6.shopping.likes.vo.LikesVO;
import com.group6.shopping.models.services.ModelsService;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.specifications.services.SpecService;
import com.group6.shopping.specifications.vo.SearchSpecVO;
import com.group6.shopping.specifications.vo.SpecDisplayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.group6.shopping.carts.services.CartsService;

import java.util.*;

import com.group6.shopping.carts.services.CartsService;

/**
 * Handles requests for the application home page.
 */
@Controller

public class HomeController {

	@Autowired
	private SpecService specService;
	@Autowired
	private CartsService cartsService;
	@Autowired
	private ModelsService modelsService;
	@Autowired
	private LikesService likesService;
	@Autowired
	private BoardsService boardsService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model models, HttpServletRequest request, HttpSession session) throws Exception {
		/*System.out.println("home");*/
		List<ModelsVO> recommendations = new ArrayList<>();
		Cookie[] cookies = request.getCookies();
		Map<Integer, Integer> modelsCount = new HashMap<>();

		String searchInput;
		if(cookies != null){
			if(!cookies[0].getName().equals("JSESSIONID")){
				for(Cookie tmp : cookies){
					if(tmp.getName().equals("JSESSIONID")){
						continue;
					}
					SearchSpecVO searchSpecVO = specService.searchSpec();
					searchInput = tmp.getValue();
					Map<String, Object> searchContext = specService.getSearchContext(searchSpecVO, searchInput);
					List<ModelsVO> modelsVOList = specService.getModel(searchContext);
					recommendations.addAll(modelsVOList);
				}
				modelsCount = specService.orderByModelCount(recommendations);
			}
			recommendations.clear();
			for(Map.Entry<Integer, Integer> tmp : modelsCount.entrySet()){
				if(recommendations.size() == 5){ break; }
				ModelsVO mTmp = new ModelsVO();
				mTmp.setModel_id(tmp.getKey());
				recommendations.add(modelsService.getModel(mTmp));
			}
		}
		if(recommendations.size() < 5){
			int totalShow = 5 - recommendations.size();
			List<ModelsVO> popularItems = cartsService.getPopularItem(totalShow);
			recommendations.addAll(popularItems);
		}
		List<LikesVO> likesVOList = likesService.mostLikedList();
		if(likesVOList.size() > 0){
			session.setAttribute("likesList", likesVOList);
		}
		models.addAttribute("recommendList", recommendations);

		List<ModelsVO> brandNew = modelsService.getBrandNewModels();
		models.addAttribute("brandNew", brandNew);

		List<BoardsVO> eventList = boardsService.eventMainDisplay();
		models.addAttribute("eventList", eventList);
		return "home";
	}
}
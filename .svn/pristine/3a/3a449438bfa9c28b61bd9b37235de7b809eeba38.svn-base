package com.project.wine.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.vo.ResultMessageVO;
import com.project.exception.BizNotFoundException;
import com.project.login.vo.UserVO;
import com.project.wine.service.IWineService;
import com.project.wine.vo.WineSearchVO;
import com.project.wine.vo.WineVO;

@Controller
public class WineController {
	
	@Inject
	IWineService wineService;
	
	@RequestMapping("/wine/wineList.wow")
	public String wineList(Model model, @ModelAttribute("searchVO") WineSearchVO searchVO) {
		List<WineVO> wineList = wineService.getWineList(searchVO);
		model.addAttribute("wineList", wineList);
		return "wine/wineList";
	}
	
	@RequestMapping("/wine/wineView.wow")
	public String wineView(Model model, int wineNo,HttpSession session) {
		try {
			WineVO wine = wineService.getWine(wineNo);
			System.out.println(wine);
			UserVO user=(UserVO)session.getAttribute("USER_INFO");
			if(user != null) {
				wine.setsMemId(user.getUserId());
			} else {
				wine.setsMemId("85912sahdajsh12");
			}
			wineService.registRecommend(wine);
			model.addAttribute("wine", wine);
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessage = new ResultMessageVO();
			resultMessage.messageSetting(false, "와인 찾기 실패", "해당 와인을 찾는데 실패했습니다. 해당 와인이 없습니다.", "/wine/wineList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessage);
			return "common/message";
		}
		return "wine/wineView";
	}
	
	
	/*
	 * @PostMapping(value = "/wine/wineListMore",
	 * produces="application/json;charset=UTF-8")
	 * 
	 * @ResponseBody public Map<String, Object> wineListMore(WineSearchVO searchVO)
	 * { System.out.println("더보기:::"+searchVO); List<WineVO> wineList =
	 * wineService.getWineListMore(searchVO); Map<String, Object> map = new
	 * HashMap<String, Object>(); map.put("result", true); map.put("data",
	 * wineList); map.put("size", wineList.size()); return map; }
	 */
	
	@PostMapping(value = "/wine/wineFilterList", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> wineFilterList(WineSearchVO searchVO) {
		System.out.println("필터:::"+searchVO);
		List<WineVO> wineList = wineService.getWineFilterList(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", wineList);
		map.put("size", wineList.size());
		return map;
	}
	
	@RequestMapping(value="/wine/viewRecommend", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String,Object> viewRecommend(Model model, int wineNo) {
		List<WineVO> list = wineService.getViewRecommend(wineNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		model.addAttribute(map);
		System.out.println(map);
		System.out.println(list);
		return map;
	}
	
	
	
	
	
}

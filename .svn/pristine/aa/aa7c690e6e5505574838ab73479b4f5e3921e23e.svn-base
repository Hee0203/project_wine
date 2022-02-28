package com.project.main.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.comm.service.ICommService;
import com.project.comm.vo.CommSearchVO;
import com.project.comm.vo.CommVO;
import com.project.member.vo.MemberVO;
import com.project.wine.dao.IWineDao;
import com.project.wine.service.IWineService;
import com.project.wine.vo.WineVO;

@Controller
public class HomeController {
	
	@Inject
	IWineService wineService;
	
	@Inject
	ICommService commService;
	
	@RequestMapping("/main/home.wow")
	public String home() {
		return "main/home";
	}
	
	@RequestMapping(value="/main/recommendList", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String,Object> recommendList(WineVO sMemId, Model model) {
		List<WineVO> list = wineService.getRecommendList(sMemId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		model.addAttribute(map);
		System.out.println(map);
		System.out.println(list);
		return map;
	}
	
	@RequestMapping(value="/main/notLoginRecommendList", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String,Object> notLoginRecommendList(Model model) {
		List<WineVO> list = wineService.getNotLoginRecommend();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		model.addAttribute(map);
		System.out.println(map);
		System.out.println(list);
		return map;
	}
	
	@RequestMapping(value="/main/crawling", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> crawling(Model model) throws IOException{
		String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%EC%99%80%EC%9D%B8";
		Document doc = Jsoup.connect(url).get(); 
		
		Elements listNews = doc.getElementsByAttributeValue("class", "news_area");
		Elements title = (Elements)listNews.select(".news_tit");
		
		Map<String,Object> newsList = new HashMap<String, Object>();
		
		List<String> titleList = new ArrayList<String>();
		List<String> hrefList = new ArrayList<String>();
		
		for(Element e : title) {
			titleList.add(e.text());
			hrefList.add(e.attr("href"));
		}
		newsList.put("href", hrefList);
		newsList.put("title", titleList);
		
		model.addAttribute(newsList);
		
		return newsList;
	}
	
	@RequestMapping(value="/main/mainCommList", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> mainComm(Model model,@ModelAttribute("searchVO") CommSearchVO searchVO) throws IOException{
		List<CommVO> commList = commService.getCommList(searchVO);
		model.addAttribute(commList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commList",commList);
		return map;
	}

	
}

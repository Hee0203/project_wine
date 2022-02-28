package com.project.wine.service;

import java.util.List;

import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.wine.vo.WineSearchVO;
import com.project.wine.vo.WineVO;

public interface IWineService {
	
	public List<WineVO> getWineList(WineSearchVO searchVO);

	public WineVO getWine(int WineNo) throws BizNotFoundException;
	
	public List<WineVO> getRecommendList(WineVO sMemId);
	
	public void registRecommend(WineVO sMemId);
	
	/* public List<WineVO> getWineListMore(WineSearchVO searchVO); */
	
	public List<WineVO> getNotLoginRecommend();
	
	public List<WineVO> getWineFilterList(WineSearchVO searchVO);
	
	public List<WineVO> getViewRecommend(int wineNo);

}

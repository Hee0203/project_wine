package com.project.wine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.wine.vo.WineSearchVO;
import com.project.wine.vo.WineVO;

@Mapper
public interface IWineDao {
	
	public List<WineVO> getWineList(WineSearchVO searchVO);
	public int getTotalRowCount(WineSearchVO searchVO);	
	public WineVO getWine(int wineNo);  
	public List<WineVO> getRecommendList(WineVO sMemId);
	public int insertRecommend(WineVO sMemId);
	public int updateRecommend(WineVO sMemId);
	public String getWineRecommend(String sMemId);
	
	public List<WineVO> getWineListMore(WineSearchVO searchVO);
	public List<WineVO> getNotLoginRecommend();
	
	public List<WineVO> getWineFilterList(WineSearchVO searchVO);
	
	public List<WineVO> getViewRecommend(int wineNo);
}

package com.project.wine.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.exception.BizNotFoundException;
import com.project.wine.dao.IWineDao;
import com.project.wine.vo.WineSearchVO;
import com.project.wine.vo.WineVO;

@Service
public class WineServiceImpl implements IWineService{
	
	@Inject
	IWineDao wineDao;

	@Override
	public List<WineVO> getWineList(WineSearchVO searchVO) {
		int totalRowCount = wineDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		System.out.println(searchVO);
		return wineDao.getWineList(searchVO);
	}

	@Override
	public WineVO getWine(int wineNo) throws BizNotFoundException {
		WineVO wine = wineDao.getWine(wineNo);
		if(wine == null) throw new BizNotFoundException();
		return wine;
	}
	
	@Override
	public List<WineVO> getRecommendList(WineVO sMemId){
		System.out.println(sMemId);
		return wineDao.getRecommendList(sMemId);
	}
	
	@Override
	public void registRecommend(WineVO sMemId) {
		System.out.println(sMemId);
		String exist = wineDao.getWineRecommend(sMemId.getsMemId());
		if(exist==null) {
			wineDao.insertRecommend(sMemId);			
		}else {
			wineDao.updateRecommend(sMemId);			
		}
	}
	
	/*
	 * @Override public List<WineVO> getWineListMore(WineSearchVO searchVO) { int
	 * totalRowCount = wineDao.getTotalRowCount(searchVO);
	 * searchVO.setTotalRowCount(totalRowCount); searchVO.pageSetting();
	 * List<WineVO> wineList = wineDao.getWineListMore(searchVO); return wineList; }
	 */

	@Override
	public List<WineVO> getNotLoginRecommend() {
		return wineDao.getNotLoginRecommend();
	}

	@Override
	public List<WineVO> getWineFilterList(WineSearchVO searchVO) {
		int totalRowCount = wineDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		System.out.println("wineFilterList:::"+searchVO);
		return wineDao.getWineFilterList(searchVO);
	}

	@Override
	public List<WineVO> getViewRecommend(int wineNo) {
		return wineDao.getViewRecommend(wineNo);
	}



}

package com.project.qa.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.exception.BizPasswordNotMatchedException;
import com.project.qa.vo.QaSearchVO;
import com.project.qa.vo.QaVO;

public interface IQaService {

	public List<QaVO> getQaList(QaSearchVO searchVO);

	public QaVO getQa(int qaNo) throws BizNotFoundException;
	
	public void increaseHit(int qaNo) throws BizNotEffectedException;
	
	public void modifyQa(QaVO qa) 
			throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
	public void removeQa(QaVO qa)
			throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
	public void registQa(QaVO qa) throws BizNotEffectedException;

	public List<QaVO> getselectQaList(QaSearchVO searchVO);
}

package com.project.comm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.comm.vo.CommSearchVO;
import com.project.comm.vo.CommVO;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.exception.BizPasswordNotMatchedException;


public interface ICommService {

	public List<CommVO> getCommList(CommSearchVO searchVO);

	public CommVO getComm(int commNo) throws BizNotFoundException;
	
	public void increaseHit(int commNo) throws BizNotEffectedException;
	
	public void modifyComm(CommVO comm) 
			throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
	public void removeComm(CommVO comm)
			throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
	public void registComm(CommVO comm) throws BizNotEffectedException;

	public List<CommVO> getselectCommList(CommSearchVO searchVO);
}

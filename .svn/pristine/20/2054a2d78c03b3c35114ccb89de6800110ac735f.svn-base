package com.project.qaattach.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.exception.BizException;
import com.project.exception.BizNotFoundException;
import com.project.qaattach.dao.IQaAttachDao;
import com.project.qaattach.vo.QaAttachVO;

@Service
public class QaAttachServiceImpl implements IQaAttachService {
	
	@Autowired
	private IQaAttachDao qaAttachDao;

	@Override
	public QaAttachVO getAttach(int atchNo) throws BizException {
		QaAttachVO vo = qaAttachDao.getAttach(atchNo);
		if(vo == null) {
			throw new BizNotFoundException();
		}
		return vo;
	}

	@Override
	public void increaseDownHit(int atchNo) throws BizException {
		qaAttachDao.increaseDownHit(atchNo);
		
	}
	
	
}

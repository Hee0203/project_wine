package com.project.attach.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.attach.dao.IAttachDao;
import com.project.attach.vo.AttachVO;
import com.project.exception.BizException;
import com.project.exception.BizNotFoundException;

@Service
public class AttachServiceImpl implements IAttachService{
	
	@Inject
	IAttachDao attachDao;
	
	@Override
	public AttachVO getAttach(int atchNo) throws BizException {
		
		AttachVO vo = attachDao.getAttach(atchNo);
		if(vo == null) {
			throw new BizNotFoundException();
		}
		return vo;
	}

	@Override
	public void increaseDownHit(int atchNo) throws BizException {
		// TODO Auto-generated method stub
		
	}

}

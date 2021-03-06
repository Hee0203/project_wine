package com.project.qa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.attach.dao.IAttachDao;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.exception.BizPasswordNotMatchedException;
import com.project.qa.dao.IQaDao;
import com.project.qa.vo.QaSearchVO;
import com.project.qa.vo.QaVO;
import com.project.qaattach.dao.IQaAttachDao;
import com.project.qaattach.vo.QaAttachVO;

@Service
public class QaServiceImpl implements IQaService {
	
	@Inject
	IQaDao qaDao;
	
	@Inject
	IQaAttachDao qaAttachDao;
	

	@Override
	public List<QaVO> getQaList(QaSearchVO searchVO) {
		int totalRowCount = qaDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return qaDao.getqaList(searchVO);
	}
	
	@Override
	public QaVO getQa(int qaNo) throws BizNotFoundException {
		QaVO qa = qaDao.getQa(qaNo);
		if(qa == null) throw new BizNotFoundException();
		return qa;
	}

	@Override
	public void increaseHit(int qaNo) throws BizNotEffectedException {
		int cnt = qaDao.increaseHit(qaNo);
		if(cnt == 0) throw new BizNotEffectedException();
		
	}

	@Override
	public void modifyQa(QaVO qa) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		QaVO qaVo = qaDao.getQa(qa.getQaNo());
		if(qaVo == null) throw new BizNotFoundException();
		if(qa.getQaPass().equals(qaVo.getQaPass())) {
			int cnt = qaDao.updateQa(qa);
			if(cnt == 0) throw new BizNotEffectedException();
			
			List<QaAttachVO> attaches = qa.getAttaches();
			if(attaches != null) {
				for(QaAttachVO attach : attaches) {
					attach.setAtchParentNo(qa.getQaNo());
					qaAttachDao.insertAttach(attach);
				}
			}
			
			int delAtchNos[] = qa.getDelAtachNos();
			if(delAtchNos != null) {
				qaAttachDao.deleteAttaches(delAtchNos);
				System.out.println("삭제");
			}
			
		} else {
			throw new BizPasswordNotMatchedException();
		}
		
	}

	@Override
	public void removeQa(QaVO qa) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		QaVO qaVo = qaDao.getQa(qa.getQaNo()); //vo에 db에 있는 데이터를 받아온다.
		if(qaVo == null) throw new BizNotFoundException();
		if(qa.getQaPass().equals(qaVo.getQaPass())) {
			int cnt = qaDao.deleteQa(qa);
		} else {
			throw new BizPasswordNotMatchedException();
		}
	}

	@Override
	public void registQa(QaVO qa) throws BizNotEffectedException {
		int cnt = qaDao.insertQa(qa);
		if(cnt == 0) throw new BizNotEffectedException();
		List<QaAttachVO> attaches = qa.getAttaches();
		for(QaAttachVO attach : attaches) {
			attach.setAtchParentNo(qa.getQaNo());
			qaAttachDao.insertAttach(attach);
		}
	}
	
	@Override
	public List<QaVO> getselectQaList(QaSearchVO searchVO) {
		int totalRowCount = qaDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		System.out.println("service123123:::"+searchVO);
		List<QaVO> qaList = qaDao.selectQaList(searchVO);
		return qaList;
	}
	
}

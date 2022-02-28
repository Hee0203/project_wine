package com.project.comm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.attach.dao.IAttachDao;
import com.project.attach.vo.AttachVO;
import com.project.comm.dao.ICommDao;
import com.project.comm.vo.CommSearchVO;
import com.project.comm.vo.CommVO;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.exception.BizPasswordNotMatchedException;

@Service
public class CommServiceImpl implements ICommService {
	
	@Inject
	ICommDao commDao;
	
	@Inject
	IAttachDao attachDao;
	
	
	@Override
	public List<CommVO> getCommList( CommSearchVO searchVO) {

		int totalRowCount = commDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		List<CommVO> commList = commDao.getCommList(searchVO);
		
		
		return commList;
	}

	@Override
	public CommVO getComm(int commNo) throws BizNotFoundException {
		CommVO commVO = commDao.getComm(commNo);
		if(commVO == null) throw new BizNotFoundException();
		return commVO;
	}

	@Override
	public void increaseHit(int commNo) throws BizNotEffectedException {
		int cnt = commDao.increaseHit(commNo);
		if(cnt == 0) throw new BizNotEffectedException();
	}

	@Override
	public void modifyComm(CommVO comm)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		CommVO commvo = commDao.getComm(comm.getCommNo());
		if(commvo == null) 
			throw new BizNotFoundException();
		if(comm.getCommPass().equals(commvo.getCommPass())) {
			int cnt = commDao.updateComm(comm);
			if(cnt == 0) {
				throw new BizNotFoundException();
			}
			List<AttachVO> attaches = comm.getAttaches();
			for(AttachVO attach : attaches) {
				System.out.println(attach);
				attach.setAtchParentNo(comm.getCommNo());
				attachDao.insertAttach(attach);
			}
			
			int delAtchNos[] = comm.getDelAtchNos();
			if(delAtchNos != null) {
				attachDao.deleteAttaches(delAtchNos);
				System.out.println("삭제");
			}
			
		}else {
			throw new BizPasswordNotMatchedException();
		}
	}
	@Override
	public void removeComm(CommVO comm)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		CommVO commvo = commDao.getComm(comm.getCommNo());
		if(commvo == null) 
			throw new BizNotFoundException();
		if(comm.getCommPass().equals(commvo.getCommPass())) {
			int cnt = commDao.deleteComm(comm);
			if(cnt == 0) 
				throw new BizNotFoundException();
		}else {
			throw new BizPasswordNotMatchedException();
		}
	}

	@Override
	public void registComm(CommVO comm) throws BizNotEffectedException {
		int cnt = commDao.insertComm(comm);
//		System.out.println(comm);
		if(cnt == 0) 
			throw new BizNotEffectedException();
		List<AttachVO> attaches = comm.getAttaches();
		for(AttachVO attach : attaches) {
			attach.setAtchParentNo(comm.getCommNo());
			attachDao.insertAttach(attach);
		}
	}

	@Override
	public List<CommVO> getselectCommList(CommSearchVO searchVO) {
		int totalRowCount = commDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		System.out.println("service123123:::"+searchVO);
		List<CommVO> commList = commDao.selectCommList(searchVO);
		System.out.println("service:::"+commList);
		return commList;
	}
	
}

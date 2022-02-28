package com.project.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.exception.BizAccessFailException;
import com.project.exception.BizNotFoundException;
import com.project.reply.dao.IReplyDao;
import com.project.reply.vo.ReplySearchVO;
import com.project.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements IReplyService{

	@Inject
	IReplyDao replyDao;
	
	@Override
	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO) {
		int totalRowCount = replyDao.getReplyCountByParent(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		List<ReplyVO> replyList = replyDao.getReplyListByParent(searchVO);
				
		return replyList;
	}

	@Override
	public void registReply(ReplyVO reply) {
		replyDao.insertReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException{
		// DB에 있는 값 vo
		ReplyVO vo = replyDao.getReply(reply.getReNo());
		// 사용자가 없을 때 BNFException
		if(vo == null) throw new BizNotFoundException();
		// 사용자가 다를 때 BAFException
		if(!vo.getReMemId().equals(reply.getReMemId())) throw new BizAccessFailException();
		
		replyDao.updateReply(reply);
	}

	@Override
	public void removeReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException{
		// DB에 있는 값 vo
		ReplyVO vo = replyDao.getReply(reply.getReNo());
		// 사용자가 없을 때 BNFException
		if(vo == null) throw new BizNotFoundException();
		// 사용자가 다를 때 BAFException
		if(!vo.getReMemId().equals(reply.getReMemId())) throw new BizAccessFailException();
		
		replyDao.deleteReply(reply);
	}

}

package com.project.reply.service;

import java.util.List;

import com.project.exception.BizAccessFailException;
import com.project.exception.BizNotFoundException;
import com.project.reply.vo.ReplySearchVO;
import com.project.reply.vo.ReplyVO;

public interface IReplyService {
	
	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO);
	
	public void registReply(ReplyVO reply);
	
	public void modifyReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException;
	
	public void removeReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException;
	
}

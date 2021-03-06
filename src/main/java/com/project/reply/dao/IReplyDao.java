package com.project.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.reply.vo.ReplyVO;

import com.project.reply.vo.ReplySearchVO;

@Mapper
public interface IReplyDao {
	public int getReplyCountByParent(ReplySearchVO searchVO);

	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO);

	public ReplyVO getReply(String reNo);

	public int updateReply(ReplyVO reply);

	public int deleteReply(ReplyVO reply);

	public int insertReply(ReplyVO reply);
}

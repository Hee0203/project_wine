package com.project.comm.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.project.comm.vo.CommSearchVO;
import com.project.comm.vo.CommVO;

@Mapper
public interface ICommDao {

	public List<CommVO> getCommList(CommSearchVO searchVO);
	public int getTotalRowCount(CommSearchVO searchVO);
	public CommVO getComm(int commNo);
	public int increaseHit(int commNo);
	public int updateComm(CommVO comm);
	public int deleteComm(CommVO comm);
	public int insertComm(CommVO comm);
	public List<CommVO> selectCommList(CommSearchVO searchVO);

}

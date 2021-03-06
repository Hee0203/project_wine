package com.project.qa.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.qa.vo.QaSearchVO;
import com.project.qa.vo.QaVO;

@Mapper
public interface IQaDao {

	public List<QaVO> getqaList(QaSearchVO searchVO);

	public int getTotalRowCount(QaSearchVO searchVO);

	public QaVO getQa(int qaNo);

	public int increaseHit(int qaNo);

	public int updateQa(QaVO qa);

	public int deleteQa(QaVO qa);

	public int insertQa(QaVO qa);

	public List<QaVO> selectQaList(QaSearchVO searchVO);

}

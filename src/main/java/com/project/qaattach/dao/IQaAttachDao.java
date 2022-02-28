package com.project.qaattach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.qaattach.vo.QaAttachVO;

@Mapper
public interface IQaAttachDao {
	/** 첨부파일 등록 */
	public int insertAttach(QaAttachVO attach);

	/** 첨부파일 삭제 */
	public int deleteAttach(int atchNo);

	/** 첨부파일 삭제(여러개) */
	public int deleteAttaches(int[] atchNos);

	/** 첨부파일 상세 조회 */
	public QaAttachVO getAttach(int atchNo);

	/** 부모번호에 따른 목록 조회 */
	public List<QaAttachVO> getQaAttachByParentNoList(QaAttachVO attach);

	/** 다운로드 횟수 증가 */
	public int increaseDownHit(int atchNo);
}

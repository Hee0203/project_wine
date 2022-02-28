package com.project.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ReplyVO {
	private String reNo;                     /* 댓글 번호 */  
	private String reCategory;            /* 분류 (COMMUNITY, Q&A)*/  
	private int reParentNo;               /* 부모 번호 */  
	private String reMemId;               /* 작성자 아이디 */  
	private String reContent;             /* 댓글 내용 */  
	private String reRegDate;             /* 댓글 등록 시간 */  
	private String reMoeDate;			   /* 댓글 수정 시간 */
	private String reMemName;					/* 관리자 이름 쓰려고 만든 이름 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	public String getReNo() {
		return reNo;
	}
	public void setReNo(String reNo) {
		this.reNo = reNo;
	}
	public String getReCategory() {
		return reCategory;
	}
	public void setReCategory(String reCategory) {
		this.reCategory = reCategory;
	}
	public int getReParentNo() {
		return reParentNo;
	}
	public void setReParentNo(int reParentNo) {
		this.reParentNo = reParentNo;
	}
	public String getReMemId() {
		return reMemId;
	}
	public void setReMemId(String reMemId) {
		this.reMemId = reMemId;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getReRegDate() {
		return reRegDate;
	}
	public void setReRegDate(String reRegDate) {
		this.reRegDate = reRegDate;
	}
	public String getReMoeDate() {
		return reMoeDate;
	}
	public void setReMoeDate(String reMoeDate) {
		this.reMoeDate = reMoeDate;
	}
	public String getReMemName() {
		return reMemName;
	}
	public void setReMemName(String reMemName) {
		this.reMemName = reMemName;
	}       
	
	
	
	
}

package com.project.comm.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.project.attach.vo.AttachVO;

public class CommVO {
	private int commNo;         			/* 커뮤니티 글 번호*/            
	private String commTitle;             /* 커뮤니티 글 제목*/
	private String memId;					/* 작성자 */
	private String commPass;              /* 커뮤니티 글 비밀번호*/
	private String commContent;           /* 커뮤니티 글 내용 */
	private String commRegDate;           /* 커뮤니티 글 등록 시간 */
	private String commModDate;           /* 커뮤니티 글 수정 시간 */
	private int commHit;                  /* 커뮤니티 글 조회수*/
	private String commDelYn;             /* 커뮤니티 글 삭제여부*/
	
	private List<AttachVO> attaches;
	
	private int[] delAtchNos;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	public int getCommNo() {
		return commNo;
	}
	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}
	public String getCommTitle() {
		return commTitle;
	}
	public void setCommTitle(String commTitle) {
		this.commTitle = commTitle;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getCommPass() {
		return commPass;
	}
	public void setCommPass(String commPass) {
		this.commPass = commPass;
	}
	public String getCommContent() {
		return commContent;
	}
	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}
	public String getCommRegDate() {
		return commRegDate;
	}
	public void setCommRegDate(String commRegDate) {
		this.commRegDate = commRegDate;
	}
	public String getCommModDate() {
		return commModDate;
	}
	public void setCommModDate(String commModDate) {
		this.commModDate = commModDate;
	}
	public int getCommHit() {
		return commHit;
	}
	public void setCommHit(int commHit) {
		this.commHit = commHit;
	}
	public String getCommDelYn() {
		return commDelYn;
	}
	public void setCommDelYn(String commDelYn) {
		this.commDelYn = commDelYn;
	}
	public List<AttachVO> getAttaches() {
		return attaches;
	}
	public void setAttaches(List<AttachVO> attaches) {
		this.attaches = attaches;
	}
	public int[] getDelAtchNos() {
		return delAtchNos;
	}
	public void setDelAtchNos(int[] delAtchNos) {
		this.delAtchNos = delAtchNos;
	}

	
	
}

package com.project.qa.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.project.qaattach.vo.QaAttachVO;

public class QaVO {
	private int qaNo;          			 /* 질의 글 번호 */
	private String qaMemId;             /* 회원 아이디 */
	private String qaMemName;           /* 회원 이름 */
	private String qaTitle;             /* 질의 글 제목 */
	private String qaPass;              /* 질의 글 비밀번호 */
	private String qaContent;           /* 질의 글 내용 */
	private String qaRegDate;           /* 질의 글 등록일자 */
	private int qaHit;                  /* 질의 글 조회수 */
	private String qaDelYn;             /* 질의 글 삭제 여부*/
	
	private List<QaAttachVO> attaches;	 /* 첨부파일 */
	
	
	private int[] delAtachNos;	 		 /* 첨부파일 삭제 여부? */
	
	public int getQaNo() {
		return qaNo;
	}
	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}
	public String getQaMemId() {
		return qaMemId;
	}
	public void setQaMemId(String qaMemId) {
		this.qaMemId = qaMemId;
	}
	public String getQaMemName() {
		return qaMemName;
	}
	public void setQaMemName(String qaMemName) {
		this.qaMemName = qaMemName;
	}
	public String getQaTitle() {
		return qaTitle;
	}
	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public String getQaPass() {
		return qaPass;
	}
	public void setQaPass(String qaPass) {
		this.qaPass = qaPass;
	}
	public String getQaContent() {
		return qaContent;
	}
	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}
	public String getQaRegDate() {
		return qaRegDate;
	}
	public void setQaRegDate(String qaRegDate) {
		this.qaRegDate = qaRegDate;
	}
	public int getQaHit() {
		return qaHit;
	}
	public void setQaHit(int qaHit) {
		this.qaHit = qaHit;
	}
	public String getQaDelYn() {
		return qaDelYn;
	}
	public void setQaDelYn(String qaDelYn) {
		this.qaDelYn = qaDelYn;
	}
	public List<QaAttachVO> getAttaches() {
		return attaches;
	}
	public void setAttaches(List<QaAttachVO> attaches) {
		this.attaches = attaches;
	}
	public int[] getDelAtachNos() {
		return delAtachNos;
	}
	public void setDelAtachNos(int[] delAtachNos) {
		this.delAtachNos = delAtachNos;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	
}

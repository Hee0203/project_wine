package com.project.code.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CodeVO {
	private String cd;             /* 코드 */         
	private String nmKo;           /* 코드명(한글) */     
	private String nmEn;           /* 코드명(영어) */     
	private String parent;         /* 부모 코드 */
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
	}
	public String getNmKo() {
		return nmKo;
	}
	public void setNmKo(String nmKo) {
		this.nmKo = nmKo;
	}
	public String getNmEn() {
		return nmEn;
	}
	public void setNmEn(String nmEn) {
		this.nmEn = nmEn;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	
	
	
}

package com.project.wine.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.project.common.vo.PagingVO;

public class WineSearchVO extends PagingVO{
	private String searchWord;
	private String searchType;
	private String[] searchCd;
	private String searchAcid;
	private String searchSweet;
	private String searchBody;
	private int searchPrice;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public String[] getSearchCd() {
		return searchCd;
	}
	
	public void setSearchCd(String[] searchCd) {
		this.searchCd = searchCd;
	}

	public String getSearchAcid() {
		return searchAcid;
	}

	public void setSearchAcid(String searchAcid) {
		this.searchAcid = searchAcid;
	}

	public String getSearchSweet() {
		return searchSweet;
	}

	public void setSearchSweet(String searchSweet) {
		this.searchSweet = searchSweet;
	}

	public String getSearchBody() {
		return searchBody;
	}

	public void setSearchBody(String searchBody) {
		this.searchBody = searchBody;
	}

	public int getSearchPrice() {
		return searchPrice;
	}

	public void setSearchPrice(int searchPrice) {
		this.searchPrice = searchPrice;
	}
		
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
}

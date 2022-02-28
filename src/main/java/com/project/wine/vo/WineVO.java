package com.project.wine.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class WineVO {
	private int wineNo;                     
	private String wineCd;                  
	private String wineKo;                  
	private String wineEn;                  
	private String winePrice;               
	private String wineMl;                  
	private String wineImg;                 
	private String wineNation;
	               
	private String wineAcid;                
	private String wineSweet;               
	private String wineBody;                
	private String wineAroma;      
	
	private String sMemId;
	private int sWineNo;
		
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public String getWineAcid() {
		return wineAcid;
	}
	public void setWineAcid(String wineAcid) {
		this.wineAcid = wineAcid;
	}
	public String getWineSweet() {
		return wineSweet;
	}
	public void setWineSweet(String wineSweet) {
		this.wineSweet = wineSweet;
	}
	public String getWineBody() {
		return wineBody;
	}
	public void setWineBody(String wineBody) {
		this.wineBody = wineBody;
	}
	public String getWineAroma() {
		return wineAroma;
	}
	public void setWineAroma(String wineAroma) {
		this.wineAroma = wineAroma;
	}
	
	
	public int getWineNo() {
		return wineNo;
	}
	public void setWineNo(int wineNo) {
		this.wineNo = wineNo;
	}
	public String getWineCd() {
		return wineCd;
	}
	public void setWineCd(String wineCd) {
		this.wineCd = wineCd;
	}
	public String getWineKo() {
		return wineKo;
	}
	public void setWineKo(String wineKo) {
		this.wineKo = wineKo;
	}
	public String getWineEn() {
		return wineEn;
	}
	public void setWineEn(String wineEn) {
		this.wineEn = wineEn;
	}
	public String getWinePrice() {
		return winePrice;
	}
	public void setWinePrice(String winePrice) {
		this.winePrice = winePrice;
	}
	public String getWineMl() {
		return wineMl;
	}
	public void setWineMl(String wineMl) {
		this.wineMl = wineMl;
	}
	public String getWineImg() {
		return wineImg;
	}
	public void setWineImg(String wineImg) {
		this.wineImg = wineImg;
	}
	public String getWineNation() {
		return wineNation;
	}
	public void setWineNation(String wineNation) {
		this.wineNation = wineNation;
	}
	
	
	public String getsMemId() {
		return sMemId;
	}
	public void setsMemId(String sMemId) {
		this.sMemId = sMemId;
	}
	public int getsWineNo() {
		return sWineNo;
	}
	public void setsWineNo(int sWineNo) {
		this.sWineNo = sWineNo;
	}              
	
	

}

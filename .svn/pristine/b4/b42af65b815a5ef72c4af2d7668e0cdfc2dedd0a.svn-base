package com.project.member.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.project.common.valid.Modify;
import com.project.common.valid.Step1;
import com.project.common.valid.Step2;
import com.project.common.valid.Step3;

public class MemberVO {
	
	@NotEmpty(groups = {Modify.class, Step2.class}, message = "ID는 필수입니다")
	private String memId;     		/* 회원 아이디 */ 
	
	@NotEmpty(groups = {Modify.class, Step2.class}, message = "비밀번호는 필수입니다")
	private String memPass;         /* 회원 비밀번호 */
	
	@NotEmpty(groups = {Modify.class, Step2.class}, message = "이름은 필수입니다")
	private String memName;         /* 회원 이름 */

	@NotEmpty(groups = {Modify.class, Step3.class}, message = "생년월일은 필수입니다")
	private String memBir;          /* 회원 생일 */
	
	@NotEmpty(groups = {Modify.class, Step3.class}, message = "전화번호는 필수입니다")
	private String memHp;           /* 회원 휴대폰번호 */

	@NotEmpty(groups = {Modify.class, Step3.class}, message = "우편번호는 필수입니다")
	private String memZip;          /* 회원 우편번호 */
	
	private String memAdd1;         /* 회원 집주소 1*/
	@NotEmpty(groups = {Modify.class, Step3.class}, message = "집주소는 필수입니다")
	private String memAdd2;         /*회원 집 상세 주소 */
	
	@NotEmpty(groups = {Modify.class, Step2.class}, message = "이메일은 필수입니다")
	@Email(groups = {Modify.class, Step2.class}, message = "이메일 형식에 맞춰주세요")
	private String memMail;         /* 회원 이메일 */
	
	@NotEmpty(groups = {Modify.class, Step3.class}, message = "체크해주세요")
	private String memDrink;        /* 회원 와인 먹는 횟수 */
	
	@NotEmpty(groups = {Modify.class, Step3.class}, message = "체크해주세요")
	private String memAnn;          /* 회원 어떤 날에 와인 먹는지 ? */
	
	private String memJoin;			/* 가입일 */
	private String memDelYn;			/* 회원 탈퇴 여부 */
	private String memRole;         /* 관리자 회원 구분*/
	
	
	//join
	@NotEmpty(groups = {Step1.class}, message = "이용약관 동의는 필수입니다.")
	private String agreeYn;			/* 동의 여부*/
	@NotEmpty(groups = {Step1.class}, message = "이용약관 동의는 필수입니다.")
	private String privacyYn;		/* 개인정보 동의 여부 */
	
	private String eventYn;			/* 이벤트 동의 여부 */
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemBir() {
		return memBir;
	}
	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}
	public String getMemHp() {
		return memHp;
	}
	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}
	public String getMemZip() {
		return memZip;
	}
	public void setMemZip(String memZip) {
		this.memZip = memZip;
	}
	public String getMemAdd1() {
		return memAdd1;
	}
	public void setMemAdd1(String memAdd1) {
		this.memAdd1 = memAdd1;
	}
	public String getMemAdd2() {
		return memAdd2;
	}
	public void setMemAdd2(String memAdd2) {
		this.memAdd2 = memAdd2;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public String getMemDrink() {
		return memDrink;
	}
	public void setMemDrink(String memDrink) {
		this.memDrink = memDrink;
	}
	public String getMemAnn() {
		return memAnn;
	}
	public void setMemAnn(String memAnn) {
		this.memAnn = memAnn;
	}
	public String getAgreeYn() {
		return agreeYn;
	}
	public void setAgreeYn(String agreeYn) {
		this.agreeYn = agreeYn;
	}
	public String getPrivacyYn() {
		return privacyYn;
	}
	public void setPrivacyYn(String privacyYn) {
		this.privacyYn = privacyYn;
	}
	public String getEventYn() {
		return eventYn;
	}
	public void setEventYn(String eventYn) {
		this.eventYn = eventYn;
	}
	public String getMemJoin() {
		return memJoin;
	}
	public void setMemJoin(String memJoin) {
		this.memJoin = memJoin;
	}
	public String getMemDelYn() {
		return memDelYn;
	}
	public void setMemDelYn(String memDelYn) {
		this.memDelYn = memDelYn;
	}
	public String getMemRole() {
		return memRole;
	}
	public void setMemRole(String memRole) {
		this.memRole = memRole;
	}
	
	
	
}

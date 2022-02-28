package com.project.member.service;

import java.util.List;

import com.project.exception.BizDuplicateKeyException;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.member.vo.MemberSearchVO;
import com.project.member.vo.MemberVO;

public interface IMemberService {
	
	public List<MemberVO> getMemberList(MemberSearchVO searchVO);
	public MemberVO getMember(String memId) throws BizNotFoundException ;
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException ;	
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException;
	public void registMember(MemberVO member) throws BizNotEffectedException,BizDuplicateKeyException;
	
	public String findId(MemberVO member);
	public String findPw(MemberVO member);

}

package com.project.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.member.vo.MemberVO;
import com.project.member.vo.MemberSearchVO;

@Mapper
public interface IMemberDao {
	public List<MemberVO> getMemberList(MemberSearchVO searchVO);
	public int getTotalRowCount(MemberSearchVO searchVO);
	public MemberVO getMember(String memId);
	public int updateMember(MemberVO member);
	public int deleteMember(MemberVO member);
	public int insertMember(MemberVO member);
	
	public String findId(MemberVO member);
	public String findPw(MemberVO member);
}

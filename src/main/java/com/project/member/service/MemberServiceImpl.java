package com.project.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.comm.dao.ICommDao;
import com.project.exception.BizDuplicateKeyException;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.member.dao.IMemberDao;
import com.project.member.vo.MemberSearchVO;
import com.project.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService{

	@Inject
	IMemberDao memberDao;
	
	@Inject
	ICommDao commDao;
	
	@Override
	public List<MemberVO> getMemberList(MemberSearchVO searchVO) {
		int totalRowCount = memberDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		return memberDao.getMemberList(searchVO);
	}

	@Override
	public MemberVO getMember(String memId) throws BizNotFoundException {
		// DAO에서 member조회
		// member가 없으면 BizNotFoundException 던지기
		// 그 외는 해당 member return
		MemberVO vo = memberDao.getMember(memId);
		if(vo == null) {
			throw new BizNotFoundException();
		}
		
	
		
		
		return vo;
	}

	@Override
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		// DAO에서 member조회
				// member가 없으면 BizNotFoundException던지기
				// 있으면 DB업데이트
				// 업데이트 후 업데이트 된 행수가 0이면 BizNotEffectedException
		MemberVO vo = memberDao.getMember(member.getMemId());
		if(vo == null) {
			throw new BizNotFoundException();
		}
		
		int cnt = memberDao.updateMember(member);
		if(cnt == 0) {
			throw new BizNotEffectedException();
		}
		
	}

	@Override
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		// DAO에서 member조회
				// member가 없으면 BizNotFoundException던지기
				// 있으면 DB업데이트(삭제)
				// 업데이트 후 업데이트 된 행수가 0이면 BizNotEffectedException
		MemberVO vo = memberDao.getMember(member.getMemId());
		if(vo == null) {
			throw new BizNotFoundException();
		}

		int cnt = memberDao.deleteMember(member);
		if(cnt == 0) {
			throw new BizNotEffectedException();
		}
		
	}

	@Override
	public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {
		// 회원가입
				// memId는 PK, 그래서 가입하려고 할 때 DB에 있는지 조회
				// DB에 있다는건 이미있는 아이디 => BizDuplicateKeyException
				// 없으면 insert
		MemberVO vo = memberDao.getMember(member.getMemId());
		if(vo != null) {
			throw new BizDuplicateKeyException();
		}
		int cnt = memberDao.insertMember(member);
		if(cnt == 0) {
			throw new BizNotEffectedException();
		}
		
	}

	@Override
	public String findId(MemberVO member) {
		String memId = memberDao.findId(member);
		System.out.println(memId);
		return memId;
	}

	@Override
	public String findPw(MemberVO member) {
		String memPw = memberDao.findPw(member);
		return memPw;
	}
	

	

}

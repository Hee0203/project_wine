package com.project.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.login.vo.UserVO;
import com.project.member.dao.IMemberDao;
import com.project.member.vo.MemberVO;

@Service
public class LoginServiceImpl implements ILoginService{
	
	@Inject
	IMemberDao memberDao;

	@Override
	public UserVO getUser(String id) {
		MemberVO member = memberDao.getMember(id);
		if(member == null) {
			return null;
		} else {
			UserVO user = new UserVO();
			user.setUserId(member.getMemId());
			user.setUserName(member.getMemName());
			user.setUserPass(member.getMemPass());
			/*
			 * if(member.getMemId().equals("user01") || member.getMemId().equals("user03"))
			 * {
			 */
			if(member.getMemRole().equals("MANAGER")) {
				user.setUserRole("MANAGER");
			} else {
				user.setUserRole("MEMBER");
			}
			return user;
		}
	}

}

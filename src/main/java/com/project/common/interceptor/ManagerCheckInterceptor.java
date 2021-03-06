package com.project.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.login.vo.UserVO;

public class ManagerCheckInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		HttpSession session = req.getSession(false);
		if(session == null) {
			resp.sendRedirect(req.getContextPath() + "/login/login/wow");
			return false;
		}
		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		if(user == null) {
			resp.sendRedirect(req.getContextPath() + "/login/login.wow");
			return false;
		}
		if(!user.getUserRole().equals("MANAGER")) {
			resp.sendError(HttpServletResponse.SC_FORBIDDEN, "관리자만 접근 할 수 있습니다.");
			return false;
		}
		
		return true;
	}
}

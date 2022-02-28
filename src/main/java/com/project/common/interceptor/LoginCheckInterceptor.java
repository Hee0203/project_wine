package com.project.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.login.vo.UserVO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		String ajax = req.getHeader("X-requested-with");
		
		HttpSession sesstion = req.getSession(false);
		if(sesstion == null) {
			if(ajax != null) {
				resp.sendError(401, "로그인이 필요합니다.");
				return false;
			}
			resp.sendRedirect(req.getContextPath() + "/login/login.wow");
			return false;
		}
		
		UserVO user = (UserVO)sesstion.getAttribute("USER_INFO");
		if(user == null) {
			if(ajax != null) {
				resp.sendError(401, "로그인이 필요합니다.");
				return false;
			}
			resp.sendRedirect(req.getContextPath() + "/login/login.wow");
			return false;
		}
		return true;
	}
}

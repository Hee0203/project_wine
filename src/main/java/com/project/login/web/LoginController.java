package com.project.login.web;

import java.io.IOException;
import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.common.util.CookieUtils;
import com.project.login.service.ILoginService;
import com.project.login.vo.UserVO;

@Controller
public class LoginController {

	@Inject
	ILoginService loginService;
	
	@RequestMapping("/login/login.wow")
	public String getLogin() {
		return "login/login";
	}
	
	@PostMapping("/login/login.wow")
	public String postLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String method = req.getMethod();
		if(method.equals("POST")) {
			String id = req.getParameter("userId");
			String pass = req.getParameter("userPass");
			String save_id = req.getParameter("rememberId");
			if(save_id == null) {
				CookieUtils cookieUtils = new CookieUtils(req);
				if(cookieUtils.exists("SAVE_ID")) {
					Cookie cookie = CookieUtils.createCookie("SAVE_ID", id, 0, "/");
					resp.addCookie(cookie);
				}
				save_id = "";
			}
			if((id == null || id.isEmpty()) || (pass == null || pass.isEmpty())) {
				return "redirect:" + "/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 입력하세요.", "utf-8");
			} else {
				UserVO user = loginService.getUser(id);
				if(user == null) {
					return "redirect:" + "/login/login.wow?msg=" + URLEncoder.encode("아이디가 존재하지 않습니다.", "utf-8");
				} else {
					if(user.getUserPass().equals(pass)) {
						if (save_id.equals("Y")) {
							resp.addCookie(CookieUtils.createCookie("SAVE_ID", id, 3600 * 24 * 7, "/"));
						}
						HttpSession sesstion = req.getSession();
						sesstion.setAttribute("USER_INFO", user);
						return "/main/home";
					} else {
						return "redirect:" + "/login/login.wow?msg=" + URLEncoder.encode("비밀번호가 다릅니다.", "utf-8");
					}
				}
			}  
		} else {
			resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "이 사이트는 get, post만 허용합니다.");
			return "";
		}
	}
	
	@RequestMapping("login/logout.wow")
	public String logout(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		session.removeAttribute("USER_INFO");
		return "redirect:" + "/main/home.wow";
	}
	
	
	
	
}

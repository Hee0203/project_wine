package com.project.mypage.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.comm.service.ICommService;
import com.project.comm.vo.CommSearchVO;
import com.project.comm.vo.CommVO;
import com.project.common.vo.ResultMessageVO;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.login.vo.UserVO;
import com.project.member.service.IMemberService;
import com.project.member.vo.MemberVO;
import com.project.qa.service.IQaService;
import com.project.qa.vo.QaSearchVO;
import com.project.qa.vo.QaVO;

@Controller
public class MyPageController {

	@Inject
	IMemberService memberService;
	
	@Inject
	ICommService commService;
	
	@Inject
	IQaService qaService;
	
	
	@RequestMapping("/mypage/info.wow")
	public String Info(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		
		try {
			MemberVO member = memberService.getMember(user.getUserId());
			req.setAttribute("member", member);
			return "mypage/info";
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "회원없음", "회원이없습니다", "/", "홈으로");
			req.setAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/mypage/memberDetail.wow", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
	public Map<String, Object> memberView2 (HttpServletRequest req, HttpServletResponse resp, @RequestParam(value = "memId") String memId){
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		
		//System.out.println(memId);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			MemberVO member = memberService.getMember(user.getUserId());
			map.put("result", true);
			map.put("data", member);	
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg","실패");
		}
		
		return map;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/mypage/memberDetailEdit.wow" , produces = "application/json;charset=utf-8", method = RequestMethod.POST )
	public Map<String, Object> memberDetail (HttpServletRequest req, HttpServletResponse resp,@RequestParam(value = "memId") String memId){
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		//System.out.println(memId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			MemberVO member = memberService.getMember(user.getUserId());
			map.put("result", true);
			map.put("data", member);
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "실패");
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mypage/memberEditModify.wow" , produces = "application/json;charset=utf-8", method = RequestMethod.POST )
	public Map<String, Object> memberModify(HttpServletRequest req, HttpServletResponse resp,@ModelAttribute("member") MemberVO member){
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		//System.out.println(member);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			memberService.modifyMember(member);
			map.put("result", true);
			map.put("msg", " 수정성공");
		} catch (BizNotEffectedException e) {
			map.put("result", false);
			map.put("msg", "본인이 아닙니다");
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "회원이 없습니다");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mypage/memberDetailDelete", produces = "application/json;charset=utf-8")
	public Map<String, Object> memberDelete(HttpServletRequest req, HttpServletResponse resp,MemberVO member){
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(member);
		try {
			memberService.removeMember(member);
			map.put("result", true);
			map.put("msg", "삭제성공");
		} catch (BizNotEffectedException e) {
			map.put("result", true);
			map.put("msg", "본인이 아닙니다.");
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "회원이 없습니다.");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mypage/memberCommList", produces = "application/json; charset=UTF-8" )
	public Map<String, Object> commList(HttpServletRequest req, HttpServletResponse resp, CommSearchVO searchVO){
		System.out.println(searchVO);
		//System.out.println(searchVO);
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		List<CommVO> commList = commService.getselectCommList(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", commList);
		map.put("size", commList.size());
		
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mypage/memberQaList", produces = "application/json; charset=UTF-8" )
	public Map<String, Object> qaList(HttpServletRequest req, HttpServletResponse resp, QaSearchVO searchVO){
		System.out.println(searchVO);
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		List<QaVO> qaList = qaService.getselectQaList(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", qaList);
		map.put("size", qaList.size());
		

		
		
		return map;
	}
	
	
	
}

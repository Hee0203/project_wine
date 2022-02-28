package com.project.member.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.comm.dao.ICommDao;
import com.project.comm.service.ICommService;
import com.project.comm.vo.CommSearchVO;
import com.project.comm.vo.CommVO;
import com.project.common.vo.ResultMessageVO;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.member.service.IMemberService;
import com.project.member.vo.MemberVO;
import com.project.qa.service.IQaService;
import com.project.qa.vo.QaSearchVO;
import com.project.qa.vo.QaVO;

@RestController
public class MemberRestController {

	@Inject
	IMemberService memberService;
	
	@Inject
	ICommService commService;
	
	@Inject
	IQaService qaService;
	
	@RequestMapping(value = "/member/memberDetail.wow", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
	public Map<String, Object> memberView (@RequestParam(value = "memId") String memId){
		//System.out.println(memId);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			MemberVO member = memberService.getMember(memId);
			map.put("result", true);
			map.put("data", member);	
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg","실패");
		}
		
		return map;
		
	}
	
	@RequestMapping(value = "/member/memberDetail.wow", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
	public Map<String, Object> memberView2 (@RequestParam(value = "memId") String memId){
		//System.out.println(memId);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			MemberVO member = memberService.getMember(memId);
			map.put("result", true);
			map.put("data", member);	
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg","실패");
		}
		
		return map;
		
	}
	
	
	@RequestMapping(value = "/member/memberDetailEdit.wow" , produces = "application/json;charset=utf-8", method = RequestMethod.POST )
	public Map<String, Object> memberDetail (@RequestParam(value = "memId") String memId){
		//System.out.println(memId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			MemberVO member = memberService.getMember(memId);
			map.put("result", true);
			map.put("data", member);
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "실패");
		}
		
		return map;
	}
	
	@RequestMapping(value = "/member/memberEditModify.wow" , produces = "application/json;charset=utf-8", method = RequestMethod.POST )
	public Map<String, Object> memberModify(@ModelAttribute("member") MemberVO member){
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

	@RequestMapping(value = "/member/memberDetailDelete", produces = "application/json;charset=utf-8")
	public Map<String, Object> memberDelete(MemberVO member){
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
	
	@RequestMapping(value = "/member/memberCommList", produces = "application/json; charset=UTF-8" )
	public Map<String, Object> commList(CommSearchVO searchVO){
		List<CommVO> commList = commService.getCommList(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", commList);
		map.put("size", commList.size());
		
		
		return map;
	}
	
	@RequestMapping(value = "/member/memberQaList", produces = "application/json; charset=UTF-8" )
	public Map<String, Object> qaList(QaSearchVO searchVO){
		System.out.println(searchVO);
		List<QaVO> qaList = qaService.getselectQaList(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", qaList);
		map.put("size", qaList.size());
		
		
		return map;
	}
	

}

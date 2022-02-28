package com.project.member.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.comm.service.ICommService;
import com.project.comm.vo.CommSearchVO;
import com.project.common.vo.ResultMessageVO;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.member.service.IMemberService;
import com.project.member.vo.MemberSearchVO;
import com.project.member.vo.MemberVO;
import com.project.qa.service.IQaService;
import com.project.qa.vo.QaSearchVO;

@Controller
public class MemberController {

	@Inject
	IMemberService memberService;

	@Inject
	ICommService commService;

	@Inject
	IQaService qaService;

	@RequestMapping("/member/memberList.wow")
	public String memberList(Model model, @ModelAttribute("searchVO") MemberSearchVO searchVO) {
		List<MemberVO> memberList = memberService.getMemberList(searchVO);
		model.addAttribute("memberList", memberList);

		return "member/memberList";
	}

	@RequestMapping("/member/memberView.wow")
	public String memberView(Model model, @RequestParam(required = true) String memId,
			@ModelAttribute("commSearchVO") CommSearchVO commSearchVO,
			@ModelAttribute("qaSearchVO") QaSearchVO qaSearchVO) {
		try {
			MemberVO member = memberService.getMember(memId);
			model.addAttribute("member", member);

			commService.getCommList(commSearchVO);
			commSearchVO.setPageSize(5);

			qaService.getQaList(qaSearchVO);
			qaSearchVO.setPageSize(5);

			return "member/memberView";

		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 찾기 실패 ", "회원을 찾는데 실패했습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}

	}

	@RequestMapping("/member/memberFindId.wow")
	public String memberFindId(Model model, MemberVO member) {

		return "member/memberFindId";
	}
	
	@RequestMapping("/member/memberFindPw.wow")
	public String memberFindPw(Model model, MemberVO member) {

		return "member/memberFindPw";
	}

	@RequestMapping(value = "/member/memberEdit.wow", params = { "memId" })
	public String memberEdit(Model model, String memId) {
		try {
			MemberVO member = memberService.getMember(memId);
			model.addAttribute("member", member);
			return "member/memberEdit";
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 찾기 실패 ", "회원을 찾는데 실패했습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";

		}

	}

	@RequestMapping(value = "/member/memberModify.wow", method = RequestMethod.POST)
	public String memberModify(Model model, @ModelAttribute("member") MemberVO member) {

		try {
			memberService.modifyMember(member);
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 수정 성공", "회원을 수정하는데 성공하셨습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 수정 실패", "회원을 수정하는데 실패하셨습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 찾기", "회원을 찾는데 실패하셨습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}

	}

	@RequestMapping("/member/memberDelete.wow")
	public String memberDelete(Model model, MemberVO member) {
		try {
			memberService.removeMember(member);
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 삭제 성공", "회원을 삭제 성공하셨습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 삭제 실패", "회원을 삭제 실패하셨습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 찾기 실페", "회원을 찾는데 실패하셨습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/member/memberIdResult")
	public String memberIdResult(MemberVO member) {
		System.out.println(member.getMemName());
		String memId = memberService.findId(member);
		System.out.println(memId);
		return memId;
	}
	
	@ResponseBody
	@RequestMapping(value="/member/memberPwResult")
	public String memberPwResult(MemberVO member) {
		System.out.println(member.getMemName());
		String memPw = memberService.findPw(member);
		System.out.println(memPw);
		return memPw;
	}


}

package com.project.member.web;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.project.common.valid.Step1;
import com.project.common.valid.Step2;
import com.project.common.valid.Step3;
import com.project.common.vo.ResultMessageVO;
import com.project.exception.BizDuplicateKeyException;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.member.service.IMemberService;
import com.project.member.service.MailSendService;
import com.project.member.vo.MemberVO;

@Controller
@SessionAttributes("member")
public class JoinController {
	
	@Inject
	IMemberService memberService;
	
	@ModelAttribute("member")
	public MemberVO member() {
		return new MemberVO();
	}
	
	
	@RequestMapping("/join/step1.wow")
	public String step1(@ModelAttribute("member") MemberVO member) {
		return "join/step1";
	}
	
	@RequestMapping("/join/step2.wow")
	public String step2(@ModelAttribute("member")  @Validated(value = {Step1.class})  MemberVO member, BindingResult error) {
		if(error.hasErrors()) {
			return "join/step1";
		}
		return "join/step2";
	}
	
	@RequestMapping("/join/step3.wow")
	public String step3(@ModelAttribute("member")  @Validated(value = {Step2.class}) MemberVO member, BindingResult error) {
		if(error.hasErrors()) {
			return "join/step2";
		}
		return "join/step3";
	}
	
	@RequestMapping("/join/memberRegist.wow")
	public String memberRegist(Model model, @ModelAttribute("member")  @Validated(value = {Step3.class}) MemberVO member, BindingResult error,  SessionStatus sessionStatus) {
		if(error.hasErrors()) {
			return "join/step3";
		}
		System.out.println(member);
		try {
			memberService.registMember(member);
			sessionStatus.setComplete(); //입력이 성공하면 SessionStatus 객체의 setComplete() 메소드로 세션에서 지웁니다.

			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 등록 성공 ", "회원을 등록했습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "회원 삭제 실패", "회원을 삭제하는데 실패했습니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizDuplicateKeyException ede) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "회원 등록 실패", "회원아이디가 이미 존재합니다.", "/member/memberList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		

	}
	
	@RequestMapping("/join/idCheck.wow")
	@ResponseBody
	public String idCheck(String memId) {
		System.out.println(memId);
		try {
			MemberVO member = memberService.getMember(memId);
			System.out.println(memId);
			return "Y";
		} catch (BizNotFoundException e) {
			return "N";	
		}
	}
	
	@Autowired
	MailSendService mailSendService;
	
	@RequestMapping("/join/emailSend.wow")
	@ResponseBody 
	public String emailSend(String emailAdd) {
		System.out.println(emailAdd);
		String randomKey = mailSendService.sendAuthMail(emailAdd);
		return randomKey;
	}
}

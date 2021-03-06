package com.project.comm.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.attach.vo.AttachVO;
import com.project.comm.service.ICommService;
import com.project.comm.vo.CommSearchVO;
import com.project.comm.vo.CommVO;
import com.project.common.util.StudyAttachUtils;
import com.project.common.vo.ResultMessageVO;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.exception.BizPasswordNotMatchedException;

@Controller
public class CommController {
	
	@Inject
	ICommService commService;
	
	@Autowired
	StudyAttachUtils studyAttachutils;
	

	@RequestMapping("/comm/commList.wow")
	public String commList(Model model, @ModelAttribute("searchVO") CommSearchVO searchVO) {
		List<CommVO> commList = commService.getCommList(searchVO);
		model.addAttribute("commList", commList);
		return "comm/commList";
	}
	
	@RequestMapping("/comm/commView.wow")
	public String commView(Model model, @RequestParam(required = true) int commNo) {	
		try {
			CommVO comm = commService.getComm(commNo);
			model.addAttribute("comm", comm);
			commService.increaseHit(commNo);
		} catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글 찾기에 실패하였습니다. 해당 글이 없습니다.", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch(BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가에 실패함", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		return "comm/commView";
	}
	
	@RequestMapping(value = "/comm/commEdit.wow", params = {"commNo"} )
	public String commEdit(Model model, int commNo) {
		try {
			CommVO comm = commService.getComm(commNo);
			model.addAttribute("comm", comm);
		} catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글 찾기에 실패하였습니다. 해당 글이 없습니다.", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		return "comm/commEdit";
	}
	
	@PostMapping(value = "/comm/commModify.wow")
	public String commModify(Model model, @ModelAttribute("comm") CommVO comm
			, BindingResult error, @RequestParam(value = "commFiles", required = false) MultipartFile[] commFiles
			) throws IOException{
				if(error.hasErrors()) {
					return "comm/commEdit";
				}
		try {
			if(commFiles != null) {
				List<AttachVO> attaches = studyAttachutils.getAttachListByMultiparts(commFiles, "COMM", "comm");
				comm.setAttaches(attaches);
			}
			commService.modifyComm(comm);
			return "redirect:" + "/comm/commView.wow?commNo="+comm.getCommNo();
		} catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글 찾기에 실패하였습니다.", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizPasswordNotMatchedException enp) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 수정 실패", "비밀번호가 틀렸습니다.", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "수정 실패", "글 수정에 실패하였습니다.", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	@PostMapping("/comm/commDelete.wow")
	public String commDelete(Model model, CommVO comm) {
		try {
			commService.removeComm(comm);
			return "redirect:" + "/comm/commList.wow";
		} catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "글 삭제 실패", "글 삭제에 실패했습니다.", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizPasswordNotMatchedException enp) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "글 삭제 실패", "비밀 번호 실패", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "글 삭제 실패", "글 삭제에 실패했습니다.", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	@GetMapping("/comm/commForm.wow")
	public String commForm(Model model, @ModelAttribute("comm") CommVO comm) {
		
		return "comm/commForm";
	}
	
	@PostMapping("/comm/commRegist.wow")
	public String commRegist(Model model, @ModelAttribute("comm") CommVO comm,
			BindingResult error, @RequestParam(value = "commFiles", required = false) MultipartFile[] commFiles) 
			throws IOException{
		if(error.hasErrors()) {
			return "comm/commForm";
		}

		try {
			if(commFiles != null) {
				List<AttachVO> attaches = studyAttachutils.getAttachListByMultiparts(commFiles, "COMM", "comm");
				comm.setAttaches(attaches);
			}			
			commService.registComm(comm);
			return "redirect:" + "/comm/commView.wow?commNo="+comm.getCommNo();
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 등록 실패", "글 등록을 실패하였습니다.", "/comm/commList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";			
		}
	}
	
	
}

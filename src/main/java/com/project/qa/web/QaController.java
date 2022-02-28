package com.project.qa.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.validation.groups.Default;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.common.util.StudyQaAttachUtils;
import com.project.common.valid.Modify;
import com.project.common.vo.ResultMessageVO;
import com.project.exception.BizNotEffectedException;
import com.project.exception.BizNotFoundException;
import com.project.exception.BizPasswordNotMatchedException;
import com.project.qa.service.IQaService;
import com.project.qa.vo.QaSearchVO;
import com.project.qa.vo.QaVO;
import com.project.qaattach.vo.QaAttachVO;


@Controller
public class QaController {

	@Inject
	IQaService qaService;

	@Autowired
	StudyQaAttachUtils studyAttachutils;
	
	@RequestMapping("/qa/qaList.wow")
	public String qaList(Model model, @ModelAttribute("searchVO") QaSearchVO searchVO) {
		List<QaVO> qaList = qaService.getQaList(searchVO);
		model.addAttribute("qaList", qaList);
		return "qa/qaList";
	}	
	
	@RequestMapping("/qa/qaView.wow")
	public String qaView(Model model, @RequestParam(required = true) int qaNo) {
		try {
			QaVO qa = qaService.getQa(qaNo);
			model.addAttribute("qa", qa);
			qaService.increaseHit(qaNo);
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당 글이 없습니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가가 실패했습니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		
		return "qa/qaView";
	}
	
	@RequestMapping(value = "/qa/qaEdit.wow", params = {"qaNo"})
	public String qaEdit(Model model, int qaNo) {
		try {
			QaVO qa = qaService.getQa(qaNo);
			model.addAttribute("qa", qa);
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당 글이 없습니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		return "qa/qaEdit";
	}
	
	@PostMapping("/qa/qaModify.wow")
	public String qaModify(Model model
			, @ModelAttribute("qa")
			@Validated(value = {Modify.class, Default.class})QaVO qa
			, BindingResult error
			, @RequestParam(value = "qaFiles", required = false)MultipartFile[] qaFiles
			) throws IOException {
		if(error.hasErrors()) {
			return "qa/qaEdit";
		}
		System.out.println(qaFiles);

		try {
			if(qaFiles != null) {
				List<QaAttachVO> attaches = studyAttachutils.getQaAttachListByMultiparts(qaFiles, "QA", "qa");
				qa.setAttaches(attaches);
			}
			qaService.modifyQa(qa);
			return "redirect:" + "/qa/qaView.wow?qaNo="+qa.getQaNo();
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당 글이 없습니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}catch (BizPasswordNotMatchedException epm) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 수정 실패", "글을 수정하는데 실패했습니다. 비밀번호가 다릅니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가가 실패했습니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		
	}
	
	@RequestMapping(value = "/qa/qaDelete.wow", method = RequestMethod.POST)
	public String qaDelete(Model model, QaVO qa) {
		try {
			qaService.removeQa(qa);
			return "redirect:" + "/qa/qaList.wow";
		} catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당 글이 없습니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizPasswordNotMatchedException epm) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 수정 실패", "글을 수정하는데 실패했습니다. 비밀번호가 다릅니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가가 실패했습니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	
	@RequestMapping("/qa/qaForm.wow")
	public String qaForm(Model model, @ModelAttribute("qa") QaVO qa) {
		return "qa/qaForm";
	}
	
	@RequestMapping(value = "/qa/qaRegist.wow", method = RequestMethod.POST)
	public String qaRegist(Model model,
			@ModelAttribute("qa")
			@Validated(value = {Modify.class, Default.class})QaVO qa,
			BindingResult error, 
			@RequestParam(value="qaFiles", required=false) MultipartFile[] qaFiles) throws IOException {
		
		if(error.hasErrors()) {
			return "qa/qaForm";
		}
		
		/* model.addAttribute("qa", qa); */
		try {
			if(qaFiles != null) {
				List<QaAttachVO> attaches = studyAttachutils.getQaAttachListByMultiparts(qaFiles, "QA", "qa");
				qa.setAttaches(attaches);
			}
			qaService.registQa(qa);
			return "redirect:" + "/qa/qaView.wow?qaNo="+qa.getQaNo();
		} catch(BizNotEffectedException ebe) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 등록 실패", "글 등록을 실패하였습니다.", "/qa/qaList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	
	
	
	
	
	
}

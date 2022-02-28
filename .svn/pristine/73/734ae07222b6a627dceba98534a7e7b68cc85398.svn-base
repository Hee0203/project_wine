package com.project.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.exception.BizAccessFailException;
import com.project.exception.BizNotFoundException;
import com.project.reply.service.IReplyService;
import com.project.reply.vo.ReplySearchVO;
import com.project.reply.vo.ReplyVO;

@RestController
public class ReplyController {
	
	@Inject
	IReplyService replyService;
	
	@RequestMapping(value="/reply/replyList", produces="application/json; charset=UTF-8")
	public Map<String, Object> replyList(ReplySearchVO searchVO){
		List<ReplyVO> replyList = replyService.getReplyListByParent(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", replyList);
		map.put("size", replyList.size());
		
		return map;
	}
	
	@RequestMapping(value="/reply/replyRegist", produces="application/json; charset=utf-8")
	public Map<String, Object> replyRegist(ReplyVO reply){
		replyService.registReply(reply);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("msg", "등록 성공");
		
		return map;
	}
	
	@RequestMapping(value="/reply/replyModify", produces="application/json; charset=utf-8")
	public Map<String, Object> replyModify(ReplyVO reply){
		System.out.println(reply);
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			replyService.modifyReply(reply);
			map.put("result",true);
			map.put("msg", "수정 성공");
		} catch(BizNotFoundException enf) {
			map.put("result", false);
			map.put("msg", "수정 실패");
		} catch(BizAccessFailException eaf) {
			map.put("result",false);
			map.put("msg", "자신의 댓글이 아닙니다.");
		}		
		return map;
	}
	
	@RequestMapping(value="/reply/replyDelete", produces="application/json; charset=utf-8")
	public Map<String, Object> replyDelete(ReplyVO reply){
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			replyService.removeReply(reply);
			map.put("result",true);
			map.put("msg", "삭제 성공");
		} catch(BizNotFoundException enf) {
			map.put("result", false);
			map.put("msg", "삭제 실패");
		} catch(BizAccessFailException eaf) {
			map.put("result",false);
			map.put("msg", "자신의 댓글이 아닙니다.");
		}		
		return map;
	}
	
	
}

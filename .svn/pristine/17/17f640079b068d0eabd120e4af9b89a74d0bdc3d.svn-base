package com.project.qaattach.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.exception.BizNotFoundException;
import com.project.qaattach.service.IQaAttachService;
import com.project.qaattach.vo.QaAttachVO;

@Controller
public class QaAttachController {
	
	@Value("#{util['file.upload.path']}")
	private String uploadPath;
	
	@Autowired
	private IQaAttachService qaAttachService;
	
	@RequestMapping("/attach/qa/download/{atchNo:[0-9]{1,16}}")
	public void attach(@PathVariable(name = "atchNo") int atchNo, HttpServletResponse resp) throws Exception {
		try {
			
			QaAttachVO attachvo = qaAttachService.getAttach(atchNo);
						
			
			String originalName = new String(attachvo.getAtchOriginalName().getBytes("utf-8"), "iso-8859-1");  //iso-8859-1 : 인코딩?
			String filePath = uploadPath + File.separatorChar + attachvo.getAtchPath();
			String fileName = attachvo.getAtchFileName();
			
			File f = new File(filePath, fileName);
			if(!f.isFile()) {
				throw new BizNotFoundException("해당 첨부 파일이 존재하지 않습니다.");
			}
			//다운로드 위한
			resp.setHeader("Content-Type", "application/octet-stream;");
			resp.setHeader("Content-Disposition", "attachment;filename=\"" + originalName + "\";");
			resp.setHeader("Content-Transfer-Encoding", "binary;");
			resp.setContentLength((int) f.length()); 
			resp.setHeader("Pragma", "no-cache;");
			resp.setHeader("Expires", "-1;");
			
			// 저장된 파일 응답 객체의 스트림으로 내보내기
			FileUtils.copyFile(f,  resp.getOutputStream());
			resp.getOutputStream().close();
			try {
				qaAttachService.increaseDownHit(atchNo);
			} catch (Throwable e) {
				e.getMessage();
			}
			
		} catch (BizNotFoundException e) {
			e.getMessage();
			printMessage(resp, "해당 첨부파일이 존재하지 않습니다.");
		} catch (IOException e) {
			resp.reset();
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}

	private void printMessage(HttpServletResponse resp, String msg) throws Exception {
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		out.println("<script type='text/javascript'>");
		out.println(" alert('" + msg + "');");
		out.println(" self.close();");
		out.println("</script>");
		out.println("<h4>첨부파일 문제 " + msg + "</h4>");
		out.println("<button onclick='self.close()'>닫기</button>");
	}
}

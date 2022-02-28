package com.project.common.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


import com.project.attach.vo.StudyFileUtils;
import com.project.qaattach.vo.QaAttachVO;

@Component
public class StudyQaAttachUtils {
	@Value("#{util['file.upload.path']}")
	private String uploadPath;
	
	public QaAttachVO getQaAttachByMultipart(MultipartFile multipart, String category, String path) throws IOException {
		if (!multipart.isEmpty()) {
			String fileName = UUID.randomUUID().toString();
			QaAttachVO vo = new QaAttachVO();
			vo.setAtchOriginalName(multipart.getOriginalFilename());
			vo.setAtchFileSize(multipart.getSize());
			vo.setAtchContentType(multipart.getContentType());
			vo.setAtchFileName(fileName);
			vo.setAtchPath(path);
			vo.setAtchFancySize(StudyFileUtils.fancySize(multipart.getSize()));
			String filePath = uploadPath + File.separatorChar + vo.getAtchPath();
			
		  	FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath, fileName));  
			//여기서 실제 파일이 저장(regist에서 실행됬다), inputStream을 file로 변환하는 메소드
			//multipart.transferTo(new File(filePath, fileName)); // 비슷한 역할    
			
			return vo;
		} else {
			return null;
		}
	}	
	
	public List<QaAttachVO> getQaAttachListByMultiparts(MultipartFile[] multipartFiles, String category, String path)
			throws IOException {
		List<QaAttachVO> atchList = new ArrayList<QaAttachVO>();
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile multipart = multipartFiles[i];
			QaAttachVO vo = this.getQaAttachByMultipart(multipart, category, path);
			if (vo != null) {
				atchList.add(vo);
			}
		}
		return atchList;
	}
	
}

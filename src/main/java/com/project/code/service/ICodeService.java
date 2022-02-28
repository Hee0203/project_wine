package com.project.code.service;

import java.util.List;

import com.project.code.vo.CodeVO;

public interface ICodeService {
	List<CodeVO> getCodeListByParent(String parentCode) ;
	
}

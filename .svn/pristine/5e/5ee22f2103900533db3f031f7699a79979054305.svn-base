<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>

<div class="comm_edit">
	<h3>
		게시판 - <small>수정페이지</small>
	</h3>
</div>
<form:form action="commModify.wow" method="post" modelAttribute="comm" enctype="multipart/form-data">
	<table class="table-bordered" align="center">
		<tr>
			<th>번호</th>
			<td>${comm.commNo }
			<form:hidden path="commNo"/>
			<form:errors path="commNo"/>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
			<form:input path="commTitle" class=""/>
			<form:errors path="commTitle" cssClass="form-control input-sm"/>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${comm.commWriter }
			<form:hidden path="commWriter"/>
			<form:errors path="commWriter"/>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><form:password path="commPass" cssClass="form-control input-sm" title="알파벳과 숫자로 4글자 이상 입력"/>
			<form:errors path="commPass"/>
			<span class="text-danger"></span>
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"> 글등록시에 입력한 비밀번호를 입력하세요
			</span>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<form:input path="commContent"/>
			</td>
		</tr>		
			<tr>
				<td colspan="2">
					<div class="pull-right" align="right">
						<a href="commList.wow" class="btn btn-info btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록으로
						</a>
						<button type="submit"  class="btn btn-sm btn-primary">
							<span class="glyphicon glyphicon-save" aria-hidden="true"></span> &nbsp;&nbsp;저장
						</button>
						<button type="submit" formaction="commDelete.wow" class="btn btn-sm btn-danger">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> &nbsp;&nbsp;삭제
						</button>				
					</div>
				</td>
			</tr>
	</table>
</form:form>



<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>
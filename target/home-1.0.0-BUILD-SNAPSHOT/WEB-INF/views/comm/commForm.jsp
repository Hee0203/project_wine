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

<div>
	<h2>글 쓰기</h2>
	<hr>
</div>
<form:form action="commRegist.wow" method="post" modelAttribute="comm" enctype="multipart/form-data">
	<table class="table-bordered" align="center">
	<tr>
		<th>제목</th>
		<td>
		<form:input path="commTitle"/>
		<form:errors path="commTitle"/>
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="hidden" id="memId" class="memId" name="memId" value="${USER_INFO.userId }">
			${USER_INFO.userId }
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
		<form:password path="commPass" cssClass="form-control input-sm" title="알파벳과 숫자로 4글자 이상 입력하세요."/>
		<form:errors path="commPass"/>
		<span class="text-danger"></span>
		<span class="glyhicon glyhicon-exclamation-sign" aria-hidden="true">비밀 번호 설정하세요</span>
		</td>
	</tr>	
	<tr>
		<th>내용</th>
		<td>
		<form:input path="commContent"/>
		</td>
	</tr>
		<tr align="right">
			<td colspan="2">
				<div class="pull-left">
					<a href="commList.wow" class="btn btn-default btn-primary btn-sm"> <span
						class="glyphicon glyphicon-list" aria-hidden="true"></span>
						&nbsp;&nbsp;목록
					</a>
				</div>
				<div class="pull-right">
					<button type="submit" class="btn btn-sm btn-primary">
						<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
						&nbsp;&nbsp;저장
					</button>
				</div>
			</td>
		</tr>
	</table>
</form:form>




<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>
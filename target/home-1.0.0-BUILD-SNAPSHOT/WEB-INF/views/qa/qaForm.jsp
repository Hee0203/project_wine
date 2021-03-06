<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.qa.vo.QaVO" %>
<%@ page import="com.project.qa.service.QaServiceImpl" %>
<%@ page import="com.project.qa.service.IQaService" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<div class="container">

	<div class="page-header" align="center">
		<h3>질의 게시판</h3>
	</div>
	<form:form action="qaRegist.wow" method="post" modelAttribute="qa" enctype="multipart/form-data">
		<table border="1" align="center">
			<tr>
				<th>제목</th>
				<td>
					<form:input path="qaTitle"/>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="hidden" name="qaMemId" value="${USER_INFO.userId }">
					<input type="hidden" name="qaMemName" value="${USER_INFO.userName }">
					${USER_INFO.userName}
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<form:password path="qaPass"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<form:textarea path="qaContent"/>
				</td>
			</tr>
			<tr>
				<td>
					<div class="pull-left">
						<a href="qaList.wow">목록</a>
					</div>
				</td>
				<td>
					<div class="pull-right">
						<button type="submit">등록</button>
					</div>
				</td>
			</tr>
		</table>
	
	</form:form>

</div>

</body>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
</html>
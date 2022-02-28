<%@page import="com.project.common.util.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="com.project.login.vo.UserVO"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>

<%
	String msg = request.getParameter("mgs");
	String id = "";
	String check = "";
	
	CookieUtils cookie = new CookieUtils(request);
	
	if(cookie.exists("SAVE_ID")) {
		id = cookie.getValue("SAVE_ID");
		check = "check='check'";
	}
	UserVO user = (UserVO)session.getAttribute("USER_INFO");
%>

<c:if test="<%=user != null %>">
	로그인 중입니다.
	<a href="logout.wow" class="button">로그아웃</a>
</c:if>
<c:if test="<%=user == null %>">
	<div class="contaiter">
		<form action="login.wow" class="loginCheck" method="post">
			<table class="table">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userId" value="<%=id%>"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="userPass"></td>
					</tr>
					<tr>
						<td colspan="2">
							<label><input type="checkbox" name="rememberId" value="Y" <%=check %>>ID 기억하기</label>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="loginButton">로그인</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</c:if>







</body>
</html>
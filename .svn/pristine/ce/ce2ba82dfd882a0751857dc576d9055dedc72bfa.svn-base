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
<title>WINE VINTAGE</title>
<%@ include file="/WEB-INF/inc/header.jsp" %>
<style>

	#icon_id, #icon_pw{
		height: 13px;
		width: 13px;
	}
	.panel_inner{
		/* width: 700px; */
		width: 100%;
		height: 815px;
		background: white;
		text-align: center;
		padding-top: 260px;
		padding-bottom: 30px;
	}
	.btn{
		width: 334px;
		margin-top: 30px;
		margin-left: -7px;
	}
	.input_text{
		width: 300px;
		height: 50px;
		padding: 5px;
		margin-left: 10px;
	}
	.id{
		border-radius: 6px 6px 0 0;
		box-shadow: none;
		border: solid 1px grey;
	}
	.pw{
		border-radius: 0 0 6px 6px;
		box-shadow: none;
		border: solid 1px grey;
	}
	#label{
		margin-top: 5px;
	}
	#join{
		margin-top: 10px;
	}
	#span1{
		transform: rotate(90deg);
		border: solid 0.5px black;
	}
	#join a{
		font-size: 16px;
	}
	.findId:hover, .findPw:hover{
		color: #a40000;
	}

</style>
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
 			<%-- <table class="table">
				<tbody>
					<tr id="tr1">
						<td><input type="text" id="input_id" placeholder="아이디" name="userId" value="<%=id%>"></td>
						<td><input type="password" id="input_pw" placeholder="비밀번호" name="userPass"></td>
					</tr>
					<tr>
						<td colspan="2">
							<label><input type="checkbox" name="rememberId" value="Y" <%=check %>> ID 기억하기</label>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="loginButton">로그인</button>
						</td>
					</tr>
					<tr>
						<td>
							<a style="color:black;" href="<%=request.getContextPath() %>/join/step1.wow">&nbsp; 회원가입 </a>
						</td>
					</tr>
				</tbody>
			</table>  --%>
			<div class="panel_inner" role="tabpanel" aria-controls="loinid">
				<div id="wrap">
				<div class="id_pw_wrap">
					<div class="input_row" id="id_line">
						<div class="icon_cell" id="id_cell">
							<span class="icon_id">
								<img id="icon_id" alt="이미지가 없습니다." src="<%= request.getContextPath()%>/resources/assets/img/user.png">
							</span>
							<input type="text" id="id" name="userId" class="input_text id" placeholder="아이디" value="<%=id%>">
						</div>
						<div class="input_row" id="pw_line">
							<span class="icon_pw">
								<img id="icon_pw" alt="이미지가 없습니다." src="<%= request.getContextPath()%>/resources/assets/img/lock.png">
							</span>
							<input type="password" id="pw" placeholder="비밀번호" class="input_text pw" name="userPass">
						</div>
					</div>
				</div>
				
				<div>
					<label id="label">
						<input id="remember" type="checkbox" name="rememberId" value="Y" <%=check %>> ID 기억하기
					</label>
				</div>
				<div>	
					<button type="submit" class="btn loginButton" style="background-color: black; color: white;">로그인</button>
				</div>
				<div id="join">
					<a style="color: black;" href="<%= request.getContextPath()%>/join/step1.wow"> &nbsp; 회원가입 &nbsp;&nbsp; </a>
					<span id="span1"></span>
					<a style="color: black;" class="findId" href="<%= request.getContextPath()%>/member/memberFindId.wow">  &nbsp;&nbsp;&nbsp; ID</a>
					<a style="color: black;" class="findPw" href="<%= request.getContextPath()%>/member/memberFindPw.wow"> / PW &nbsp;&nbsp;&nbsp;찾기</a>
				</div>
			</div>
			</div>
	</form>
	</div>
</c:if>







</body>
</html>
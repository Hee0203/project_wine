<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("utf-8"); %>
<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<div>
	<h3>회원 정보 수정</h3>
	
<table>
	<tbody>
		<tr>
			<th>회원명</th>
			<td>
			<form:input path="memName"/>
			<form:errors path=memName/>
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${member.memId }
			<form:hidden path="memId"/>
			<form:errors path=memId/>	
			</td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td>
			<form:password path="memPass" />
			<form:errors path=memPass/>
			</td>
			
		</tr>
		<tr>
			<th>생일</th>
			<td>
			<form:input path="memBir"/>
			<form:errors path=memBir/>
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<td>
			<form:input path="memHp"/>
			<form:errors path=memHp/>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
			<form:input path="memZip"/>
			<form:errors path=memZip/>
			</td>
			<td>
			<form:input path="memAdd1"/>
			<form:errors path=memAdd1/>
			<form:input path="memAdd2"/>
			<form:errors path=memAdd2/>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
			<form:input path="memMail"/>
			<form:errors path=memMail/>
			</td>
		</tr>
		<tr>
			<th>와인 횟수</th>
			<td>
			<form:input path="memDrink"/>
			<form:errors path=memDrink/>
			</td>
		</tr>
		<tr>
			<th>와인 기념</th>
			<td>
			<form:input path="memAnn"/>
			<form:errors path=memAnn/>
			</td>
		</tr>
	</tbody>
</table>

</div>



<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>
 --%>
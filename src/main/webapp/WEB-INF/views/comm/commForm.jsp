<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>WINE VINTAGE</title>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/form.css"/>" >
<%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>

<div align="center" style="padding-top: 17px;">
	<h2>글 쓰기</h2>
	<hr>
</div>
<form:form action="commRegist.wow" method="post" modelAttribute="comm" enctype="multipart/form-data">
	<table class="comm_table" align="center">
	<colgroup>
		<col width="10%">
		<col width="60%">
		<col width="10%">
		<col width="20%">
	</colgroup>
	<tr height="100px">
		<th>제목</th>
		<td>
			<form:input path="commTitle" id="commTitle"/>
			<form:errors path="commTitle"/>
		</td>
		<th>작성자</th>
		<td>
			<input type="hidden" id="memId" class="memId" name="memId" value="${USER_INFO.userId }">
			${USER_INFO.userId }
		</td>
	</tr>
	<tr height="500px">
		<th>내용</th>
		<td colspan="3">
			<form:input path="commContent"/>
		</td>
	</tr>
	<tr height="100px" align="left">
		<th>비밀번호</th>
		<td colspan="3">
			<form:password path="commPass" id="pass" title="알파벳과 숫자로 4글자 이상 입력하세요."/>
			<form:errors path="commPass"/>
			<span class="text-danger"></span>
			<span class="glyhicon glyhicon-exclamation-sign" id="pass_alarm" aria-hidden="true" style="margin-left:10px;">비밀번호를 설정하세요</span>
		</td>
	</tr>
	<tr height="100px">
		<th>첨부파일
			<button type="button" class="btn-primary" id="id_btn_new_file" style="margin-left:20px; background:black; border: black; border-radius:5px; height:35px; font-size: 14px; padding: 7px;">추가</button>
		</th>
		<td class="file_area" colspan="3">
			<div class="form-inline" style="display: flex; margin-bottom: 10px;">
				<input type="file" name="commFiles" class="form-control" style="width:500px;">
				<button type="button" class="btn_delete btn btn-sm btn-primary" style="background:black; margin-left:5px; border:black; border-radius:5px; height: 35px; padding:7px;">삭제</button>
			</div>
		</td>
	</tr>
	
	</table>
	<div id="btn_div" style="margin-top: 20px;">
		<a href="commList.wow" id="btn_list" class="btn btn-default btn-primary btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span>목록</a>
		<button type="submit" id="btn_save" class="btn btn-sm btn-primary"><span class="glyphicon glyphicon-save" aria-hidden="true"></span>등록</button>
	</div>

</form:form>




<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
<script>
$('#id_btn_new_file').click(function(){
	$('.file_area').append('<div class="form-inline" style="maring-bottom:10px;">'
	+ '<input type="file" name="commFiles" class="form-control" style="width: 500px;">'
	+ '<button type="button" class="btn_delete btn btn-sm btn-primary" style="background:black; margin-left:5px; border:black; border-radius:5px; height: 35px; padding:7px;">삭제</button>'
	+ '</div>');
});

$('.file_area').on('click','.btn_delete', function(){
	$(this).closest('div').remove();
});


</script>
</html>
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
<link rel="stylesheet" href="<c:url value="/resources/assets/css/form.css"/>">
<%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>

<div style="width: 55%; margin: auto; margin-top: 60px; margin-bottom: 25px;" align="center" class="comm_edit">
	<h3 style="text-align: left; padding-left: 29px; border-bottom: solid; padding-bottom: 10px;">
		커뮤니티
	</h3>
</div>
<form:form action="commModify.wow" method="post" modelAttribute="comm" enctype="multipart/form-data">
	<table style="border-color: #fff; width: 1100px;" class="table-bordered" align="center">
			<colgroup>
				<col width="10%">
				<col width="60%">
				<col width="10%">
				<col width="20%">
			</colgroup>
 		<tr>
			<form:hidden path="commNo"/>
			<form:errors path="commNo"/>
		</tr>
		<tr height="100px">
			<th>제목</th>
			<td>
				<form:input path="commTitle" class=""/>
				<form:errors path="commTitle" cssClass="form-control input-sm"/>
			</td>
			<th>작성자</th>
			<td>${comm.memId }
				<form:hidden path="memId"/>
				<form:errors path="memId"/>
			</td>
		</tr>
<%-- 		<tr height="100px" align="left">
			<th>비밀번호</th>
			<td colspan="3"><form:password path="commPass" id="pass" icssClass="form-control input-sm" title="알파벳과 숫자로 4글자 이상 입력"/>
			<form:errors path="commPass"/>
			<span class="text-danger"></span>
			<span class="glyphicon glyphicon-exclamation-sign" id="pass_alarm" aria-hidden="true">비밀번호를 설정하세요
			</span>
			</td>
		</tr> --%>
		<tr height="500px">
			<th>내용</th>
			<td colspan="3">
			<form:textarea path="commContent"/>
			</td>
		</tr>
		<tr height="100px" align="left">
			<th>비밀번호</th>
			<td colspan="3"><form:password path="commPass" id="pass" icssClass="form-control input-sm" title="알파벳과 숫자로 4글자 이상 입력"/>
			<form:errors path="commPass"/>
			<span class="text-danger"></span>
			<span class="glyphicon glyphicon-exclamation-sign" id="pass_alarm" aria-hidden="true">비밀번호를 설정하세요
			</span>
			</td>
		</tr>
		<tr height="100px">
			<th>첨부파일
				<button type="button" id="id_btn_new_file" style="margin-left:20px; color: #fff; background:black; border: black; border-radius:5px; height:35px; font-size: 14px; padding: 7px;">추가</button>
			</th>
			<td class="file_area" colspan="3">
 				<c:forEach var="f" items="${comm.attaches }" varStatus="st">
					<div>
						# 파일${st.count }<a href="<c:url value='/attach/download/${f.atchNo}'/>" target="_blank"><span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName }
						</a> Size : ${f.atchFancySize } Down : ${f.atchDownHit }				
						<a>
							<img class="delete" src="../resources/assets/img/delete.png" 
								style="width: 20px; height: 20px;" onclick=""
								data-atch-no="${f.atchNo}">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
						</a>
					</div>
				</c:forEach>
				<div class="form-inline" style="display: flex; margin-bottom: 10px;">
						<input type="file" name="qaFiles" class="form-control" style="width:500px;">
						<button type="button" class="btn_delete btn btn-sm" style="background:black; margin-left:5px; border:black; border-radius:5px; height: 35px; padding:7px; color: white;">삭제</button>
				</div>
			</td>
		</tr>
<!-- 			<tr height="100px">
				<th>첨부파일
					<button type="button" class="btn-primary" id="id_btn_new_file" style="margin-left:20px; background:black; border: black; border-radius:5px; height:35px; font-size: 14px; padding: 7px;">추가</button>
				</th>
				<td class="file_area" colspan="3">
					<div class="form-inline" style="display: flex; margin-bottom: 10px;">
						<input type="file" name="qaFiles" class="form-control" style="width:500px;">
						<button type="button" class="btn_delete btn btn-sm btn-primary" style="background:black; margin-left:5px; border:black; border-radius:5px; height: 35px; padding:7px;">삭제</button>
					</div>
				</td>
			</tr> -->
	</table>
 		<div id="btn_div" style="margin-top:20px;">
			<a href="commList.wow" class="btn btn-primary" style="background: black; border: black;">목록</a>
			<button type="submit" class="btn btn-primary" style="background: black; border: black;">수정</button>
			<button type="submit" class="btn btn-primary" formaction="commDelete.wow" style="background: black; border: black;">삭제</button>
		</div>
</form:form>



<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>

<script type="text/javascript">
//첨부파일 추가버튼
$('#id_btn_new_file').click(function(){
	$('.file_area').append('<div class="form-inline">'
	+ '<input type="file" name="boFiles" class="form-control">'
	+ '<button type="button" class="btn_delete btn btn-sm">삭제</button>'
	+ '</div>');
});

$('.file_area').on('click','.btn_delete', function(){
	$(this).closest('div').remove();
});

//기존 첨부파일 삭제
$('.delete').click(function(){
	$btn = $(this);
	$btn.closest('div').html('<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no") + '" />');

});



</script>

</html>
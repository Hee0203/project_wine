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
<title>WINE VINTAGE</title>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/form.css"/>">
<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
	<div style="width: 55%; margin: auto; margin-top: 60px; margin-bottom: 25px;" align="center">
		<h3 style="text-align: left; padding-left: 29px; border-bottom: solid; padding-bottom: 10px;">질의게시판</h3>
	</div>
	<form:form action="qaModify.wow" method="post" modelAttribute="qa" enctype="multipart/form-data">
	<table class="qa_table" align="center">
			<colgroup>
				<col width="10%">
				<col width="60%">
				<col width="10%">
				<col width="20%">
			</colgroup>
			<tr height="100px">
					<form:hidden path="qaNo" id="qaNo"/>
					<form:errors path="qaNo" />
				<th>제목</th>
				<td>
					<form:input path="qaTitle" id="qaTitle"/>
				</td>
				<th>작성자</th>
				<td>
					<form:hidden path="qaMemId" id="qaMemId"/>
					<form:hidden path="qaMemName" id="qaMemName"/>
					<%-- <input type="hidden" name="qaMemId" value="">
					<input type="hidden" name="qaMemName" value="${USER_INFO.userName }"> --%>
					${qa.qaMemName}
				</td>
			</tr>
			<tr height="500px">
				<th>내용</th>
				<td colspan="3">
					<form:textarea path="qaContent"/>
				</td>
			</tr>
			<tr height="100px" align="left">
				<th>비밀번호</th>
				<td colspan="3">
					<form:password path="qaPass" id="pass" title="알파벳과 숫자로 4글자 이상 입력하세요."/>
					<span class="text-danger"></span>
			<span class="glyhicon glyhicon-exclamation-sign" id="pass_alarm" aria-hidden="true" style="margin-left: 10px;">비밀번호를 설정하세요</span>
				</td>
			</tr>
			<tr height="100px">
				<th style="text-align: left;">첨부파일
						<button type="button" id="id_btn_new_file" style="margin-left:20px; background:black; border: black; border-radius:5px; height:35px; font-size: 14px; padding: 7px; color: white;">추가</button>
				</th>
				<td class="file_area" colspan="3">
					<c:forEach var="f" items="${qa.attaches }" varStatus="st">
					<div style="text-align: left;">
						# 파일 ${st.count }
						<a href="<c:url value='/attach/qa/download/${f.atchNo}' />" 
						target="_blank"> <span class="glyphicon glyphicon-save" 
						aria-hidden="true"></span> ${f.atchOriginalName}
						</a> Size : ${f.atchFancySize} Down : ${f.atchDownHit }
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
		</table>
		
		<div id="btn_div" style="margin-top:20px;">
			<a href="qaList.wow" class="btn btn-primary" style="background: black; border: black;">목록</a>
			<button type="submit" class="btn btn-primary" style="background: black; border: black;">수정</button>
			<button type="submit" class="btn btn-primary" formaction="qaDelete.wow" style="background: black; border: black;">삭제</button>
		</div>
	</form:form>

</body>
<script>
	// 첨부파일 추가버튼 클릭 
	$('#id_btn_new_file')
			.click(
					function() {
						$('.file_area')
								.append(
										'<div class="form-inline">'
												+ '<input type="file" name="boFiles" class="form-control">'
												+ ' <button type="button" class="btn_delete btn btn-sm">삭제</button>'
												+ '</div>');
					}); // #id_btn_new_file.click

	// 상위객체를 통해 이벤트 위임  
	$('.file_area').on('click', '.btn_delete', function() {
		$(this).closest('div').remove();
	});

	// 기존 첨부파일 삭제 클릭 
	$('.btn_file_delete').click(			
			/* alert($(this).data("atch-no"));
			return; */
			/* <a href="<c:url value='/attach/qa/download/${f.atchNo}' />"  */
			function() {
				$btn = $(this);
				$btn.closest('div').html(
						'<input type="hidden" name="delAtachNos" value="'
								+ $btn.data("atch-no") + '" />');
			}); //
</script>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
</html>

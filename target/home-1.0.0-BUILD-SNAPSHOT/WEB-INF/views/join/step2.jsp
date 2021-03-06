<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
<div class="container">
<form:form action="step3.wow" modelAttribute="member" method="post">
<div class="row col-md-8 col-md-offset-2">
	<div class="page-header">
		<h3>회원가입 2단계</h3>
	</div>


	<table class="table" >
		<colgroup>
			<col width="20%" />
			<col />
		</colgroup>
		<tr>
			<th>ID</th>
			<td>
				<form:input path="memId" cssClass="form-control input-sm" id="memId"/>
				<button type="button" onclick="fn_idCheck()">중복확인</button>
				<form:errors path="memId"/>				     
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<form:password path="memPass" cssClass="form-control input-sm"/>
				<form:errors path="memPass"/>
			</td>
		</tr>
		
		<tr class="form-group-sm">
			<th>회원명</th>
			<td>
				<form:input path="memName" cssClass="form-control input-sm"/>
				<form:errors path="memName"/>	
			</td>
		</tr>
		<tr class="form-group-sm">
			<th>이메일</th>
			<td>
				<form:input path="memMail" cssClass="form-control input-sm" id="emailAdd"/>
				<button type="button" onclick="fn_emailCheck()">이메일인증</button>
				<form:errors path="memMail"/>	
				<input type="text" id="randomKey" value="" placeholder="인증번호를 입력하세요">
			</td>
		</tr>		
		<tr>
			<td colspan="2">
				<div class="pull-left" >
					<a href="cancel" class="btn btn-sm btn-default" >
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						&nbsp;&nbsp;취 소
					</a>
				</div>
				<div class="pull-right">
					<button type="submit" class="btn btn-sm btn-primary" id="next" onclick="fn_auth()">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> 
						&nbsp;&nbsp;다 음 
					</button>
				</div>
			</td>
		</tr>	
	</table>

</div>
</form:form>
</div> <!-- END : 메인 콘텐츠  컨테이너  -->
</body>
<script type="text/javascript">
var randomKey = "";
var idCheckYn = "Y";

function fn_emailCheck() {
	// selector => find closest 태그 찾기
	// val, html, text
	// attr
	// ajax: url : 보통 같은 서버에 있는 곳에 요청할 때는 c:url태그와 함께 사용 , 
	// data : Parameter
	// type : get, post
	// dataType :  요청한 곳으로부터 받는 데이터 타입 
	// success:function(data) -> 성공하고 나서 실행되는 함수, data는 요청한 곳으로 부터 받은 데이터	
	
	// html태그는 브라우저가 실행함
	// buttonEvent, ajax 등 브라우저가 실행
	// 서버는 브라우저한테 html 태그를 전달 후 역할 끝
	
	event.preventDefault();
	var emailAdd = $("#emailAdd").val();
	
	$.ajax({
		url : "<c:url value='/join/emailSend.wow' />"
		,type : "post"
		,data : {"emailAdd" : emailAdd}
		,success: function (data) {
			alert(data);
			
			randomKey = data;	
		}
	}); //ajax
	

}

// 다음버튼을 눌렀을 때 사용자가 입력한 값이람 randomKey값이 같아야만 
// step3로 넘어가고 다르면 alert("인증번호가 틀립니다");
// 버튼에 함수 걸어서 vent.preventDafault();


$(document).ready(function (e) {
	$("button[type='submit']").on("click", function (e) {
		e.preventDefault();
		var myRandomKey = $("#randomKey").val();
		if(randomKey === randomKey && idCheckYn == "N"){
			alert("")
			$("form").submit();
		} else {
			alert("이메일 인증키가 다릅니다");
		}
		
	})
	
})



// 아이디 중복체크 버튼 함수
// ajax호출 후  id와 db 확인
// 있으면 N 없으면 Y
// 다음 버튼에서 이메일 인증과 idCheckYn 확인
// 인증 id중복x 일때 submit 되도록



function fn_idCheck() {
	event.preventDefault();
	
	var memId = $("#memId").val();
	
	$.ajax({
		url : "<c:url value='/join/idCheck.wow' />"
		,data : {"memId" : memId}
		,type: "POST"
		,success : function (data) {
			if(data == "Y"){
				alert("이미 있는 아이디 입니다");
			} else {
				alert("사용가능한 아이디 입니다.");
			};
			
			idCheckYn = data;
		}		
	}); //ajax
	
}

</script>
</html>
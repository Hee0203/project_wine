<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%request.setCharacterEncoding("utf-8"); %>
<%@include file="/WEB-INF/inc/header.jsp" %>
<title>WINE VINTAGE</title>
<style type="text/css">
	.content_header:after{
		font-size: 0;
		line-height: 0;
		display: block;
		clear: both;
		content: '' ;
	}
	.box_inn_sub dt{
		font-weight: 700;
		float: left;
		width: 80px;
		height: 25px;
		margin-top: 6px;
	}
	.first_div{
		margin-left: 42%;
		margin-top: 5%;
	}
	.btn{
		background: black;
		color: white;
		border: black;
		margin-left: 125px;
	}
	.btn:hover{
		background: black;
		color: white;
		border: black;
	}
</style>

</head>
<body>

<div class="first_div">
	<div class="content_header">
		<h4>비밀번호 찾기</h4>
	</div>
	<form name="findPw">
		<div class="box6">
			<h6>회원 정보에 등록한 휴대전화로 찾기</h6>
			<div class="box_inn_sub">
				<dl>
					<dt>
						<label for="phoneNm" class="label_txt">
							이름
						</label>					
					</dt>
					<dd>
						<input type="text" id="memName" name="memName" maxlength="40" class="input_txt" placeholder="홍길동" style="width:217px;">
					</dd>
					<dt>
						<label for="phoneId" class="label_txt">
							아이디
						</label>					
					</dt>
					<dd>
						<input type="text" id="memId" name="memId" maxlength="40" class="input_txt" placeholder="아이디" style="width:217px;">
					</dd>
					<dt>
						<label for="t_pn1" class="label_txt">휴대전화</label>
					</dt>
					<dd>
						<input type="text" id="memHp" name="memHp" class="input_txt" style="width:217px;" maxlength="13" placeholder="010-1234-1234">
					</dd>
				</dl>
			</div>
			<button id="button1" type="button" class="btn ok btn-primary" >확인</button>
		</div>
	</form>
	
</div>

<div class="PwResult">
	
</div>

<div style="margin-top: 30px;">
	<a class="btn btn-primary" style="margin-left: 890px;" href="<c:url value="/login/login.wow"/>"> 로그인 하러가기</a> 
</div>

</body>
<script type="text/javascript">
$(document).on('click', '.ok',function(){
	$form = $('form[name="findPw"]');
	console.log($form.serialize());
	$.ajax({
		url:'<c:url value="/member/memberPwResult"/>',
		type:'POST',
		data: $form.serialize(),
		success:function(data){
			console.log(data);
			var str ="";
			str += '<div style="margin-top: 50px;"><p  style="background: #f5f5f5;padding-left: 100px;margin-left: 730px; width: 450px; height: 50px; padding-top: 7px;">회원님의 비밀번호는 <span style="color: #a40000; font-size: 25px;">'+ data + '</span> 입니다.</p></div>';
				
			$('.PwResult').append(str);
			
		},
		error:function(e){
			console.log(e.status);
		}
		
	});
});


</script>

</html>
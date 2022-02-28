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
		margin-left: 118px;
	}
	.btn:hover, .btn:focus{
		background: black;
		color: white;
		border: black;
	}

</style>

</head>
<body>

<div class="first_div">
	<div class="content_header">
		<h4>아이디 찾기</h4>
	</div>
	<form name="findId">
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
						<input type="text" id="memName" name="memName" maxlength="40" class="input_txt" style="width:217px;" placeholder="홍길동">
					</dd>
					<dt>
						<label for="t_pn1" class="label_txt">휴대전화</label>
					</dt>
					<dd>
						<input type="text" id="memHp" name="memHp" class="input_txt" style="width:217px;" maxlength="13" placeholder="010-1234-1234">
					</dd>
				</dl>
			</div>
			<button id="button1" style="margin-left: 125px;" type="button" class="btn ok btn-primary" >확인</button>
		</div>
	</form>
	
</div>

<div class="IdResult">
<!-- 	<div style="margin-top: 50px;">
		<p style="background: #f5f5f5;padding-left: 100px;margin-left: 600px; width: 500px;">회원님의 아이디는 <span style="color: #a40000; font-size: 25px;"> a001 </span> 입니다.</p>
	</div> -->
</div>

<div style="margin-top: 30px;">
	<a class="btn btn-primary"  style="margin-left: 815px;" href="<c:url value="/login/login.wow"/>"> 로그인 하러가기</a> 
	<a style="margin-left: 20px;" class="btn btn-primary" href="<c:url value="/member/memberFindPw.wow"/>"> 비밀번호 찾기 </a>
</div>

</body>

<script type="text/javascript">



$(document).on('click', '.ok',function(e){
	$form = $('form[name="findId"]');
	console.log($form.serialize());
	$.ajax({
		url:'<c:url value="/member/memberIdResult"/>',
		type:'POST',
		data: $form.serialize(),
		success:function(data){
			console.log(data);
			e.preventDefault();
			var str ="";
			str += '<div style="margin-top: 50px;"><p style="background: #f5f5f5;padding-left: 100px;margin-left: 730px; width: 450px; height: 50px; padding-top: 7px;">회원님의 아이디는 <span style="color: #a40000; font-size: 25px;">'+ data + '</span> 입니다.</p></div>'
							
			$('.IdResult').append(str);
		},
		error:function(e){
			console.log(e.status);
		}
		
	});
});


</script>












</html>
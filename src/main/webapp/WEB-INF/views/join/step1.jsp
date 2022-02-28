<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>WINE VINTAGE</title>
<%@include file="/WEB-INF/inc/header.jsp" %>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box
}
body{
	background-color: #f7f7f7;
}
ul > li{
	list-style: none;
}
a{
	text-decoration: none;
}
.clearfix::after{
	content:""; display: block; clear: both;
}
#joinForm{
	width: 460px;
	margin: 0 auto;
	height: 690px;
}
ul.join_box{
	border: 1px solid #ddd;
	background-color: #fff;
}
.checkBox, .checkBox>ul{
	position: relative;
}
.checkBox>ul>li{
	float: left;
}
.checkBox>ul>li:first-child{
	width: 85%; 
	padding: 15px;
	font-weight: 600;
	color: #888; 
}
.checkBox>ul>li:nth:-child(2){
	position: absolute;
	top: 50%;
	right: 30px;
	margin-top: -12px;
}
.checkBox textarea{
	width: 96%; 
	height: 90px;
	margin: 0 2%;
	background-color: #f7f7f7;
	color: #888;
	border: none;
	padding: 10px;
}
.footBtwrap{
	margin-top: 15px;
}
ol, ul {
  padding-left: 0rem;
}
.footBtwrap>li{
	float: left;
	width: 50%;
	height: 60px;
}
.footBtwrap>li>button{
	display: block; 
	width: 100%;
	height: 100%;
	font-size: 20px;
	text-align: center; 
	lint-height: 60px;
}
.fpmgBt1{
	background-color: white;
	color: black;
	border: none;
}
.fpmgBt2{
	background-color: black;
	color: white;
	border: none;
}
</style>

</head>
<body>
	<div class="container" style="margin-top: 90px;">
		<form:form modelAttribute="member" method="post" action="step2.wow" id="joinForm">		
			 <%-- <div class="row col-md-8 col-md-offset-2">
				<div class="page-header">
					<h3>회원가입 1단계</h3>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<label> 이용약관 동의 <span class="required">(필수)</span> 
							<form:checkbox path="agreeYn" value="Y"/>
							<form:errors path="agreeYn"/>				
						</label>
					</div>
					<div class="panel-body">
						<p>WINE VINTAGE에 오신것을 환영합니다.
						<p>WINE VINTAGE 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
						<p>본 약관은 다양한 서비스의 이용과 관련하여 본 사이트 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 WINE VINTAGE 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
						<p>서비스를 이용하시거나 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<label>  개인정보 수집 및 이용에 대한 동의 <span class="required">(필수)</span> 
							<form:checkbox path="privacyYn" value="Y"/>
							<form:errors path="privacyYn"/>		
						</label>
					</div>
					<div class="panel-body">
						<p>정보통신망법 규정에 따라 회원가입 신청하시는 분께 수집하는 개인정보에 대하여 알려드립니다.
						<p>1. 개인정보의 수집 항목
						<p>2. 개인정보의 수집 및 이용목적
						<p>3. 개인정보의 보유 및 이용기간
						<p>위 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<label>  이벤트 등 프로모션 알림 메일 수신 <span class="optional">(선택)</span>
							<form:checkbox path="eventYn" value="Y"/>
							<form:errors path="eventYn"/>		
						</label>
					</div>
					<div class="panel-body">
						Wine Vintage가 제공하는 이벤트/프로모션 알림 정보를 메일로 받습니다.
						<p>Wine Vintage가 제공하는 이벤트/프로모션 알림 정보를 메일로 받습니다.
						<p>1. 본 사이트가 직접 운영하는 통합서비스들의 소식과 혜택, 쿠폰 등 유용한 정보를 메일로 제공합니다.
						<p>2. 추후 새로운 서비스가 추가될 경우, 본 동의를 한 사용자에게 자동으로 해당 서비스의 메일을 수신할 수 있게 됩니다.
					</div>
				</div>
			</div>
			<div class="row panel panel-default">
				<div class="panel-body">
					<div>
						<a href="${pageContext.request.contextPath}/join/cancel" class="btn btn-sm btn-default"> <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 취 소
						</a>
						<button type="submit" class="btn btn-sm btn-primary">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> 다 음
						</button>
					</div>
				</div>
			</div>  --%>
			
 			<ul class="join_box" style="padding-top: 13px;">
				<li class="checkBox check02">
					<ul class="clearfix">
						<li>이용약관 동의<span class="required">(필수)</span></li>
						<li class="checkBtn">
							<input type="checkbox" name="agreeYn" value="Y">
						</li>
					</ul>
					<textarea name="" id="">WINE VINTAGE에 오신것을 환영합니다. WINE VINTAGE 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 서비스의 이용과 관련하여 본 사이트 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 WINE VINTAGE 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 서비스를 이용하시거나 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
					</textarea>
				</li>
				<li class="checkBox check03">
					<ul class="clearfix">
						<li>개인정보 수집 및 이용에 대한 안내<p>(필수)</p></li>
						<li class="checkBtn">
							<input type="checkbox" name="privacyYn" value="Y">
						</li>
					</ul>
					<textarea name="" id="">정보통신망법 규정에 따라 회원가입 신청하시는 분께 수집하는 개인정보에 대하여 알려드립니다. 1. 개인정보의 수집 항목 2. 개인정보의 수집 및 이용목적	3. 개인정보의 보유 및 이용기간 위 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
					</textarea>
				</li>
				<li class="checkBox check04">
					<ul class="clearfix">
						<li>이벤트 등 프로모션 알림 메일 수신<p>(선택)</p></li>
						<li class="checkBtn">
							<input type="checkbox" name="eventYn" value="Y">
						</li>
					</ul>
					<textarea name="" id="">WINE VINTAGE가 제공하는 이벤트/프로모션 알림 정보를 메일로 받습니다.	1. 본 사이트가 직접 운영하는 통합서비스들의 소식과 혜택, 쿠폰 등 유용한 정보를 메일로 제공합니다.  2. 추후 새로운 서비스가 추가될 경우, 본 동의를 한 사용자에게 자동으로 해당 서비스의 메일을 수신할 수 있게 됩니다.
					</textarea>
				</li>
			</ul>
			<ul class="footBtwrap clearfix">
				<li><button class="fpmgBt1">비동의</button></li>
				<li><button type="submit" class="fpmgBt2">동의</button></li>
			</ul>
			
			
		</form:form>
	</div>
	<!-- END : 메인 콘텐츠  컨테이너 -- -->

</body>
<%-- <%@include file="/WEB-INF/inc/footer.jsp" %> --%>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WINE VINTAGE</title>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file="/WEB-INF/inc/header.jsp"%>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/member.css"/>" >
<style>
table {
	margin: auto;
	width: 1000px;
	height: 500px;
}
tr {
	border-bottom: 1px solid #ddd;
}

</style>



</head>
<body>

<div class="contents">
<!-- 	<div class="indexView">
		<button type="button">View</button>
	</div> -->
<!-- 	<div class="indexCOMM">
		<button type="button">COMM</button>
	</div>77777
	<div class="indexQA">
		<button type="button">QA</button>
	</div> -->
	<div class="title">
		<h3 style="margin: auto; padding-bottom: 10px; border-bottom: solid; margin-top: 80px; margin-bottom: 30px; width: 1000px; padding-left:15px;">회원정보</h3>
	</div>
	<input type="hidden" class="memId" value="${member.memId }">

	<%-- <table>
	<tbody>
		<tr>
			<th>회원명</th>
			<td class="memName">${member.memName }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td class="memId">${member.memId }</td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td class="memPass"><input type="password" value="${member.memPass }"></td>
		</tr>
		<tr>
			<th>생일</th>
			<td class="memBir">${member.memBir }</td>
		</tr>
		<tr>
			<th>번호</th>
			<td class="memHp">${member.memHp }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td class="memZip">${member.memZip }</td>
			<td class="memAdd1">${member.memAdd1 }</td>
			<td class="memAdd2">${member.memAdd2 }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td class="memMail">${member.memMail }</td>
		</tr>
		<tr>
			<th>와인 횟수</th>
			<td class="memDrink">${member.memDrink }</td>
		</tr>
		<tr>
			<th>와인 기념</th>
			<td class="memAnn">${member.memAnn }</td>
		</tr>
		
		
		<tr>
			<td>
			<a href='memberEdit.wow?memId=${member.memId }' aria-hidden="true">&nbsp;수정</a>
			</td>
		</tr>
	</tbody>

</table>
 --%>
	<!-- <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"> -->


	<div id="view_area"></div>
	<!-- <div id="view_area2">
		<button type="button" class="btnEdit">btnEdit</button>
	</div> -->

	<form name="frm_edit"
		action="<c:url value='/member/memberEditModify.wow' />" method="post"
		onsubmit="return false;">
		<div id="detailEdit"></div>
	</form>
</div>



<%-- 	<%@include file="/WEB-INF/inc/footer.jsp"%> --%>
</body>


<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="<c:url value='/resources/myjs.js'/>"></script>
<script type="text/javascript">


	function fn_view() {
		$(".text-center1").hide()
		$(".text-center2").hide()
		fn_empty();
		$('.btnEdit').remove();
		$.ajax({
			url : "<c:url value='/member/memberDetail.wow' />"
			,type : 'post'
			,data : {"memId" : memId} 
			,dataType: "JSON"
			,success : function (data) {
			//	alert("success");
				console.log(data);
	
			var element = data.data;
			let str="";
			str = '<table class="memberDetail" style="width:950px;"><tbody>'
			+'<tr><th class="memberTh">회원명</th><td class="memName">'+ element.memName +'</td></tr>'
			+ '<tr><th class="memberTh">아이디</th><td class="memId">'+ element.memId +'</td></tr>'
			+ '<tr><th class="memberTh">생일</th><td class="memBir">'+ element.memBir +'</td></tr>'
			+ '<tr><th class="memberTh">번호</th><td class="memHp">'+ element.memHp +'</td></tr>'
			+ '<tr><th class="memberTh">주소</th>'+'<td class="memZip">'+ element.memZip +'</td>'+'<tr><th style="width:15%;"></th><td class="memAdd1" style="width:35%;">'+ element.memAdd1 +'</td>'+'<td class="memAdd2" style="width:30%;">'+ element.memAdd2 +'</td></tr>'+'</tr>'
			+ '<tr><th class="memberTh">이메일</th><td class="memMail">'+ element.memMail +'</td></tr>'
			+ '<tr><th class="memberTh">와인횟수</th><td class="memDrink">'+ element.memDrink +'</td></tr>'
			+ '<tr><th class="memberTh">와인기념</th><td class="memAnn">'+ element.memAnn +'</td></tr></tbody></table>';
			
	        console.log(str);
	        
	        $('#view_area').append(str);
	        
	/*         var strr = '<td><button type="button" class="btnEdit">btnEdit</button>';
			  console.log(strr)    */     
		 	 /*  if($('.btnEdit').length == 0) { 
	        	$('#view_area').append('<button type="button" class="btnEdit">btnEdit</button>');
			  } */
	         
	        
			}, error : function (err) {
				console.log(err.status);
			}
	
		});  //View ajax
	} //function 
	
	
 
		

		
	$(document).ready(function() {
		fn_view();
		$(".indexView").on("click", function(e) {
			e.preventDefault();
			fn_view();
	
		});// 회원정보
	
/* 		$(".indexCOMM").on("click", function(e) {
			e.preventDefault();
			fn_commList();
	
		}); //COMMList
	
		$(".indexQA").on("click", function(e) {
			e.preventDefault();
			fn_qaList();
	
		}); //QAList */
		
		
	
	});//ready
</script>
</html>

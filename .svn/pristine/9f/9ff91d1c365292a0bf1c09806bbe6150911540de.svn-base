<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WINE VINTAGE</title>
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/info.css"/>">
<%request.setCharacterEncoding("utf-8"); %>
<%@include file="/WEB-INF/inc/header.jsp"%>
<style>
.info {
	border: black;
	background: black;
	margin-right: 5px;
	margin-top: 30px;
	color: white;
}

.info:hover {
	background: black;
	color: #a40000;
}

.info:focus {
	background-color: #a40000;
	color: white;
}

.btnEdit {
	border: black;
	background: black;
	color: white;
}

.tableInfo th {
	width: 20%;
}
/* 	.commListTable {
		margin-bottom: 25px;
	} */
/* 	.qaListTable {
		margin-bottom: 25px;
	} */
.text_container {
	border-bottom: 1px solid #ddd;
}

.memZip {
	width: 20%;
}
/* tbody {
	height: 400px;
}	 */
.text_container {
	height: 50px;
}

.tabs {
	padding-bottom: 20px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	width: 60%;
	margin: auto;
	margin-top: 85px;
}

.indexView {
	width: 10%;
	height: 50px;
	border-bottom: 3px solid #333333;
	background-color: #f8f8f8;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	color: #333333;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.2s ease;
}

.indexCOMM {
	width: 10%;
	height: 50px;
	border-bottom: 3px solid #333333;
	background-color: #f8f8f8;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	color: #333333;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.2s ease;
}

.indexQA {
	width: 10%;
	height: 50px;
	border-bottom: 3px solid #333333;
	background-color: #f8f8f8;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	color: #333333;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.2s ease;
}

.ad {
	width: 70%;
	height: 50px;
	border-bottom: 3px solid #333333;
	background-color: #f8f8f8;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	color: #333333;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.2s ease;
}

.indexView:hover {
	opacity: 0.75;
}

.indexCOMM:hover {
	opacity: 0.75;
}

.indexQA:hover {
	opacity: 0.75;
}

#all {
	display: none;
}

#programming {
	display: none;
}

#design {
	display: none;
}

#a {
	display: none;
}

/* 탭 컨텐츠 스타일 */
tab div {
	display: none;
	padding: 40px 40px 0;
	clear: both;
	overflow: hidden;
}

#all:checked ~ #view_area, #programming:checked ~ #commList_area,
	#design:checked ~ #qaList_area {
	display: block;
}

/* 선택된 탭 스타일 */
.tabs input:checked+.indexView {
	background-color: #333333;
	color: #fff;
}

.tabs input:checked+.indexCOMM {
	background-color: #333333;
	color: #fff;
}

.tabs input:checked+.indexQA {
	background-color: #333333;
	color: #fff;
}
</style>
</head>
<body>

	<div class="tabs">
		<input id="all" type="radio" name="item" checked> <label
			class="indexView" for="all">INFO</label> <input id="programming"
			type="radio" name="item"> <label class="indexCOMM"
			for="programming">COMM</label> <input id="design" type="radio"
			name="item"> <label class="indexQA" for="design">Q&A</label>

		<input id="a"> <label class="ad" for="a"></label>
		<div id="view_area"></div>
		<div id="detailEdit2"></div>
		<table align="center" class="commListTable2"
			style="width: 100%; text-align: center; display: block; height: 100px; background: #ddd;">
			<thead class="thead">
				<tr align="center" height="50n">
					<th width="6%">번호</th>
					<th width="10%" style="padding-right: 41px;">제목</th>
					<th width="7%" style="padding-right: 3px;">등록일자</th>
					<th width="3%" style="padding-right: 43px;">조회수</th>
				</tr>
			</thead>
			<tbody class="tbody">
			</tbody>
		</table>
		<div id="commList_area"></div>
		<div class="row text-center" id="list_more">
			<a id="btn_list_more"
				class="btn btn-sm btn-default col-sm-10 col-sm-offset-1"
				style="margin-left: 100px;"> <span
				class="glyphicon glyphicon-chevron-down" aria-hidden="true"><i
					class="bi bi-chevron-down"></i></span>
			</a>
		</div>
		<div id="qaList_area"></div>
		<div class="row text-center" id="list_more2">
			<a id="btn_list_more2"
				class="btn btn-sm btn-default col-sm-10 col-sm-offset-1"
				style="margin-left: 100px;"> <span
				class="glyphicon glyphicon-chevron-down" aria-hidden="true"><i
					class="bi bi-chevron-down"></i></span>
			</a>
		</div>
	</div>


	<!-- <div style="display: flex; margin-bottom: 30px; margin-left: 43%;">
	<div class="indexView">
		<button type="button" class="btn info">INFO</button>
	</div>
	<div class="indexCOMM">
		<button type="button" class="btn info">COMM</button>
	</div>
	<div class="indexQA">
		<button type="button" class="btn info">Q&A</button>
	</div>
</div> -->

	<input type="hidden" class="memId" value="${member.memId }">




	<!-- <div id="view_area"></div> -->
	<!-- <div id="view_area2">
		<button type="button" class="btnEdit">btnEdit</button>
	</div> -->

	<form name="frm_edit"
		action="<c:url value='/mypage/memberEditModify.wow' />" method="post"
		onsubmit="return false;">
		<div id="detailEdit"></div>
	</form>

	<!-- 	 <table align = "center" class="commListTable2"style="width: 1080px; text-align: center;" >
					<thead class="thead">
					<tr align="center" height="50n">
					<th width="5%">번호</th>
					<th width="12%">제목</th>
					<th width="8%">등록일자</th>
					<th width="3%">조회수</th></tr>

					</thead>
					<tbody class="tbody">
		</tbody></table> -->


	<!-- 	<div id="commList_area"></div>
	 <div class="row text-center" id="list_more">
	    <a id="btn_reply_list_more" class="btn btn-sm btn-default col-sm-10 col-sm-offset-1">
	        <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	        더보기 
	    </a>
	</div> -->




<!--  	<div id="qaList_area"></div>

	<div class="row text-center" id="list_more2">
		<a id="btn_reply_list_more2"
			class="btn btn-sm btn-default col-sm-10 col-sm-offset-1"> <span
			class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
			더보기
		</a>
	</div>  -->


</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="<c:url value='/resources/myjs.js'/>"></script>
<script type="text/javascript">

	

	function fn_view() {
		$(".text-center1").hide();
		$(".text-center2").hide();
		$("#list_more").hide();
		$("#list_more2").hide();
		$(".commListTable2").hide();
	
		fn_empty();
		$('.btnEdit').remove();
		$.ajax({
			url : "<c:url value='/mypage/memberDetail.wow' />"
			,type : 'post'
			,data : {"memId" : memId} 
			,dataType: "JSON"
			,success : function (data) {
				console.log(data);
	
			var element = data.data;
			let str="";
			str = '<table style="width: 900px; margin: auto; display: block; padding-top: 150px; height: 500px;" class="tableInfo"><tbody><tr><th>회원명</th><td class="memName">'+ element.memName +'</td></tr>'
			+ '<tr><th>아이디</th><td class="memId">'+ element.memId +'</td></tr>'
			+ '<tr><th>패스워드</th><td class="memPass"><input type="password" value="'+element.memPass+'"></td></tr>'
			+ '<tr><th>생일</th><td class="memBir">'+ element.memBir +'</td></tr>'
			+ '<tr><th>번호</th><td class="memHp">'+ element.memHp +'</td></tr>'
			+ '<tr><th>주소</th>'+'<td class="memZip">'+ element.memZip +'</td></tr>'+'<tr><td></td><td class="memAdd1" style="width:35%;">'+ element.memAdd1 +'</td>'+'<td class="memAdd2" style="width:30%;">'+ element.memAdd2 +'</td>'+'</tr>'
			+ '<tr><th>이메일</th><td class="memMail">'+ element.memMail +'</td></tr>'
			+ '<tr><th>와인횟수</th><td class="memDrink">'+ element.memDrink +'</td></tr>'
			+ '<tr><th>와인기념</th><td class="memAnn">'+ element.memAnn +'</td></tr></tbody></table>';
			
	        console.log(str);
	        
	        $('#view_area').append(str);
	        
	/*         var strr = '<td><button type="button" class="btnEdit">btnEdit</button>';
			  console.log(strr)    */     
		 	  if($('.btnEdit').length == 0) { 
	        	$('#view_area').append('<button type="button" class="btnEdit btn" style="margin-left: 1000px; margin-bottom: 20px;">수정</button>');
			  }
	         
	        
			}, error : function (err) {
				console.log(err.status);
			}
	
		});  //View ajax
	} //function 
	
	
   $(document).on("click",".btnEdit", function (e) {  	
    	fn_empty();
		$(document).off('click');
		e.preventDefault();
    	$.ajax({
		url : "<c:url value='/mypage/memberDetailEdit.wow' />"
		,type : 'post'
		,data : {"memId" : memId} 
		,dataType: "JSON"
		,success : function (data) {
			console.log(data);
			var element = data.data;
			let str="";
			str = '<table style="width: 900px; margin: auto; margin-bottom: 22px; margin-top: 50px;" class="tableEdit"><tbody><tr><th>회원명</th><td class="memName"><input type="text" name="memName" value="'+ element.memName +'"></td></tr>'
			+ '<tr><th>아이디</th><td class="memId"><input type="text" name="memId" value="'+ element.memId +'"></td></tr>'
			+ '<tr><th>패스워드</th><td class="memPass"><input type="password" name="memPass" value="'+element.memPass+'"></td></tr>'
			+ '<tr><th>생일</th><td class="memBir"><input type="text" name="memBir" value="'+ element.memBir +'"></td></tr>'
			+ '<tr><th>번호</th><td class="memHp"><input type="text" name="memHp" value="'+ element.memHp +'"></td></tr>'
			+ '<tr><th>주소</th>'+'<td class="memZip"><input type="text" id="memZip" name="memZip" placeholder="우편번호" value="'+element.memZip+'"><br></td>'+'<td><input style="border: none; background: black; color: #fff; border-radius: 5px;" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td></tr>'
			+ '<tr><th></th>'+'<td class="memAdd1"><input type="text" name="memAdd1" id="memAdd1" placeholder="주소" value="'+element.memAdd1+'"></td>'+'<td class="memAdd2"><input type="text" name="memAdd2" id="memAdd2" placeholder="참고항목" value="'+element.memAdd2+'"></td>'+'</tr>'			
			+ '<tr><th>이메일</th><td class="memMail"><input type="text" name="memMail" value="'+ element.memMail +'"></td></tr>'
			+ '<tr><th>와인횟수</th><td class="memDrink"><input type="text" name="memDrink" value="'+ element.memDrink +'"></td></tr>'
			+ '<tr><th>와인기념</th><td class="memAnn"><input type="text" name="memAnn" value="'+ element.memAnn +'"></td></tr></tbody></table>'; 			
	        console.log(str);
	        
	        $('#detailEdit').append(str);
	   
	        var btnModify = '<td><button style="border: none; background: black; color: #fff; border-radius: 5px; margin-left: 900px;" type="submit" class="btnModify">수정완료</button>';
	        var btnDelete = '<td><button style="border: none; background: black; color: #fff; border-radius: 5px; margin-left: 10px;" type="submit" onclick="test()" class="btnDelete">회원탈퇴</button>'
			  console.log(btnModify);        
			  console.log(btnDelete);       
	      $('#detailEdit').append(btnModify);
	      $('#detailEdit').append(btnDelete); 
			return false;

			}, error : function (err) {
			console.log(err.status);
		}
    }); // edit ajax
	}); //btnEdit버튼 클릭
		
	
/* 	let memName = $(".memName").val();
	let memPass = $(".memPass").val();
	let memBir = $(".memBir").val();
	let memHp = $(".memHp").val();
	let memZip = $(".memZip").val();
	let memAdd1 = $(".memAdd1").val();
	let memAdd2 = $(".memAdd2").val();
	let memMail = $(".memMail").val();
	let memDrink = $(".memDrink").val();
	let memAnn = $(".memAnn").val();
 */
	$("#detailEdit").on("click",".btnModify", function (e) {
    	//fn_empty();
		$(document).off('click');
		
		e.preventDefault();
		//params = {"memId" : memId , "memName" : memName , "memBir" : memBir, "memHp" : memHp, "memZip" : "memZip", "memAdd1" : memAdd1 , "memAdd2" : memAdd2, "memMail" : memMail, "memDrink" : memDrink, "memAnn" : memAnn}
		var params = $("form[name='frm_edit']").serialize();
		console.log($("form[name='frm_edit']"));
		$.ajax({
			url : "<c:url value='/mypage/memberEditModify.wow' />"
			,type : 'post'
			,data : params
			,dataType : 'JSON'
			,success: function () {
				//location.href= "<c:url value='/member/memberDetail.wow' />"
			}
		}); //ajax
	}); //회원정보수정
	
	

	    function test() {
	        if (!confirm("정말 탈퇴하시겠습니까?")) {
	            alert("메인 화면으로 돌아갑니다.");
	            location.href= "<c:url value='/main/home.wow' />"
	        } else {
	            alert("회원 탈퇴가 완료 되었습니다.");
	            btnDelete();
	        }
	    }
	
	
		function  tab() {
			//alert("all");
			/*
 			if($("input[type=radio]:checked")){
 				$("input:checked").prop('checked', false);
 				if($("input:radio[id='programming']") || $("input:radio[id='design']") || $("input:radio[id='all']").on('click')){
	 				if($("input:radio[id='programming']").on('click')){
	 					alert("comm");
		 				$("input:radio[id=' ']").prop("checked", true);
	 				} else if($("input:radio[id='design']").on('click')){
	 					alert("qa");
	 					$("input:radio[id='design']").prop("checked", true);
	 				} else if	($("input:radio[id='all']").on('click')){
	 					alert("view");
	 					$("input:radio[id='all']").prop("checked", true);
	 				} 					
 				}
	  			// $("").attr("checked", true); 
 			}
 			*/
 			
 
				let type = $("input:radio[name='item']:checked").val();
				console.log("type", type);
				$("input:checked").prop('checked', false);
				if(type == "INFO"){
					alert("info");
				}else if(type == "COMM"){
					alert("comm");
				}else{
					alert("Q&A");
					$("input:radio[id='all']").prop("checked", true);
				}
		 
	  			// $("").attr("checked", true); 
 		}
		
	
			
	//$("#detailEdit").on("click",".btnDelete", function (e) {
		function btnDelete() {
		//e.preventDefault();
		
		$.ajax({
			url : "<c:url value='/mypage/memberDetailDelete' />"
			,type : "POST"
			,data : {"memId" : memId}
			,dataType: 'JSON'
			,success: function () {
				location.href= "<c:url value='/login/logout.wow' />";
			}
		}) //ajax
	}; //회원탈퇴버튼

	
		
	var paramQC = {"curPage":1, "rowSizePerPage":10, "memId" : memId};
	
	
	function fn_commList(vs) {
		$("#list_more").show();
		$("#list_more2").hide();
		$(".commListTable2").show();
		if(vs==="tab"){
			fn_empty();
			paramQC.curPage = 1;
		}
		
		$.ajax({
			url : "<c:url value='/mypage/memberCommList' />"
			,type : 'post'
			,data : paramQC
			,dataType : "JSON"
			,success: function (data) {
				
			let sstr = "";
			sstr = '<table align = "center" class="commListTable" >'
		/* 			+ '<thead class="thead">'
					+ '<tr align="center" height="50n">'
						+ '<th>번호</th>'
						+ '<th>제목</th>'
						+ '<th>등록일자</th>'
						+ '<th>조회수</th></tr>'
					+ '</thead>' */
					+ '<tbody class="tbody">'
						
					
						$.each(data.data, function (i, comm) {
						sstr += '<tr class="text_container" align="center" height="50n" style="width=1200px">'
								+ '<td width="5%">'+comm.commNo+'</td>'
								+ '<td width="12%"><a href="<%=request.getContextPath()%>/comm/commView.wow?commNo='+comm.commNo+'" class="comm_title">'+comm.commTitle+'</a></td>'
								+ '<td width="8%">'+comm.commRegDate+'</td>'
								+ '<td width="3%">'+comm.commHit+'</td>'
								+ '</tr>'
						}); //
					
						
					sstr += '</tbody></table>' 	

					console.log(sstr);

					$("#commList_area").append(sstr);

					paramQC.curPage+=1;
			}
		})//ajax
	} //commList
	
	
	
	function fn_qaList(vs) {
		$("#list_more").hide();
		$("#list_more2").show();
		$(".commListTable2").show();
		if(vs==="tab"){
			fn_empty();
			paramQC.curPage = 1;
		}
		
		$.ajax({
			url : "<c:url value='/mypage/memberQaList' />"
			,type : 'post'
			,data : paramQC
			,dataType : "JSON"
			,success: function (data) {
				//alert("success");
				let sttr="";
				sttr = '<table class="qaListTable" align = "center">'
					/* + '<thead class="thead">'
					+ '<tr align="center" class="tr" height="50n">'
						+ '<th>번호</th>'
						+ '<th>제목</th>'
						+ '<th>등록일자</th>'
						+ '<th>조회수</th></tr>'
					+ '</thead>' */
					+ '<tbody class="tbody">'
						
						$.each(data.data, function (i, qa) {
							sttr += '<tr class="text_container" align="center">'
								+ '<td width="5%" style = "padding-left:8px;">'+qa.qaNo+'</td>'
								+ '<td width="12%"><a href="<%=request.getContextPath()%>/qa/qaView.wow?qaNo='+qa.qaNo+'" class="qa_title">'+qa.qaTitle+'</a></td>'
								+ '<td width="8%">'+qa.qaRegDate+'</td>'
								+ '<td width="3%" style = "padding-right:13px;">'+qa.qaHit+'</td>'
								+ '</tr>'
							
						}); //
						
						sttr += '</tbody></table>' 				
					
					console.log(sttr);
					
					$("#qaList_area").append(sttr);

					paramQC.curPage += 1;

			}
		})//ajax
	} //qaList

	function indexView() {
		
	}	
	
	$(document).ready(function() {
		fn_view();
		$(".indexView").on("click", function(e) {
			e.preventDefault();
			fn_view();
			$("input:radio[id='all']").prop("checked", true);
		});// 회원정보

		$(".indexCOMM").on("click", function(e) {
			e.preventDefault();
			fn_commList("tab");
			$("input:radio[id='programming']").prop("checked", true);
		}); //COMMList

		$(".indexQA").on("click", function(e) {
			e.preventDefault();
			fn_qaList("tab");
			$("input:radio[id='design']").prop("checked", true);
		}); //QAList

		$("#list_more").on("click", function(e) {
			e.preventDefault();
			fn_commList("more");
		});
		$("#list_more2").on("click", function(e) {
			e.preventDefault();
			fn_qaList("more");
		});

	});//ready
</script>
</html>

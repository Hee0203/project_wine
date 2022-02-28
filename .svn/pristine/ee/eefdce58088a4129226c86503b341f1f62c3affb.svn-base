<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
	<div class="indexView">
		<button type="button">View</button>
	</div>
	<div class="indexCOMM">
		<button type="button">COMM</button>
	</div>
	<div class="indexQA">
		<button type="button">QA</button>
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

	<div id="commList_area"></div>

	<nav class="text-center1">
		<ul class="pagination">
			<li><a href="#" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
			<c:if test="${commSearchVO.firstPage!=1 }">
				<li><a href="#" data-page="${commSearchVO.firstPage-1 }"><span
						aria-hidden="true">&lt;</span></a></li>
			</c:if>

			<c:forEach begin="${commSearchVO.firstPage }"
				end="${commSearchVO.lastPage }" var="i">
				<c:if test="${commSearchVO.curPage !=i }">
					<li><a href="#" data-page="${i }">${i }</a></li>
				</c:if>
				<c:if test="${commSearchVO.curPage == i }">
					<li class="active"><a href="#">${i }</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${commSearchVO.lastPage!=searchVO.totalPageCount }">
				<li><a href="#" data-page="${commSearchVO.lastPage+1 }"><span
						aria-hidden="true">&gt;</span></a></li>
			</c:if>

			<li><a href="#" data-page="${commSearchVO.totalPageCount }"><span
					aria-hidden="true">&raquo;</span></a></li>
		</ul>
	</nav>


	<div id="qaList_area"></div>

	<nav class="text-center2">
		<ul class="pagination">
			<li><a href="#" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
			<c:if test="${qaSearchVO.firstPage!=1 }">
				<li><a href="#" data-page="${qaSearchVO.firstPage-1 }"><span
						aria-hidden="true">&lt;</span></a></li>
			</c:if>

			<c:forEach begin="${qaSearchVO.firstPage }"
				end="${qaSearchVO.lastPage }" var="i">
				<c:if test="${qaSearchVO.curPage !=i }">
					<li><a href="#" data-page="${i }">${i }</a></li>
				</c:if>
				<c:if test="${qaSearchVO.curPage == i }">
					<li class="active"><a href="#">${i }</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${qaSearchVO.lastPage!=qaSearchVO.totalPageCount }">
				<li><a href="#" data-page="${qaSearchVO.lastPage+1 }"><span
						aria-hidden="true">&gt;</span></a></li>
			</c:if>

			<li><a href="#" data-page="${qaSearchVO.totalPageCount }"><span
					aria-hidden="true">&raquo;</span></a></li>
		</ul>
	</nav>


	<%@include file="/WEB-INF/inc/footer.jsp"%>
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
				alert("success");
				console.log(data);
	
			var element = data.data;
			let str="";
			str = '<table><tbody><tr><th>회원명</th><td class="memName">'+ element.memName +'</td></tr>'
			+ '<tr><th>아이디</th><td class="memId">'+ element.memId +'</td></tr>'
			+ '<tr><th>패스워드</th><td class="memPass"><input type="password" value="'+element.memPass+'"></td></tr>'
			+ '<tr><th>생일</th><td class="memBir">'+ element.memBir +'</td></tr>'
			+ '<tr><th>번호</th><td class="memHp">'+ element.memHp +'</td></tr>'
			+ '<tr><th>주소</th>'+'<td class="memZip">'+ element.memZip +'</td>'+'<td class="memAdd1">'+ element.memAdd1 +'</td>'+'<td class="memAdd2">'+ element.memAdd2 +'</td>'+'</tr>'
			+ '<tr><th>이메일</th><td class="memMail">'+ element.memMail +'</td></tr>'
			+ '<tr><th>와인횟수</th><td class="memDrink">'+ element.memDrink +'</td></tr>'
			+ '<tr><th>와인기념</th><td class="memAnn">'+ element.memAnn +'</td></tr></tbody></table>';
			
	        console.log(str);
	        
	        $('#view_area').append(str);
	        
	/*         var strr = '<td><button type="button" class="btnEdit">btnEdit</button>';
			  console.log(strr)    */     
		 	  if($('.btnEdit').length == 0) { 
	        	$('#view_area').append('<button type="button" class="btnEdit">btnEdit</button>');
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
		url : "<c:url value='/member/memberDetailEdit.wow' />"
		,type : 'post'
		,data : {"memId" : memId} 
		,dataType: "JSON"
		,success : function (data) {
			alert("success");
			console.log(data);
			var element = data.data;
			let str="";
			 str = '<table><tbody><tr><th>회원명</th><td class="memName"><input type="text" name="memName" value="'+ element.memName +'"></td></tr>'
			+ '<tr><th>아이디</th><td class="memId"><input type="text" name="memId" value="'+ element.memId +'"></td></tr>'
			+ '<tr><th>패스워드</th><td class="memPass"><input type="password" name="memPass" value="'+element.memPass+'"></td></tr>'
			+ '<tr><th>생일</th><td class="memBir"><input type="text" name="memBir" value="'+ element.memBir +'"></td></tr>'
			+ '<tr><th>번호</th><td class="memHp"><input type="text" name="memHp" value="'+ element.memHp +'"></td></tr>'
			+ '<tr><th>주소</th>'+'<td class="memZip"><input type="text" id="memZip" name="memZip" placeholder="우편번호" value="'+element.memZip+'"><br></td>'+'<td class="memAdd1"><input type="text" name="memAdd1" id="memAdd1" placeholder="주소" value="'+element.memAdd1+'"></td>'+'<td class="memAdd2"><input type="text" name="memAdd2" id="memAdd2" placeholder="참고항목" value="'+element.memAdd2+'"></td>'+'<td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td></tr>   '
			+ '<tr><th>이메일</th><td class="memMail"><input type="text" name="memMail" value="'+ element.memMail +'"></td></tr>'
			+ '<tr><th>와인횟수</th><td class="memDrink"><input type="text" name="memDrink" value="'+ element.memDrink +'"></td></tr>'
			+ '<tr><th>와인기념</th><td class="memAnn"><input type="text" name="memAnn" value="'+ element.memAnn +'"></td></tr></tbody></table>'; 
			
	        console.log(str);
	        
	        $('#detailEdit').append(str);
	   
	        var btnModify = '<td><button type="submit" class="btnModify">btnModify</button>';
	        var btnDelete = '<td><button type="submit" class="btnDelete">btnDelete</button>'
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
		
	
	let memName = $(".memName").val();
	let memPass = $(".memPass").val();
	let memBir = $(".memBir").val();
	let memHp = $(".memHp").val();
	let memZip = $(".memZip").val();
	let memAdd1 = $(".memAdd1").val();
	let memAdd2 = $(".memAdd2").val();
	let memMail = $(".memMail").val();
	let memDrink = $(".memDrink").val();
	let memAnn = $(".memAnn").val();

	$("#detailEdit").on("click",".btnModify", function (e) {
    	//fn_empty();
		$(document).off('click');
		
		e.preventDefault();
		alert("Modify");
		params = {"memId" : memId , "memName" : memName , "memBir" : memBir, "memHp" : memHp, "memZip" : "memZip", "memAdd1" : memAdd1 , "memAdd2" : memAdd2, "memMail" : memMail, "memDrink" : memDrink, "memAnn" : memAnn}
		//$param = $('#detailEdit').find(str).text();
		/* $form = $(this).parents("form"); */
		var params = $("form[name='frm_edit']").serialize();
		console.log($("form[name='frm_edit']"));
		$.ajax({
			url : "<c:url value='/member/memberEditModify.wow' />"
			,type : 'post'
			,data : params
			,dataType : 'JSON'
			,success: function () {
				//location.href= "<c:url value='/member/memberDetail.wow' />"
			}
		}); //ajax
	}); //회원정보수정
	
			
	$("#detailEdit").on("click",".btnDelete", function (e) {
		e.preventDefault();
		alert("delete");
		
		$.ajax({
			url : "<c:url value='/member/memberDetailDelete' />"
			,type : "POST"
			,data : {"memId" : memId}
			,dataType: 'JSON'
			,success: function () {
				location.href= "<c:url value='/main/home.wow' />"
			}
		}) //ajax
	}); //회원탈퇴버튼
			
	
		
	
	
		
	function fn_commList() {
		$(".text-center2").hide()
	
		fn_empty();
		$.ajax({
			url : "<c:url value='/member/memberCommList' />"
			,type : 'post'
			,data : {"memId" : memId}
			,dataType : "JSON"
			,success: function (data) {
				alert("success");
				
			let sstr = "";
			sstr = '<table align = "center" class="commListTable">'
					+ '<thead class="thead">'
					+ '<tr align="center" height="50n">'
						+ '<th>번호</th>'
						+ '<th>제목</th>'
						+ '<th>등록일자</th>'
						+ '<th>조회수</th>'
					+ '</thead>'
					+ '<tbody class="tbody">'
						
						$.each(data.data, function (i, comm) {
						sstr += '<tr class="text_container" align="center" height="50n">'
								+ '<td>'+comm.commNo+'</td>'
								+ '<td><a href="<%=request.getContextPath()%>/comm/commView.wow?commNo='+comm.commNo+'" class="comm_title">'+comm.commTitle+'</a></td>'
								+ '<td>'+comm.commRegDate+'</td>'
								+ '<td>'+comm.commHit+'</td>'
								+ '</tr>'
							
						}); //
						
					sstr += '</tbody></table>' 				
					
					console.log(sstr);
					
					$("#commList_area").append(sstr);
					$(".text-center1").show()
					
					
				
				
			}
		})//ajax
	} //commList
	
	
	
	function fn_qaList() {
		$(".text-center1").hide()
	
		
		fn_empty();
		$.ajax({
			url : "<c:url value='/member/memberQaList' />"
			,type : 'post'
			,data : {"memId" : memId}
			,dataType : "JSON"
			,success: function (data) {
				alert("success");
				let sttr="";
				sttr = '<table align = "center">'
					+ '<thead class="thead">'
					+ '<tr align="center" class="tr" height="50n">'
						+ '<th>번호</th>'
						+ '<th>제목</th>'
						+ '<th>등록일자</th>'
						+ '<th>조회수</th>'
					+ '</thead>'
					+ '<tbody class="tbody">'
						
						$.each(data.data, function (i, qa) {
							sttr += '<tr class="text_container" align="center" height="50n">'
								+ '<td>'+qa.qaNo+'</td>'
								+ '<td><a href="<%=request.getContextPath()%>/qa/qaView.wow?qaNo='+qa.qaNo+'" class="qa_title">'+qa.qaTitle+'</a></td>'
								+ '<td>'+qa.qaRegDate+'</td>'
								+ '<td>'+qa.qaHit+'</td>'
								+ '</tr>'
							
						}); //
						
						sttr += '</tbody></table>' 				
					
					console.log(sttr);
					
					$("#qaList_area").append(sttr);
					$(".text-center2").show()
					
					
				
				
			}
		})//ajax
	} //qaList
		
		
	
		
	$(document).ready(function() {
		fn_view();
		$(".indexView").on("click", function(e) {
			e.preventDefault();
			fn_view();
	
		});// 회원정보
	
		$(".indexCOMM").on("click", function(e) {
			e.preventDefault();
			fn_commList();
	
		}); //COMMList
	
		$(".indexQA").on("click", function(e) {
			e.preventDefault();
			fn_qaList();
	
		}); //QAList
		
		
		//페이징 commPaging evnet
		$(".text-center1 li a[data-page]").on("click" ,function name() {
			//alert($(this).data("page"));
			
			
			$.ajax({
			url : "<c:url value='/member/memberCommList' />"
			,type : 'post'
			,data : {"memId" : memId , "curPage" : $(this).data("page")}
			,dataType : "JSON"
			,success: function (data) {
				console.log(data);
				
				fn_empty();	
				
				let sstr = "";
				sstr = '<table align = "center" class="commListTable">'
						+ '<thead class="thead">'
						+ '<tr align="center" height="50n">'
							+ '<th>번호</th>'
							+ '<th>제목</th>'
							+ '<th>등록일자</th>'
							+ '<th>조회수</th>'
						+ '</thead>'
						+ '<tbody class="tbody">'
							
							$.each(data.data, function (i, comm) {
							sstr += '<tr class="text_container" align="center" height="50n">'
									+ '<td>'+comm.commNo+'</td>'
									+ '<td><a href="<%=request.getContextPath()%>/comm/commView.wow?commNo='+comm.commNo+'" class="comm_title">'+comm.commTitle+'</a></td>'
									+ '<td>'+comm.commRegDate+'</td>'
									+ '<td>'+comm.commHit+'</td>'
									+ '</tr>'
								
							}); //
							
						sstr += '</tbody></table>' 				
						
						console.log(sstr);
						
						$("#commList_area").append(sstr);
				
				
			}
			
		});
			
		}) //commList
	
		
		
		
		//페이징 qaPaging evnet
		$(".text-center2 li a[data-page]").on("click" ,function name() {
			//alert($(this).data("page"));
			
			var curPage =$(this).data("page");
			$.ajax({
				url : "<c:url value='/member/memberQaList' />"
				,type : 'post'
				,data : {"memId" : memId , "curPage" : $(this).data("page")}
				,dataType : "JSON"
				,success: function (data) {
					fn_empty();	
					let sttr="";
					sttr = '<table align = "center">'
						+ '<thead class="thead">'
						+ '<tr align="center" class="tr" height="50n">'
						+ '<th>번호</th>'
						+ '<th>제목</th>'
						+ '<th>등록일자</th>'
						+ '<th>조회수</th>'
						+ '</thead>'
						+ '<tbody class="tbody">'
						$.each(data.data, function (i, qa) {
							sttr += '<tr class="text_container" align="center" height="50n">'
								+ '<td>'+qa.qaNo+'</td>'
								+ '<td><a href="<%=request.getContextPath()%>/qa/qaView.wow?qaNo="'+ qa.qaNo
								+ 'class="qa_title">'+ qa.qaTitle+'</a></td>'
								+ '<td>'+ qa.qaRegDate+ '</td>'
								+ '<td>'+ qa.qaHit+ '</td>'
								+ '</tr>'
						}); //
	
						sttr += '</tbody></table>'
						$("#qaList_area").append(sttr);
				}
			});
		}); //qaList
	});//ready
</script>
</html>

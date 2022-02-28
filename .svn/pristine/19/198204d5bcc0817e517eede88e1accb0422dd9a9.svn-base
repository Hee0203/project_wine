<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wine Vintage</title>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/view.css"/>" >
<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>

	<div>
		<h3 align="center">Q & A</h3>
	</div>

<div class="container">
<table class="table-bordered" align="center">
	<colgroup>
		<col width="5%">
		<col width="5%">
		<col width="10%">
		<col width="45%">
		<col width="10%">
	</colgroup>
	<tbody align="center">
		<tr>
			<th>조회수</th>
			<td>${qa.qaHit }</td>
			<td>${qa.qaMemName }</td>
			<td>${qa.qaTitle }</td>
			<td>${qa.qaRegDate}</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="3" style="height:300px;">${qa.qaContent }</td>
		</tr>
		<tr>
			<th colspan="2">첨부파일</th>
			<td colspan="3">
				<c:forEach var="f" items="${qa.attaches }" varStatus="st">
					<div> 파일 ${st.count } <a href="<c:url value='/attach/qa/download/${f.atchNo }' />" target="_blank">
					<span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
					</a> Size: ${f.atchFancySize} Down : ${f.atchDownHit}
					</div>
				</c:forEach>
			
			</td>
		</tr>
		
		<tr id="btn_home">
			<td colspan="5">
					<a style="background-color: black; color: white;" href="qaList.wow" class="btn btn-default btn-sm">
						<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
						목록
					</a>
					<a style="background-color: black; color: white;" href="qaEdit.wow?qaNo=${qa.qaNo }" class="btn success btn-sm">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						수정
					</a>
			</td>
		</tr>
	</tbody>
</table>
	
<div class="container" align="center" id="write_reply">
	<div>
	<!-- Start Reply Regist -->
	<c:if test="${USER_INFO.userId eq 'user01' or USER_INFO.userId eq 'user02' or USER_INFO.userId eq 'user03' or USER_INFO.userId eq 'user04'}">
		<form action="<c:url value='/reply/replyRegist'/>" name="form_reply"
			method="post" onclick="return false;">
			<input type="hidden" name="reParentNo" value="${qa.qaNo}">
			<input type="hidden" name="reCategory" value="QA"> 
			<input type="hidden" name="reMemId" value="${USER_INFO.userId}">
			<input type="hidden" name="reMemName" value="${USER_INFO.userName }">
			<div class="form-group">
				<label>댓글</label>
				<div id="textarea_div">
					<textarea name="reContent">${reContent }</textarea>
				</div>
				<div>
					<button id="btn_reply_regist" type="button">등록</button>
				</div>
			</div>
		</form>
		</c:if>
	</div>
	<!-- End Reply Regist -->

	<div id="reply_list_area">
		<!-- Start Reply List -->

	</div>
	<!-- End Reply List -->
</div>
<!-- End Reply Container  -->
</div>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
<script type="text/javascript">
// 파라미터 받기
var params={"curPage":1, "rowSizePerPage" : 10, "reCategory" : "QA", "reParentNo":${qa.qaNo} };
	// ajax 호출 후 DB에 있는 reply 데이터 가지고 옴
	// 가지고 오면 (success)하면 댓글 div 만들고. . .
	// list를 가지고 오기 때문에 jquery 반복분 써서 div 여러개 생성
		// 내가 쓴 글이면 보이고 아니면 안보이게
function fn_reply_list(){
	$.ajax({
		url: "<c:url value='/reply/replyList'/>",
		data: params,
		dataType: "JSON",
		type:"POST",
		success: function(data){
			console.log(data);
			$.each(data.data, function(i, e){				
				var str="";
				str += '<div id="reply_div_qa" class="row" data-re-no="'+e.reNo+'">'
						+'<div id="wrap_div"><div id="re_reMemId">'+e.reMemName+'</div>'
						+'<div id="re_reRegDate">'+e.reRegDate+'</div></div>'
						+'<div id="re_reContent"><pre>'+e.reContent+'</pre></div>';
				if(e.reMemId == '${USER_INFO.userId}'){
					str += '<div><button type="button" name="btn_reply_delete" class="btn btn-sm btn-danger" id="btn_reply_delete">삭제</button></div>';
				}
				str += '</div>';
				console.log(str);
				$('#reply_list_area').append(str);
			});
			params.curPage += 1;
		}
	});	 // ajax
} // fn_reply_list()


$(document).ready(function(){
	fn_reply_list();
		
	// 등록버튼
	$('#btn_reply_regist').on("click", function(e){
		// form태그 기본 이벤트 막기
		e.preventDefault();
		
		$form = $(this).closest('form[name="form_reply"]');
		$.ajax({
			url: "<c:url value='/reply/replyRegist'/>",
			data: $form.serialize(),
			dataType: 'json',
			type: "POST",
			success: function(data){
				console.log(data);
				$('#reply_list_area').html('');
				params.curPage = 1;
				fn_reply_list();
			}
		});
	});

	$('#reply_list_area').on("click", "button[name='btn_reply_delete']", function(e){
		e.preventDefault();
		$div = $(this).closest('.row');
		reNo = $div.data('re-no');
		reMemId = '${USER_INFO.userId}';
		$.ajax({
			url: '<c:url value="/reply/replyDelete"/>',
			data : {"reNo" : reNo, "reMemId" : reMemId},
			dataType : "JSON",
			type: "POST",
			success: function(data){
				$div.remove();
			}
		});
		
	});
});


</script>
</html>




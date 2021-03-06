<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
	<div>
		<h3 align="center">커뮤니티 게시판</h3>
		<hr>
	</div>
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
				<td>${comm.commHit }</td>
				<td>${comm.memId }</td>
				<td>${comm.commTitle }</td>
				<td>${comm.commRegDate}</td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
				<td colspan="3">${comm.commContent }</td>
			</tr>
			<tr>
				<th colspan="2">첨부파일 넣는 곳</th>
				<td colspan="3">링크</td>
			</tr>
			<tr>
				<td colspan="5"><a href="commList.wow"
					class="btn btn-default btn-sm"> <span
						class="glyphicon glyphicon-list" aria-hidden="true"></span>
						&nbsp;&nbsp;목록
				</a> <a href="commEdit.wow?commNo=${comm.commNo }"
					class="btn btn-success btn-sm"> <span
						class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 수정
				</a></td>
			</tr>
		</tbody>
	</table>

	<div class="container" align="center">
		<div>
			<!-- Start Reply Regist -->
			<form action="<c:url value='/reply/replyRegist'/>" name="form_reply"
				method="post" onclick="return false;">
				<input type="hidden" name="reParentNo" value="${comm.commNo}">
				<input type="hidden" name="reCategory" value="COMM"> <input
					type="hidden" name="reMemId" value="${USER_INFO.userId}">
				<div class="form-group">
					<label>댓글</label>
					<div>
						<textarea rows="5" cols="50" name="reContent">${reContent }</textarea>
					</div>
					<div>
						<button id="btn_reply_regist" type="button">등록</button>
					</div>
				</div>
			</form>
		</div>
		<!-- End Reply Regist -->

		<div id="reply_list_area">
			<!-- Start Reply List -->

		</div>
		<!-- End Reply List -->

		<div id="reply_edit_modal" class="modal fade">
			<!-- Start Reply Modify -->
			<div class="modal-dialog">
				<div class="modal-content">
					<form name="form_reply_edit"
						action="<c:url value='/reply/replyModify'/>" method="post"
						onclick="return false;">
						<div class="modal-header">
							<button type="button" data-dissmiss="modal">X</button>
						</div>
						<div class="modal-body">
							<input type="hidden" name="reNo" value="">
							<textarea rows="5" cols="50" name="reContent"></textarea>
							<input type="hidden" name="reCategory" value="COMM">
							<input type="hidden" name="reMemId" value="${USER_INFO.userId }">
						</div>
						<div class="modal-footer">
							<button id="btn_reply_modify" type="button">저장</button>
							<button type="button" data-dismiss="modal">닫기</button>
						</div>
					</form>
				</div>
			</div>

		</div>
		<!-- End Reply Modify -->

	</div>
	<!-- End Reply Container  -->



	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
<script type="text/javascript">
// 파라미터 받기
var params={"curPage":1, "rowSizePerPage" : 10, "reCategory" : "COMM", "reParentNo":${comm.commNo}};
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
				str += '<div class="row" data-re-no="'+e.reNo+'">'
						+'<div>'+e.reMemId+'</div>'
						+'<div>'+e.reRegDate+'</div>'
						+'<div><pre>'+e.reContent+'</pre></div>';
				if(e.reMemId == '${USER_INFO.userId}'){
					str += '<div><button type="button" name="btn_reply_modify">수정</button>'
							+'<button type="button" name="btn_reply_delete">삭제</button></div>';
				}
				str += '</div>';
				console.log(str);
				$('#reply_list_area').append(str);
			});
			params.curPage += 1;
		}
	});	 // ajax
} // fn_reply_list()
		
// selector : 아무것도 안쓰면 그냥 태그이름, #, ., [type, name, href, aa='value' , ,], 띄어쓰기는 자식, eq(), first, last
// jQuery selector로 찾은 태그는 jQuery객체, jQuery객체에만 jQuery함수 사용 가능
// javascript로 찾은 태그는 javascript객체, javascript객체에만 javascript함수 사용 가능

// jQuery객체에서 특정 함수나 배열을 사용하면 javascript객체를 반환하기도 함
// javascript객체를 jQuery객체로 만들기 =>  $(javascript 객체)

$(document).ready(function(){
	fn_reply_list();
		
	// 등록버튼
	$('#btn_reply_regist').on("click", function(e){
		// form태그 기본 이벤트 막기
		e.preventDefault();
		// 등록 버튼의 상위form 찾기 
		// ajax 호출 - form태그.serialize() - 해당 form태그 안에 있는 input, textarea, select태그 - 전부 파라미터로 만들 {"reCategory":"", "reParentNo":"",,,}
		// success 하면 등록 영역에 썼던 내용 지우기 
		// 댓글 목록에 내용 지우고 html('') 다시 fn_reply_list() - 새로 등록된 댓글이 맨 위에 나옴
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
			
	// 수정버튼
	// fucntion(){} 은 동적으로 생긴 태그에도 적용이 되는 것 같음(확실하지 않다)
	// $().click()은 동적으로 생긴 태그에 적용 x
	// $().on("click") 동적으로 생긴 태그에 적용o
	$('#reply_list_area').on("click","button[name='btn_reply_modify']", function(e){
		e.preventDefault();
		var content = $(this).closest('.row').find('pre').text();
		var reno = $(this).closest('.row').data('re-no');
		
		$('input[name="reNo"]').val(reno);
		$('#reply_edit_modal').modal('show');
		$('#reply_edit_modal').modal('show').find('textarea').val(content);
		
		
		// 모달창의 저장버튼 
		// modify ajax 요청
		// 파라미터로 글 번호, 글 내용
		// ajax 성공 후 modal창 닫기, list 삭제 후 params.curPage=1, fn_reply_list
		// optional : modal창에 있는 reNo, rextarea 내용 지우기
		

		
	});

	//모달창 저장버튼 
		$('#btn_reply_modify').on("click",function(e){
			e.preventDefault();
			 	$form = $(this).closest('form[name="form_reply_edit"]');
			 	
			$.ajax({
				url: '<c:url value="/reply/replyModify"/>',
				data: $form.serialize(),
				dataType:"JSON",
				type:"POST",
				success: function(data){
					console.log(data);
					$('#reply_edit_modal').modal('hide');
					$('#reply_list_area').html('');
					params.curPage=1;
					fn_reply_list();
					
					$('#reply_edit_modal').find('input[name="reno"]').val('');
					$('#reply_edit_modal').find('textarea').val('');
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
	// 삭제버튼
	// 파라미터는 reNo, reMemId 넘기기
	// ajax 호출 후 success에서 목록 지우고 param.curPage=1, fn_reply_list 대신에 목록 영역에서 해당 댓글 div 삭제
	
	
	
});


</script>

</html>
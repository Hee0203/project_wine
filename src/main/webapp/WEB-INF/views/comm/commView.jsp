<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>WINE VINTAGE</title>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/view.css"/>" >

<%@include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
	<div style="background: black;">
		<h3 align="center">커뮤니티 게시판</h3>
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
				<td>${comm.commHit }</td>
				<td>${comm.memId }</td>
				<td>${comm.commTitle }</td>
				<td>${comm.commRegDate}</td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
				<td colspan="3" style="height:300px;">${comm.commContent }</td>
			</tr>
			<tr>
				<th colspan="2">첨부파일</th>
				<td colspan="3">
 				<c:forEach var="f" items="${comm.attaches}" varStatus="st">
					<div> 파일 ${st.count} <a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank" > 
					<span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
					</a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}
					</div>
				</c:forEach> 
				</td> 
			</tr>
 			<tr id="btn_home">
				<td colspan="5"><a style="background-color: black; color: white;" href="commList.wow"
					class="btn btn-default btn-sm"> <span
						class="glyphicon glyphicon-list" aria-hidden="true"></span>
						목록
				</a> <a style="background-color: black; color: white;" href="commEdit.wow?commNo=${comm.commNo }"
					class="btn success btn-sm"> <span id="btn_modify"
						class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 수정
				</a></td>
			</tr>
		</tbody>
	</table>
	
	

	<div class="container" id="write_reply" align="center">
		<div>
			<!-- Start Reply Regist -->
			<form action="<c:url value='/reply/replyList'/>" name="form_reply"
				method="post" onclick="return false;">
				<input type="hidden" name="reParentNo" value="${comm.commNo}">
				<input type="hidden" name="reCategory" value="COMM"> <input
					type="hidden" name="reMemId" value="${USER_INFO.userId}">
				<input type="hidden" name="reMemName" value="${USER_INFO.userName }">
				<div class="form-group">
					<label>댓글쓰기</label>
					<div id="textarea_div">
						<textarea name="reContent">${reContent }</textarea>
					</div>
					<div>
						<button id="btn_reply_regist" type="button">등록</button>
					</div>
				</div>
			</form>
		</div>
		<!-- End Reply Regist -->

		<div id="id_reply_list_area">
			<!-- Start Reply List -->

		</div>
		<!-- End Reply List -->

		<div class="row text-center" id="id_reply_list_more">
		 	<a id="btn_reply_list_more" class="btn btn-default">
       		<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
       			<i class="bi bi-chevron-down"></i>
      		</a>
      		
       </div>




		<div id="reply_edit_modal" class="modal fade">
			<!-- Start Reply Modify -->
			<div class="modal-dialog">
				<div class="modal-content">
					<form name="form_reply_edit"
						action="<c:url value='/reply/replyModify'/>" method="post"
						onclick="return false;">
<!-- 						<div class="modal-header">
							<button type="button" id="btn_reply_x" data-dissmiss="modal">X</button>
						</div> -->
						<div class="modal-body">
							<input type="hidden" name="reNo" value="">
							<textarea id="reply_text" rows="5" cols="50" name="reContent"></textarea>
							<input type="hidden" name="reCategory" value="COMM">
							<input type="hidden" name="reMemId" value="${USER_INFO.userId }">
						</div>
						<div class="modal-footer">
							<button id="btn_reply_modify" type="button">저장</button>
							<button type="button" id="btn_reply_close" data-dismiss="modal" onclick="fn_close()">닫기</button>
						</div>
					</form>
				</div>
			</div>

		</div>
		<!-- End Reply Modify -->

	</div>
	<!-- End Reply Container  -->
	</div>



<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
<script type="text/javascript">
function fn_close(){
	$('#btn_reply_close').on("click",function(e){
		e.preventDefault();
		$('#reply_edit_modal').modal('hide');
	});
}

// 파라미터 받기
var params={"curPage":1, "rowSizePerPage" : 10, "reCategory":"COMM", "reParentNo": ${comm.commNo } };

function fn_reply_list(){
	//아작스 호출해서 DB에 있는 reply 데이터 가지고 옵니다.
	//가지고오면(success)하면 댓글 div 만들어 줍니다.
	//list를 가지고오니까 jquery 반복문 써서 div 여러개 만들어주면 되겠죠?
	
	$.ajax({
		url : "<c:url value='/reply/replyList'/>",
		type: 'POST',
		dataType: 'JSON',  //받을 때 data를 어떻게 받을지
		data : params,
		success : function(data){
			console.log(data);
			$.each(data.data, function(index, element){
				var str="";
				 str=str+'<div id="reply_div" class="row" data-re-no="'+element.reNo+'">'
			        +'<div id="wrap_div"><div id="re_reMemId">'+element.reMemId+'</div>'
			        +'<div id="re_reRegDate">'+element.reRegDate+'</div></div>'
			        +'<div id="re_reContent"><p><pre>'+element.reContent+'</pre></p></div>'
			        +'<div>';
			        	
			        	//if(내가 쓴 글이면 보이고, 내가쓴게아니면 안보이고)
			        	if(element.reMemId=="${USER_INFO.userId}"){			        		
			        		str=str+'<button name="btn_reply_edit" type="button" class="btn btn-sm btn-info" id="btn_reply_edit">수정</button>'
					              +'<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger" id="btn_reply_delete">삭제</button>';
			        	}	
			        str=str+'</div>'
			    	       +'</div>';
			    //str을 댓글목록영역에 추가해주세요.
			    //댓글목록 div찾아서 .append(str)
			    $('#id_reply_list_area').append(str);
			    console.log(index);
			});
			    params.curPage+=1;
		}, //success
	});//ajax
}//function fn_reply_list

$(document).ready(function(){ //document가 준비될 때
	fn_reply_list();
	// 등록버튼,  수정, 삭제버튼, 모달의 등록버튼 
	//더보기버튼
	$("#id_reply_list_more").on("click",function(e){
		e.preventDefault();
		fn_reply_list();
	});

	$("#btn_reply_regist").on("click",function(e){
		e.preventDefault();
		$form=$(this).closest("form[name='form_reply']");
		$.ajax({
			url: "<c:url value='/reply/replyRegist'/>",
			type: "POST",
			dataType : "JSON",
			data : $form.serialize(),
			success: function(data){
				console.log(data);
				//$form.find("textarea[name='reContent']").val('');
				$("#id_reply_list_area").html('');
				params.curPage=1;
				fn_reply_list();
			},
			error : function(req,st,err){
				if(req.staus==401){
					location.href="<c:url value='/login/login.wow'/>";	
				}
			}
		});//ajax등록버튼		
	});	
	
	//수정버튼 function(){}은 동적으로 생긴 태그에도 적용이 되는거 같아
	// $().click()은 동적으로 생긴 태그에 적용x
	// $().on("click") 동적으로생긴 태그에 적용됨
	
	$("#id_reply_list_area").on("click", 'button[name="btn_reply_edit"]', function(e){
		e.preventDefault();
		//modal 아이디<id_reply_edit_modal
		//현재 버튼의 상위 div(하나의 댓글 전체)를 찾으세요	
		//그 div에서 현재 댓글의 내용 <modal에 있는 textarea에 복사
		//data-re-no에 있는 값을 modal에 있는 < input name=reNo> 태그에 값으로 복사
		//2개 복사했으면  $('#id_reply_edit_modal').modal('show')
		$btn=$(this);
		$div=$btn.closest('div.row');
		$modal=$('#reply_edit_modal');
		$pre=$div.find('pre');
		 var content=$pre.html();
		 $textarea=$modal.find('textarea');
		 
		 
		 
		 
		 
		 $textarea.val(content);
		 var reNo=$div.data('re-no');
		 $modal.find('input[name="reNo"]').val(reNo);
		 $modal.modal('show');
		 
		 /* var content = $(this).closest('.row').find('pre').text();
		 var reno = $(this).closest('.row').data('re-no');
		 
		 $('input[name="reNo"]').val(reno);
		 $('#id_reply_edit_modal').modal('show').find('textarea').val(content); */
		 
		 
		//모달창의 저장버튼
		//modify 아작스 요청
		//파라미터로 글번호, 글내용
		//아작스 성공 후 modal창 닫기, list 삭제 후 params.curPage=1, fn_reply_list
		//선택 : modal창에 있는 reNo, textarea 내용 지우기
		$("#btn_reply_modify").on("click", function(e){
			e.preventDefault(); //form태그안의있는 버튼이에요
			//파라미터로 글번호, 글내용 form.serialize() , form태그안에 글번호, 글내용있음
			$form=$(this).closest('form[name="form_reply_edit"]');
			$.ajax({
				url: "<c:url value='/reply/replyModify'/>",
				type: "POST",
				dataType: "JSON",
				data: $form.serialize(), 
				success: function(){
					$modal=$('#reply_edit_modal');
					$modal.modal('hide');
					$("#id_reply_list_area").html('');
					params.curPage=1;
					fn_reply_list();
					
					$modal.find('textarea').val('');
					$modal.find('input[name="reNo"]').val('');
				},
			}); //ajax
		}); //모달창 저장버튼
		
	});
	
		
	
	//삭제버튼
	//파라미터는 reNo, reMemId 넘기기
	//아작스 호출 후 성공에서 목록지우고 param.curPage=1, fn_reply_list 대신에 그냥
	//목록영역에서 해당 댓글 div 삭제
	$("#id_reply_list_area").on("click", 'button[name="btn_reply_delete"]', function(e){
		$div=$(this).closest('.row');
		reNo=$div.data('re-no');
		reMemId="${USER_INFO.userId}";
		$.ajax({
			url: "<c:url value='/reply/replyDelete'/>",
			type: "POST",
			data: {"reNo" : reNo, "reMemId" : reMemId},
			dataType : 'JSON',
			success: function(){
				$div.remove();
			}
		}); //ajax
	});//삭제버튼
	
	
	
	
	
	
	
});


</script>

</html>
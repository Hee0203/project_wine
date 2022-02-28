<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WINE VINTAGE</title>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/qaList.css"/>" >
<%@include file="/WEB-INF/inc/header.jsp" %>

</head>
<body>

	
	<!-- search -->	
<!-- 	<div id="search">
		<form action="" >
			<input type="text" id="search_span" name="search_span" value="" placeholder="search">
			<span>검색</span>
		</form>
	</div> -->
	<div class="title">
		<h3><a href="commList.wow"><span  style="font-family: 'Gelasio', serif; color: #fff;">COMMUNITY</span></a></h3>
	</div>
<!-- 	<div class="row11" align="center">
		<div class="writer_button col-sm-2 col-sm-offset-10 text-right" style="margin-bottom: 5px;">
			<a href="commForm.wow" class=" button btn btn-primary btn-sm"> <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>&nbsp;글쓰기</a>
		</div>
	</div> -->
	
	
	<div class="container" id="comm_search">
		<div class="panel panel-default">
			<div class="panel-body">
				<form name="search" action="commList.wow" method="post" id="form_search">
					<input type="hidden" name="curPage" value="${searchVO.curPage}">
					<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage}">
					<div class="form-group">
						<label for="id_searchType" id="label_search" class="control-label">검색</label>
						<div class="col-sm-2">
							<select id="id_searchType" id="option_search" name="searchType" style="width:100%; height:35px"  > 
								<option value="T" ${searchVO.searchType eq "T" ? "selected='selected'" : "" }>제목</option>
								<option value="I" ${searchVO.searchType eq "I" ? "selected='selected'" : "" }>작성자</option>
							</select>
						</div>	
						
						<div class="col-sm-2">
							<input type="text" name="searchWord" id="word_search" class="form-control input-sm" value="${searchVO.searchWord}" placeholder="검색어">	
						</div>	
						<div class="col-sm-1 text-right">
							<button type="submit" id="btn_search" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>검 색</button>
						</div>				
					</div>
				</form>
				
					<div class="row11" align="center">
					    <div class="writer_button">
					        <a href="commForm.wow" class="button">        	
					        	글쓰기
							</a>
					    </div>
					</div>	
			</div>
		</div>
	</div> 
	
	

	<table align="center">
		<thead class="thead">
			<tr align="center" height="50n">
				<th width="10%">번호</th>
				<th width="10%">작성자</th>
				<th width="50%">제목</th>		
				<th width="5%">조회수</th>
				<th width="20%">등록일</th>
			</tr>		
		</thead>
		<tbody class="tbody">
			<c:forEach items="${commList }" var="comm">
				<tr class="text_continer" align="center" height="50n">
					<td>${comm.commNo }</td>
					<td>${comm.memId }</td>
					<td><a href="commView.wow?commNo=${comm.commNo}" class="comm_title">${comm.commTitle }</a></td>
					<td>${comm.commHit }</td>
					<td>${comm.commRegDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- page -->
 	<nav class="text-center">
		<ul class="pagination">
			<li><a href="commList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
			<c:if test="${searchVO.firstPage!=1 }">
				<li><a href="commList.wow?curPage=${searchVO.firstPage-1 }" data-page="${searchVO.firstPage-1 }"><span aria-hidden="true">&lt;</span></a></li>
			</c:if>
			
			<c:forEach begin="${searchVO.firstPage }" end="${searchVO.lastPage }" var="i">
			<c:if test="${searchVO.curPage !=i }">
				<li><a href="commList.wow?curPage=${i }" data-page="${i }">${i }</a></li>
			</c:if>
			<c:if test="${searchVO.curPage == i }">
				<li class="active"><a href="#">${i }</a></li>
			</c:if>
			</c:forEach>
			
			<c:if test="${searchVO.lastPage!=searchVO.totalPageCount }">
				<li><a href="commList.wow?curPage=${searchVO.lastPage+1 }" data-page="${searchVO.lastPage+1 }"><span aria-hidden="true">&gt;</span></a></li>
			</c:if>
			
			<li><a href="commList.wow?curPage=${searchVO.totalPageCount }" data-page="${searchVO.totalPageCount }"><span aria-hidden="true">&raquo;</span></a></li>			
		</ul>
	</nav>
	
</body>
<%@include file="/WEB-INF/inc/footer.jsp" %>
<script type="text/javascript">	
var i=0;
 new Swiper('.testimonials-slider', {
	 speed : 500,
    loop: true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: false
    },
    slidesPerView: "auto",
   on:{
    	 slideChangeTransitionStart: function () {
    		 i=i+1;
    		 i=i%3;
        	 $('.testimonial-item').hide();     
    	      $('.testimonial-item').removeClass('aos-init').removeClass('aos-animate');
    	    },
    	    slideChangeTransitionEnd: function () {
    	
    	    	console.log($('.testimonial-item')[i]);
    	      $('.testimonial-item').show(i);
    	      AOS.init();
    	    }
    }, 
    autoHeight : true
  }); 

</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.qa.vo.QaVO" %>
<%@ page import="com.project.qa.service.QaServiceImpl" %>
<%@ page import="com.project.qa.service.IQaService" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WINE VINTAGE</title>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/qaList.css"/>" >
<%@ include file="/WEB-INF/inc/header.jsp" %>

</head>
<body>
	
	<div class="title">
		<h3><a href="qaList.wow"><span style="font-family: 'Gelasio', serif; color: #fff;">Q & A</span></a></h3>
	</div>

	<div class="container" id="qa_search">
		<div class="panel panel-default">
			<div class="panel-body">
			<!-- form start -->
				<form name="search" action="qaList.wow" method="post" id="form_search">
					<input type="hidden" name="curPage" value="${searchVO.curPage}">
					<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage}">
					<div class="form-group">
						<label for="id_searchType" id="label_search" class="control-label">검색</label>
						<div class="col-sm-2">
							<select id="id_searchType" id="option_search" name="searchType" style="width:100%; height:35px"  > 
								<option value="T" ${searchVO.searchType eq "T" ? "selected='selected'" : "" }>제목</option>
								<option value="C" ${searchVO.searchType eq "C" ? "selected='selected'" : "" }>내용</option>
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
				<!-- form end -->
				<!-- regist btn start -->
				<div class="row11" align="center">
				    <div class="writer_button">
				        <a href="qaForm.wow" class="button">        	
				        	질문 등록
						</a>
				    </div>
				</div>
				<!-- regist btn end -->
			</div>
		</div>
	</div> 	

	<table align="center">
		<thead class="thead">
		<!-- 	<tr align="center">
				<th scope="col"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">글번호</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제목</font></font></th>
		       <th scope="col"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작성자</font></font></th>
		       <th scope="col"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">조회수</font></font></th>
		       <th scope="col"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">등록일</font></font></th>
			</tr> -->
			<tr align="center" class="tr">
				<th width="10%">글번호</th>
				<th width="10%">작성자</th>
				<th width="50%">제목</th>
				<th width="5%">조회수</th>
				<th width="20%">등록일</th>
			</tr>
		</thead>
		<tbody class="tbody">
			<c:forEach items="${qaList }" var="qa">
			<%-- <tr class="table-dark">
		      <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${qa.qaNo }</font></font></td>
		      <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><a href="qaView.wow?qaNo=${qa.qaNo }">
						${qa.qaTitle }</a></font></font></td>
		      <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${qa.qaWriter }</font></font></td>
		      <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${qa.qaHit }</font></font></td>
		      <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${qa.qaModDate eq null  ? qa.qaRegDate : qa.qaModDate}</font></font></td>
		    </tr> --%>
			
				<tr class="text_continer" align="center">
						<td>${qa.qaNo }</td>
						<td>${qa.qaMemName }</td>
						<td><a href="qaView.wow?qaNo=${qa.qaNo }" class="qa_title">	${qa.qaTitle }</a></td>
						<td>${qa.qaHit }</td>
						<td>${qa.qaRegDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	
	<!-- 페이징 -->
		<nav class="text-center">
			<ul class="pagination">
				<!-- 첫 페이지 -->
				<li><a href="qaList.wow?cutPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
				
				<!-- 이전 페이지 -->
				<c:if test="${searchVO.firstPage != 1 }">
					<li><a href="qaList.wow?curPage=${searchVO.firstPage - 1 }" data-page="${searchVO.firstPage - 1 }"><span aria-hidden="true">&lt;</span></a></li>
				</c:if>
				
				<!-- 페이징 넘버 -->
				<c:forEach begin="${searchVO.firstPage }" end="${searchVO.lastPage }" var="i">
					<c:if test="${searchVO.curPage != i }">
						<li><a href="qaList.wow?curPage=${i }" data-page="${i }">${i }</a></li>
					</c:if>
					<c:if test="${searchVO.curPage == i }">
						<li class="active"><a href="#">${i }</a></li>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지 -->
				<c:if test="${searchVO.lastPage != searchVO.totalPageCount }">
					<li><a href="qaList.wow?curPage=${searchVO.lastPage + 1 }" data-page="${searchVO.lastPage + 1 }"><span aria-hidden="true">&gt;</span></a></li>
				</c:if>
				
				<!-- 마지막 페이지 -->
				<li><a href="qaList.wow?curPage=${searchVO.totalPageCount }" data-page="${searchVO.totalPageCount }"><span aria-hidden="true">&raquo;</span></a></li>
			</ul>
		</nav>


</body>
<%@ include file="/WEB-INF/inc/footer.jsp" %>
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
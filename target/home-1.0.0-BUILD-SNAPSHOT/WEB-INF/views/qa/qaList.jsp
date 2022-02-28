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
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/qaList.css"/>" >
<%@ include file="/WEB-INF/inc/header.jsp" %>
<style>
.swiper-slide {
box-sizing:border-box; /* 이 설정을 하지 않으면 슬라이드드가 틀어짐 */
}
</style>
</head>
<body>
<section id="banner" class="testimonials">
		<div class="container" id="swiper-container">
			<div class="testimonials-slider swiper" >
				<div class="swiper-wrapper" 
					style="transition-duration: 0ms; transform: translat3d(0px, -169.8px, 0px);">
					<div class="swiper-slide"
						data-swiper-slide-index="0"   
						>
						<div class="testimonial-item" data-aos="fade-up"
				data-aos-delay="200" >
							<img src="" class="" alt="">
							<h3>Havens, Merlot Napa Valley</h3>
							<h4>Red Wine</h4>
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Acidity 3
								Sweetness 1 Body 4 <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
						</div>
					</div>
					<!-- End testimonial item -->
					<div class="swiper-slide">
						<div class="testimonial-item swiper-slide-duplicate" data-aos="fade-up" data-aos-delay="200" 
							data-swiper-slide-index="1">
							<img src="" class="" alt="">
							<h3>Justin Girardin, Bourgogne Chardonnay</h3>
							<h4>White Wine</h4>
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Acidity 3
								Sweetness 1 Body 1 <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
						</div>
					</div>
					<!-- End testimonial item -->
					<div class="swiper-slide">
						<div class="testimonial-item swiper-slide-duplicate" data-aos="fade-up" data-aos-delay="200" 
							data-swiper-slide-index="2">
							<img src="" class="" alt="">
							<h3>Masion Castel, Cuvee Blanche Brut</h3>
							<h4>Sparkling Wine</h4>
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Acidity 4
								Sweetness 1 Body 1 <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
						</div>
					</div>
					<!-- End testimonial item -->
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</section>
	<!-- End Banner Section -->
	

	<div class="title">
		<h3>Q&A</h3>
	</div>
	
		<div class="row11" align="center">
		    <div class="writer_button">
		        <a href="qaForm.wow" class="button">        	
		        	질문 등록
				</a>
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
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
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
						<td>
							<a href="qaView.wow?qaNo=${qa.qaNo }" class="qa_title">
						${qa.qaTitle }
						</a>
						</td>
						<td>${qa.qaMemName }</td>
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
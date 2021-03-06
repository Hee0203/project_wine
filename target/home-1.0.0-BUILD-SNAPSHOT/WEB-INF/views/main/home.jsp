<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Wine Vintage</title>
<%@include file="/WEB-INF/inc/header.jsp"%>
<style>
#newsComm{
	width: 100%;
	display: flex;	
}
#news{
	width:50%;
	float: left;
}
#community{
	width:50%;
	float: right;
}
.swiper-slide {
box-sizing:border-box; /* 이 설정을 하지 않으면 슬라이드드가 틀어짐 */
}
#commDate{
	margin-left: 330px;
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
	
	<section id="recommend" class="pricing">
      <div class="container">

		<div class="section-title" data-aos="zoom-in">
			<c:if test="${USER_INFO.userId != null}">
      			<h2>Recommend</h2>
				<h3>Recommend Wine<span> For You</span></h3>
				<p>${USER_INFO.userName }님께 추천하는 와인 3가지</p>
			</c:if>
			<c:if test="${USER_INFO.userId == null}">
      			<h2>Recommend</h2>
				<h3>Recommend Wine<span> For You</span></h3>
				<p> 추천 와인 3가지 </p>
			</c:if>
		</div>
       
        <div class="row" id="recommendList">

        </div>

      </div>
    </section>
    <!-- End Recommended Section -->
    
    <div id="newsComm">
    <section id="news" class="faq">
      <div class="container">

        <div class="section-title" data-aos="zoom-in">
          <h2>news</h2>
          <h3><span>와인 </span> 실시간 뉴스</h3>
          <p> </p>
        </div>

        <div class="faq-list">
          <ul id="news_list">


          </ul>
        </div>

      </div>
    </section><!-- End news Section -->
    
    <section id="community" class="faq">
      <div class="container">

        <div class="section-title" data-aos="zoom-in">
          <h2>Community</h2>
          <h3>커뮤니티 <span> 게시판</span></h3>
          <p> </p>
        </div>

        <div class="faq-list">
          <ul id="comm_list">
			
          </ul>
        </div>

      </div>
    </section><!-- End news Section -->
    </div>
	

	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>

<script type="text/javascript">	
var i=0;
// 배너
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
    	
 /*    	    	console.log($('.testimonial-item')[i]); */
    	      $('.testimonial-item').show(i);
    	      AOS.init();
    	    }
    }, 
    autoHeight : true
  }); 
 
var params={"curPage" : 1, "rowSizePerPage" : 5, "reCategory" : "COMM", "sMemId":"${USER_INFO.userId}"};

function loginRecommend(){
	$.ajax({
		url: "<c:url value='/main/recommendList'/>",
		data: params,
		type:"post",
		dataType:"JSON",
		success:function(data){
			console.log(data);
			$.each(data.data, function(i,e){
				console.log(e.wineNo);
				console.log(e.wineImg);
				var str="";
				str+='<div class="col-lg-4 col-md-6">'+
	            '<div class="box" data-aos="zoom-in" data-aos-delay="200">'+
	              '<h3>추천 '+[i+1]+'</h3><ul><li><img class="wine_img" src='+e.wineImg+'></li>'+
              	'<li><a>'+e.wineEn+'</a></li>'+
              	'<li><a>'+e.wineKo+'</a></li>'+
	              '</ul>'+ 
		              '<div class="btn-wrap"><a href="<%=request.getContextPath()%>/wine/wineView.wow?wineNo='+e.wineNo+'" class="btn-buy">더보기</a>'+
	              '</div></div></div>';
				console.log(str);
				$('#recommendList').append(str);
				$('.wine_img').css({"width":"240px"});
			});
		}
	});
}
function notLoginRecommend(){
	$.ajax({
		url: "<c:url value='/main/notLoginRecommendList'/>",
		data: params,
		type:"post",
		dataType:"JSON",
		success:function(data){
			console.log(data);
			$.each(data.data, function(i,e){
				console.log(e.wineNo);
				console.log(e.wineImg);
				var str="";
				str+='<div class="col-lg-4 col-md-6">'+
	            '<div class="box" data-aos="zoom-in" data-aos-delay="200">'+
	              '<h3>추천 '+[i+1]+'</h3><ul><li><img class="wine_img" src='+e.wineImg+'></li>'+
              	'<li><a>'+e.wineEn+'</a></li>'+
              	'<li><a>'+e.wineKo+'</a></li>'+
	              '</ul>'+ 
		              '<div class="btn-wrap"><a href="<%=request.getContextPath()%>/wine/wineView.wow?wineNo='+e.wineNo+'" class="btn-buy">더보기</a>'+
	              '</div></div></div>';
				console.log(str);
				$('#recommendList').append(str);
				$('.wine_img').css({"width":"240px"});
			});
		}
	});
}
$(document).ready(function(){
	 
	 // 뉴스 크롤링 ajax
	$.ajax({
		url:"<c:url value='/main/crawling'/>",
		data: params,
		dataType:"JSON",
		type:"POST",
		success:function(data){
			console.log(data.href);
			var href = data.href;
			var title = data.title;
			console.log(data.title);
			$.each(href, function(i,e){
          		var str="";
          		if(i < 5){
          		str+= 
				'<li data-aos="fade-up" data-aos-delay="100">'+
                '<a data-bs-target="#faq-list-2" class="collapsed" href="'+e+'">'+title[i]+'</a>'+
              '</li>';
				}
				console.log(str);
              $('#news_list').append(str);
			});
			
		}
	});
	
	// 개인 와인 추천 ajax
	if(${USER_INFO.userId == null}){
		notLoginRecommend();
	} else if(${USER_INFO.userId != null}){
		loginRecommend();
	}
	
	// 커뮤니티 게시판 ajax
	$.ajax({
		url:"<c:url value='/main/mainCommList'/>",
		data: params,
		dataType:"JSON",
		type:"POST",
		success:function(data){
			console.log(data);
			$.each(data.commList, function(i,e){
				console.log(e);
				var str="";
				if(e.commDelYn == 'N'){
	          		str+= 
					'<li data-aos="fade-up" data-aos-delay="100">'+
	                '<a data-bs-target="#faq-list-1" class="collapsed" href="<%=request.getContextPath()%>/comm/commView.wow?commNo='+e.commNo
	                	+'">'+e.commTitle+'</a>';
	              '</li>';
				}
				console.log(str);
              $('#comm_list').append(str);
			});
		}
	});
	
 });
 
</script>








</html>
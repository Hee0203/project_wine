<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<style>
	.swiper-slide {
		box-sizing:border-box; /* 이 설정을 하지 않으면 슬라이드드가 틀어짐 */
	}
	span{
		font-family: 'Gelasio', serif;
	}
	</style>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WINE VINTAGE</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gelasio:ital@1&display=swap" rel="stylesheet">


  <!-- Vendor CSS Files -->
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/vendor/aos/aos.css"/>" >  
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"/>">  
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"/>">  
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/vendor/boxicons/css/boxicons.min.css"/>">  
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/vendor/glightbox/css/glightbox.min.css"/>">  
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/vendor/swiper/swiper-bundle.min.css"/>">

  <!-- Template Main CSS File -->
  <link rel="stylesheet"  href="<c:url value="/resources/assets/css/style.css"/>">

  <!-- =======================================================
  * Template Name: Remember - v4.7.0
  * Template URL: https://bootstrapmade.com/remember-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">contact@example.com</a></i>
        <i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 5589 55488 55</span></i>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
      </div>
    </div>
  </section>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between">

      <div class="logo">
        <h1 class="text-light" style="font-family: 'Gelasio', serif;"><a href="<%=request.getContextPath() %>/main/home.wow">WINE VINTAGE</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
<%-- 			<ul id="navList">
				<li class="dropdown"><a href="#"><span>HASHTAG</span></a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/wine/wineList.wow">#가성비</a></li>
						<li><a href="<%=request.getContextPath()%>/wine/wineList.wow">#화이트</a></li>
						<li><a href="<%=request.getContextPath()%>/wine/wineList.wow">#달달한</a></li>
					</ul>
				</li>
			</ul>		 --%>
        <ul>
          <li><a class="nav-link scrollto" style="font-family: 'Gelasio', serif;" href="<%= request.getContextPath()%>/comm/commList.wow">COMMUNITY</a></li>
          <li><a class="nav-link scrollto" style="font-family: 'Gelasio', serif;" href="<%= request.getContextPath()%>/qa/qaList.wow">Q & A</a></li>
          <li><a class="nav-link scrollto" style="font-family: 'Gelasio', serif;" href="<%= request.getContextPath()%>/wine/wineList.wow">WINELIST</a></li>
			<c:if test="${USER_INFO.userRole eq 'MANAGER' }">
          	<li><a class="nav-link scrollto" style="font-family: 'Gelasio', serif;" href="<%= request.getContextPath()%>/member/memberList.wow">MEMBER</a></li>
          </c:if>
          <c:if test="${USER_INFO.userRole eq 'MEMBER' }">
          	<li><a class="nav-link scrollto" style="font-family: 'Gelasio', serif;" href="<%= request.getContextPath()%>/mypage/info.wow">MYPAGE</a></li>
          </c:if>
          <c:if test="${USER_INFO.userId eq null }">
          	<li><a class="nav-link scrollto" style="font-family: 'Gelasio', serif;" href="<%= request.getContextPath()%>/login/login.wow">LOGIN</a></li>
          </c:if>
          <c:if test="${USER_INFO.userId != null }">
          	<li><a class="nav-link scrollto" style="font-family: 'Gelasio', serif;" href="<%= request.getContextPath()%>/login/logout.wow">LOGOUT</a></li>
          </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->

  <script src="<c:url value="/resources/assets/vendor/purecounter/purecounter.js" />"></script>
  
  <script src="<c:url value="/resources/assets/vendor/aos/aos.js" />"></script>

  <script src="<c:url value="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

  <script src="<c:url value="/resources/assets/vendor/glightbox/js/glightbox.min.js" />"></script>

  <script src="<c:url value="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js" />"></script>

  <script src="<c:url value="/resources/assets/vendor/swiper/swiper-bundle.min.js" />"></script>

  <script src="<c:url value="/resources/assets/vendor/php-email-form/validate.js" />"></script>

  <!-- Template Main JS File -->
  
  <script src="<c:url value="/resources/assets/js/main.js" />"></script>


<!-- 	<section id="banner" class="testimonials">
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
					End testimonial item
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
					End testimonial item
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
					End testimonial item
					<div class="swiper-slide">
						<div class="testimonial-item swiper-slide-duplicate" data-aos="fade-up" data-aos-delay="200" 
							data-swiper-slide-index="3">
							<img src="" class="" alt="">
							<h3>Vollenweider, Wolfer Goldgrube Riesling Beerenauslese</h3>
							<h4>White Wine</h4>
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Acidity 2
								Sweetness 5 Body 3 <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
						</div>
					</div>
					End testimonial item
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</section>
	End Banner Section

 -->

</body>
<!-- <script type="text/javascript">
var i=0;
//배너
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

</script> -->
</html>
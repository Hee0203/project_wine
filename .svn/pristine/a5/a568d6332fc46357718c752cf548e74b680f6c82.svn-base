<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- <%@include file="/WEB-INF/inc/header.jsp" %> --%>
<meta charset="UTF-8">
<title>Wine Vintage</title>
<style type="text/css">
body{
	background: #1c1c1c;
}
#sweet{
	width:100px;
	height:25px;
}
#body{
	width:100px;
	height:25px;
}
#acid{
	width:100px;
	height:25px;
}
#price{
	font-size: 13px;
}
#wineEn{
	font-size: 17px;
}
#wineKo{
	font-size: 12px;
}
.wimg{
	display: flex;
	}
.swiper-slide {
	box-sizing:border-box; /* 이 설정을 하지 않으면 슬라이드드가 틀어짐 */
}
span{
	font-family: 'Gelasio', serif;
}
#navbar ul {
  margin: 0;
  padding: 0;
  display: flex;
  list-style: none;
  align-items: center;
  margin-left: 280px;
}
#navbar a, #navbar a:focus {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 0 10px 30px;
  font-family: "Poppins", sans-serif;
  font-size: 13px;
  font-weight: 500;
  color: black; 
  text-transform: uppercase;
  white-space: nowrap;
  transition: 0.3s;
	
}
.tabs {
  padding-bottom: 20px;
  background-color: #ffffff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  width: 75%;
  margin: auto;
  margin-top: 115px;
  margin-bottom: 67px;
  height: 550px;
}
.viewRecommend{
	display: block;
	display: flex;
	width: 68%;
	padding-top: 75px;
	margin-left: 60px;
}
ul {
	list-style: none;
	text-align: center;
}


.list {
  width: 20%;
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
#win {
	display: none;
}
tab div {
  display: none;
  padding: 40px 40px 0;
  clear: both;
  overflow: hidden;
}
.ad {
  width: 80%;
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
#a {
	display: none;
} 
.tabs input:checked + .list {
  background-color: #333333;
  color: #fff;
}
.wine_img{
	height: 300px;
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

<%-- header --%>
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between">

      <div class="logo">
        <h1 class="text-light" style="font-family: 'Gelasio', serif;"><a href="<%=request.getContextPath() %>/main/home.wow">WINE VINTAGE</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>
     </div>
	</header>
	
	
	
<!-- ===== nav bar ===== -->
<div style="border-bottom: 1px solid; height: 50px; margin-top: 10px;">
      <nav id="navbar" >
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
          	<li><a class="nav-link scrollto" style="font-family: 'Gelasio', serif; color: black;" href="<%= request.getContextPath()%>/member/memberList.wow">MEMBER</a></li>
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
<!-- ======= navbar End ======= -->






<!-- =========== win view =========== -->
<div class="wimg" style="text-algin: center; height: 500px; width: 70%; margin: auto; margin-top: 80px;">
	<%-- <h3><a href="<%=request.getContextPath() %>/wine/wineList.wow">Wine View</a></h3> --%>
	<table style="text-align: center; height: 580px; width: 900px; border: 1px solid #ddd;">
		<tr>
			<th rowspan="7" style="width: 352px;"><img alt="이미지를 찾을 수 없습니다." src="${wine.wineImg }" style="width: 400px;height: 500px; text-align: center;"></th>
		</tr>
	</table>
	<table style="width: 900px; height: 500px; margin-left: 100px;">
<%-- 		<colgroup>
			<col width=20%>
			<col width=30%>
			<col width=30%>
		</colgroup> --%>
<%-- 		<tr>
			<th rowspan="7" style="width: 352px;"><img alt="이미지를 찾을 수 없습니다." src="${wine.wineImg }" style="width: 250px;height: 400px; margin-left: 50px;"></th>
		</tr> --%>
		<tr>
			<th style="font-size: 17px; height: 30px; padding-bottom:10px; padding-top: 20px; border-bottom: solid;">
				<c:choose>
					<c:when test="${wine.wineCd eq '스파클링'}">
						<a style="background: orange; color: white;">${wine.wineCd }</a>&nbsp;&nbsp; ${wine.wineNation }
					</c:when>
					<c:when test="${wine.wineCd eq '화이트'}">
						<a style="background: dodgerblue; color: white;">${wine.wineCd }</a>&nbsp;&nbsp; ${wine.wineNation }
					</c:when>
					<c:when test="${wine.wineCd eq '레드'}">
						<a style="background: crimson; color: white;">${wine.wineCd }</a>&nbsp;&nbsp; ${wine.wineNation }
					</c:when>
				</c:choose>
			 </th>
		</tr>
		<tr>
			<th style="height:90px; width: 700px;">
				<span style="font-size: 20px;" id="wineEn">${wine.wineEn } <input type="hidden" name="wineNo" class="wineNo" value="${wine.wineNo }"></span>
			</th>
		</tr>
		<tr>
			<th style="height:35px; background: #f7f7f7; padding-left: 19px;">
				<span id="wineKo" style="font-size: 14px;">${wine.wineKo }</span>
			</th>
		</tr>
		<tr>
			<th style="height: 40px; padding-top:20px; padding-bottom:20px; border-bottom: 1px solid #ddd;">
				<span id="price" style="font-size: 20px;">${wine.winePrice }<span id="ml" style="font-size:14px;">${wine.wineMl }</span></span>
			</th>
		</tr>
		<tr>
			<th><span style="font-size:17px;">
				ACID <img id="acid" alt="No Image" src="<%=request.getContextPath() %>/resources/assets/img/${wine.wineAcid} rate.png"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				SWEET <img id="sweet" alt="No Image" src="<%=request.getContextPath() %>/resources/assets/img/${wine.wineSweet} rate.png"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				BODY <img id="body" alt="No Image" src="<%=request.getContextPath() %>/resources/assets/img/${wine.wineBody} rate.png">
			</span></th>
		</tr>
		<tr>
			<th style="height: 85px;"><span id="aroma" style="font-size:17px;">Aroma &nbsp; <a style="word-spacing: 10px;">${wine.wineAroma }</a></span></th>
		</tr>
	</table>
</div>

<h3 style="text-align: right; margin-right: 300px;"><a href="<%=request.getContextPath() %>/wine/wineList.wow"><img src="../resources/assets/img/ddd.png" style="width: 30px;"/></a></h3>


<div class="tabs">
<!-- 	<input id="all" type="radio" name="item" checked>
	<label class="indexView" for="all" >INFO</label>
    
    <input id="programming" type="radio" name="item" >
    <label class="indexCOMM" for="programming" >COMM</label>
    
    <input id="design" type="radio" name="item" >
    <label class="indexQA" for="design" >Q&A</label>
 -->
	<input id="win" type="radio" name="item" checked>
	<label class="list" for="win">이런 와인은 어때요?</label>
    <input id="a">
    <label class="ad" for="a"></label>

    <div class="viewRecommend"></div>
</div>

</body>
<script type="text/javascript">
var params={"curPage" : 1, "rowSizePerPage" : 4, "wineNo" : 170077};
var wineNo = $(".wineNo").val();
function viewRecommend(){
	$.ajax({
		url: "<c:url value='/wine/viewRecommend'/>",
		data: {"wineNo" : wineNo},
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
	              '<ul><li><a href="<%=request.getContextPath()%>/wine/wineView.wow?wineNo='+e.wineNo+'" class="btn-buy"><img class="wine_img" src='+e.wineImg+'></a></li>'+
              	'<li style-"margin-top:60px; color:black;"><h6 style="font-size:15px; margin-top:10px;" class="wineKo">'+e.wineKo+'</h6></li>'+
              	'<li style="padding-bottom:5px; color:black;"><h6 style="font-size:5px;" class="wineEn">'+e.wineEn+'</h6></li>'+
	              '</ul>'+ 
		              <%-- '<div class="btn-wrap"><a href="<%=request.getContextPath()%>/wine/wineView.wow?wineNo='+e.wineNo+'" class="btn-buy">더보기</a>'+ --%>
	              '</div></div></div>';
				console.log(str);
				$('.viewRecommend').append(str);
				$('.wine_img').css({"width":"240px"});
			});
		}
	});
}

$(document).ready(function(){
	viewRecommend();
});




</script>

</html>
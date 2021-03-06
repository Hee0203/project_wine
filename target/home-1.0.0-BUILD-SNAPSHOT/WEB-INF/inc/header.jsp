<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Wine Vintage</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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
        <h1 class="text-light"><img src= "<c:url value='/resources/assets/img/page_name.png'/>"></img></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="<%=request.getContextPath()%>/main/home.wow">HOME</a></li>
          <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/comm/commList.wow">COMMUNITY</a></li>
          <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/qa/qaList.wow">Q & A</a></li>
          <li><a class="nav-link scrollto " href="<%= request.getContextPath()%>/login/login.wow">LOGIN</a></li>
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

</body>

</html>
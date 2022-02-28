<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Wine Vintage</title>
<style type="text/css">
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
</style>
</head>
<body>
<div>
	<h3>Wine View</h3>
	<table border=1>
		<colgroup>
			<col width=20%;>
			<col width=40%;>
			<col width=20%;>
		</colgroup>
		<tr>
			<th rowspan="6"><img alt="이미지를 찾을 수 없습니다." src="${wine.wineImg }" style="width: 250px;height: 400px;"></th>
			<th>${wine.wineCd } &nbsp;&nbsp;|&nbsp;&nbsp; ${wine.wineNation }</th>
			<th></th>
		</tr>
		<tr>
			<th id="wineEn">${wine.wineEn } <input type="hidden" name="wineNo" value="${wine.wineNo }"></th>
		</tr>
		<tr>
			<th id="wineKo">${wine.wineKo }</th>
		</tr>
		<tr>
			<th id="aroma">Aroma &nbsp; ${wine.wineAroma }</th>
			<th>
				ACID <img id="acid" alt="이미지를 찾을 수 없습니다." src="<%=request.getContextPath() %>/resources/assets/img/${wine.wineAcid} rate.png">
			</th>
		</tr>
		<tr>
			<th>SWEET <img id="sweet" alt="이미지를 찾을 수 없습니다." src="<%=request.getContextPath() %>/resources/assets/img/${wine.wineSweet} rate.png"></th>
			<th>BODY <img id="body" alt="이미지를 찾을 수 없습니다." src="<%=request.getContextPath() %>/resources/assets/img/${wine.wineBody} rate.png"></th>
		</tr>
		<tr>
			<th>${wine.wineMl }</th>
			<th id="price">PRICE &nbsp; ${wine.winePrice }</th>
		</tr>

	</table>
</div>
</body>


</html>
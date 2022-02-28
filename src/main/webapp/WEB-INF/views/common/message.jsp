<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title> ${resultMessageVO.title }</title>
<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>

<div align="center" style="height:600px;">
	<!-- title start -->
	<div>
		<h3 style="padding-top: 30px; margin-bottom: 30px;">${resultMessageVO.title }</h3>
	</div>
	<!-- message start -->
	<div>
		<div>
			<p style="margin-bottom: 30px;">${resultMessageVO.message }</p>
		</div>
		<!-- contextPath start -->
		<div>
			<a href="${pageContext.request.contextPath }/main/home.wow">
				<span aria-hidden="true"></span> Home
			</a>
			<c:if test="${not empty resultMessageVO.url }">
				<a href="<c:url value='${resultMessageVO.url }'/>">
					<span></span> &nbsp;&nbsp;&nbsp; ${resultMessageVO.urlTitle }
				</a>
			</c:if>
		</div>
		<!-- contextPath end -->
	</div>
	<!-- message end -->
</div>
<!-- title end -->

</body>
<%@ include file="/WEB-INF/inc/footer.jsp" %>
</html>
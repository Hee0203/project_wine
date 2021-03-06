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

<div>
	<div>
		<h3>${resultMessageVO.title }</h3>
	</div>
	<div>
		<div>
			<p>${resultMessageVO.message }</p>
		</div>
		<div>
			<a href="${pageContext.request.contextPath }/main/home.wow">
				<span aria-hidden="true"></span> Home
			</a>
			<div>
				<c:if test="${not empty resultMessageVO.url }">
					<a href="<c:url value='${resultMessageVO.url }'/>">
						<span></span> ${resultMessageVO.urlTitle }
					</a>
				</c:if>
			</div>
		</div>
	</div>

</div>


</body>
<%@ include file="/WEB-INF/inc/footer.jsp" %>
</html>
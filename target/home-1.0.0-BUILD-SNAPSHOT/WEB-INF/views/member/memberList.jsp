<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("utf-8"); %>

</head>
<body>
<div class="container">
	<h3>회원목록</h3>
	
	<!-- start : 검색 폼 -->
	<div id="id_search_area">
		<div>
			<form action="memberList.wow" name="search" method="post">
				<input type="hidden" name="curPage" value="${searchVO.curPage }">
				<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
				<div>
					<label for="id_searchType">검색</label>
					<div>
						<select id="id_searchType" name="searchType">
							<option value="ID" ${searchVO.searchType eq "ID" ? "selected='selected'" : "" }>아이디</option>						
							<option value="NM" ${searchVO.searchType eq "NM" ? "selected='selected'" : "" }>회원명</option>						
						</select>
					<div>
						<input type="text" name="searchWord" value="${searchVO.searchWord }"  placeholder="검색어">					
					</div>
					</div>
				</div>
				<div class="form-group">
					<div>
						<button type="submit">검색</button>
					</div>
				
				</div>
			</form>
		</div>
	
	</div>
	
	<!-- start :  멤버 리스트 -->
	<table>
	<caption>회원목록</caption>
	<thead>
		<tr>
			<td>아이디</td>
			<td>회원명</td>
			<td>HP</td>
			<td>email</td>
			<td>등록날짜</td>
			<td>삭제여부</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${memberList }" var="member">
			<tr>
				<td>${member.memId }</td>
				<td><a href="memberView.wow?memId=${member.memId }">${member.memName }</a></td>
				<td>${member.memHp }</td>
				<td>${member.memMail }</td>
				<td>${member.memJoin }</td>
				<td>${member.memDelYn }</td>
			</tr>
			
			
		
		</c:forEach>
	</tbody>
	</table>	
	<div>
		<a href="memberForm.wow" class="btn btn-primary btn-sm pull-right">회원 등록</a>
	</div>

</div>
<!-- START : 페이지네이션  -->
		<nav class="text-center">
			<ul class="pagination">
				<!-- 첫 페이지  -->
				<li><a href="memberList.wow?curPage=1" data-page="1"><span
						aria-hidden="true">&laquo;</span></a></li>
				<!-- 이전 페이지 -->
				<c:if test="${searchVO.firstPage!=1 }">
					<li><a href="memberList.wow?curPage=${searchVO.firstPage-1 }"
						data-page="${searchVO.firstPage-1 }"><span aria-hidden="true">&lt;</span></a></li>
				</c:if>

				<!-- 페이지 넘버링  -->
				<c:forEach begin="${searchVO.firstPage }"
					end="${searchVO.lastPage }" var="i">
					<c:if test="${searchVO.curPage !=i }">
						<li><a href="memberList.wow?curPage=${i }" data-page="${i }">${i }</a></li>
					</c:if>
					<c:if test="${searchVO.curPage ==i }">
						<li class="active"><a href="#">${i }</a></li> 
					</c:if>
				</c:forEach>

				<!-- 다음  페이지  -->
				<c:if test="${searchVO.lastPage!=searchVO.totalPageCount }">
					<li><a href="memberList.wow?curPage=${searchVO.lastPage+1 }" data-page="${searchVO.lastPage+1 }"><span
							aria-hidden="true">&gt;</span></a></li>
				</c:if>

				<!-- 마지막 페이지 -->
				<li><a href="memberList.wow?curPage=${searchVO.totalPageCount }" data-page="${searchVO.totalPageCount }"><span
						aria-hidden="true">&raquo;</span></a></li>
					
			</ul>
		</nav>
		<!-- END : 페이지네이션  -->




</body>
</html>
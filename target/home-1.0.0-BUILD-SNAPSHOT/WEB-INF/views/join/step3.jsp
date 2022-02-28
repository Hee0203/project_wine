<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
</head>
<body>
${member }
	<div class="container">
		<form:form action="memberRegist.wow" modelAttribute="member" method="post">
		<div class="row col-md-8 col-md-offset-2">
			<div class="page-header">
				<h3>회원가입 3단계</h3>
			</div>


			<table class="table">
				<tr class="form-group-sm">
					<th>생일</th>
					<td>
						<input type="date" name="memBir" class="form-control input-sm" value="${member.memBir }">
						<form:errors path="memBir"/>	
					</td>
				</tr>
				<tr class="form-group-sm">
					<th>주소</th>
					<td>
					<button type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" >우편번호 찾기</button>
					<form:input path="memZip"  id="memZip" placeholder="우편번호"/><br>
					<form:input path="memAdd1"  id="memAdd1"  placeholder="상세주소"/><br>
					<form:input path="memAdd2"  id="memAdd2" placeholder="참고항목"/>
						<form:errors path="memAdd1"/>
						<form:errors path="memAdd2"/>
					</td>
				</tr>
				<tr class="form-group-sm">
					<th>핸드폰</th>
					<td>
						<form:input path="memHp" cssClass="form-control input-sm"/>
						<form:errors path="memHp"/>
					</td>
				</tr>
				<tr>
					<th>1년에 와인을 마시는 횟수는?</th>
					<td>
						<div class="form-group-sm">
							<form:select path="memDrink">
								<form:option value="">--select--</form:option>
								<form:option value="0">0</form:option>
								<form:option value="1">1~3</form:option>
								<form:option value="2">4~6</form:option>
								<form:option value="3">6~10</form:option>
							</form:select>
							<form:errors path="memDrink"/>
						</div>
					</td>
				</tr>
				<tr>
					<th>주로 어떤 날에 와인을 마시는지 ?</th>
					<td class="form-group-sm">
							<form:select path="memAnn">
								<form:option value="">--select--</form:option>
								<form:option value="birthday">생일</form:option>
								<form:option value="marry">결혼기념일</form:option>
								<form:option value="graduation">졸업식</form:option>
								<form:option value="couple">커플기념일</form:option>
								<form:option value="christmas">크리스마스</form:option>
							</form:select>
							<form:errors path="memAnn"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="pull-left">
							<a href="${pageContext.request.contextPath}/join/cancel" class="btn btn-sm btn-default"> <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> &nbsp;&nbsp;취 소
							</a>
						</div>
						<div class="pull-right">
							<button type="submit" class="btn btn-sm btn-primary">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> &nbsp;&nbsp;다 음
							</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
		</form:form>
	</div>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("memAdd2").value = extraAddr;
                
                } else {
                    document.getElementById("memAdd2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memZip').value = data.zonecode;
                document.getElementById("memAdd1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>
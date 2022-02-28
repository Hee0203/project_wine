<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<div>
	<h3>Wine List</h3>
 	<table border="1">
		<tbody id="wineTbody">
		</tbody>
	</table>
	</div>
	<div class="row text-center" id="id_wine_list_more">
		<a id="btn_wine_list_more"
			class="btn btn-sm btn-default col-sm-10 col-sm-offset-1"> <span
			class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
			더보기
		</a>
	</div>

</body>
<%@ include file="/WEB-INF/inc/footer.jsp" %>

<script type="text/javascript">

var params = {"curPage" : 1, "rowSizePerPage" : 16, "lastRow" : 16};
function fn_wine_list() {
	$.ajax({
		url: "<c:url value='/wine/wineListMore' />",
		data: params,
		dataType: "JSON",
		type: "POST",
		async: false,
		success: function(data) {		
			var str = "";
			$.each(data.data, function(index, el) {
              if(index % 4 == 0 || index == 0) {
            	   str += '<tr>';
                } 
          	   	str += '<th>'
          	   		+ '<ul>'
          	   		+ '<li class="wine-image"><a href="wineView.wow?'+'wineNo='+el.wineNo+'"><img alt="" src="'+ el.wineImg +'"style="width: 200px;height: 300px;"></a></li>'
     				+ '<li class="wine-ko"><a href="wineView.wow?' +'wineNo='+el.wineNo+'">"'+ el.wineKo +'"</a></li>'
     				+ '<li class="wine-en"><a href="wineView.wow?' +'wineNo='+el.wineNo+'">"'+ el.wineEn +'"</a></li>'
  				 	+ '</ul>'
  				 	+ '</th>';
          	   if (index % 4 == 3) {
	          	   str += '</tr>';
               }
			});
          	   $('#wineTbody').append(str);
				params.curPage += 1;
		}
	});
}

$(document).ready(function () {
	fn_wine_list();
	$('#id_wine_list_more').on("click", function(e) {
		e.preventDefault();
		fn_wine_list();
		
	});
})

</script>





</html>
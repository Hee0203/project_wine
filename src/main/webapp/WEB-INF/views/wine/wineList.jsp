<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WINE VINTAGE</title>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/wineList.css"/>" >
<%@ include file="/WEB-INF/inc/header.jsp" %>
<style type="text/css">
ul{
	list-style:none;
	padding-left:0px;
}
th{
	width: 440px;
	padding-left: 100px;
}
li{
	font-size: 15px;
}
th li:hover{
	color: #a40000;
}
a{
	color: black;
}

.menu a{cursor: pointer;}
.menu .wine_cd{display: none;}
.menu .wine_price{display: none;}

</style>
</head>
<body>

<!-- <h3 style="font-family: 'Gelasio', serif; border-bottom: solid; font-size: 50px; margin-top: 50px; padding-left: 30px;">Wine List</h3> -->
<div id="all_box" style="width: 100%">
	<div id="filter_id" style="border-right-color: #fff; border-left-color: #fff; border-top-color: #fff; width: 100%">
		<div class="filter" style="margin-left: 200px;">
			<!-- <span id="span_id" style="font-family: 'Gelasio', serif;">검색조건</span> -->
			<div class="wine_cd_box" style="width: 40%;">
<!--  				<h5 style="font-family: 'Gelasio', serif;">Wine Color</h5>
					<button style="height: 30px;">v</button> -->
			<ul>
				<li class="menu" style="display: flex;">
					<h5 style="font-family: 'Gelasio', serif;"><label for="wineColor_h5">Wine Color</label></h5>
					<a class="tag_a"><input type="image" id="wineColor_h5" src="../resources/assets/img/ddd.png" alt="이미지" width="40px" height="20px" style="padding-left: 10px; padding-top: 5px;"/></a>									
					<ul id="wine_cd">
						<li class="cd_class">
							<div>
								<label for="red_wine">
								<input id="red_wine" name="filter" type="checkbox" value="레드">
								레드</label>
							</div>
						</li>
						<li>
							<div>
								<label for="white_wine">
								<input id="white_wine" name="filter" type="checkbox" value="화이트">
								화이트</label>
							</div>
						</li>
						<li>
							<div>
								<label for="sparkling_wine">
								<input id="sparkling_wine" name="filter" type="checkbox" value="스파클링">
								스파클링</label>
							</div>
						</li>
						<li>
							<div>
								<label for="etc_wine">
								<input id="etc_wine" name="filter" type="checkbox" value="기타">
								기타</label>
							</div>
						</li>
					</ul>
				</li>
			</ul>
			</div>
			<div class="wine_price_box" style="width: 40%;">
			<ul>
				<li class="menu" style="display: flex;">
				<h5 style="font-family: 'Gelasio', serif;"><label for="price_h5">Price</label></h5>
				<a class="tag_b"><input type="image" id="price_h5" src="../resources/assets/img/ddd.png" alt="이미지" width="40px" height="20px" style="padding-left: 10px; padding-top: 5px;"/></a>	
					<ul id="wine_price">
						<li>
							<div>
								<label for="price00">
								<input id="price00" name="price" type="radio" value="9999999" checked="checked">
								전체</label>
							</div>
						</li>
						<li>
							<div>
								<label for="price01">
								<input id="price01" name="price" type="radio" value="50000">
								5만원 이하</label>
							</div>
						</li>
						<li>
							<div>
								<label for="price02">
								<input id="price02" name="price" type="radio" value="250000">
								5만원 ~ 25만원</label>
							</div>
						</li>
						<li>
							<div>
								<label for="price03">
								<input id="price03" name="price" type="radio" value="500000">
								25만원 ~ 50만원</label>
							</div>
						</li>
						<li>
							<div>
								<label for="price04">
								<input id="price04" name="price" type="radio" value="750000">
								50만원 ~ 75만원</label>
							</div>
						</li>
						<li>
							<div>
								<label for="price05">
								<input id="price05" name="price" type="radio" value="1000000">
								76만원 이상</label>
							</div>
						</li>
					</ul>
				</li>
			</ul>
			</div>
			<a class="filter_reset" style="width: 10%; text-align: center;"><button style="border:solid 1px black; border-radius:5px; background: #fff;">초기화</button></a>
		</div>	
	</div>
	
	<h3 id="wineList" style="font-family: 'Gelasio', serif; border-bottom: solid; font-size: 50px; margin-top: 50px; padding-left: 30px; width: 80%; margin-left: 200px; padding-bottom: 20px;">Wine List</h3>
	
	<div class="filter_div">
		<div style="width: 100%; text-align: center;">
		 	<table style="border: none; width: 75%; margin-left: 170px;">
				<tbody id="wineTbody">
				</tbody>
			</table>		
		</div>
	</div>
</div>

<div class="row text-center" id="id_wine_list_more">
	<a style="margin-left: 150px;" id="btn_wine_list_more" class="btn btn-sm btn-default col-sm-10 col-sm-offset-1" onclick="javascript: fnPdtView('N', 10246); return false;" style="cursor: default; display: block;">
		<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
		<img alt="이미지가 없다" src="../resources/assets/img/dd.png" width="55px" height="50px" style="margin-bottom: 20px; margin-top: 35px;">
	</a>
</div>

</body>
<%@ include file="/WEB-INF/inc/footer.jsp" %>

<script type="text/javascript">

$("#wine_cd").hide();
$("#wine_price").hide();

$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu>.tag_a").click(function(){
        var submenu = $(this).next("ul");;

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
            $("#wineColor_h5").attr("src","../resources/assets/img/ddd.png");
            $("#wineColor_h5").attr("width","40px");
            $(".tag_a").attr("style","margin-left: 0px;");
        	 /*  $("#wine_cd").attr("style","padding-left: 70px;"); */
        }else{
            submenu.slideDown();
            $("#wineColor_h5").attr("src","../resources/assets/img/dd.png");
            $("#wineColor_h5").attr("width","25px");
            $(".tag_a").attr("style","margin-left: 7px;");
            /* $("#wine_cd").attr("style","padding-left: 78px;"); */
        }
    });
    
    $(".menu>.tag_b").click(function(){
        var submenu = $(this).next("ul");;

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
            $("#price_h5").attr("src","../resources/assets/img/ddd.png");
            $("#price_h5").attr("width","40px");
            $(".tag_b").attr("style","margin-left: 0px;");
           /*  $("#wine_price").attr("style","padding-left: 70px;"); */
        }else{
            submenu.slideDown();
            $("#price_h5").attr("src","../resources/assets/img/dd.png");
            $("#price_h5").attr("width","25px");
            $(".tag_b").attr("style","margin-left: 7px;");
           /*  $("#wine_price").attr("style","padding-left: 78px;"); */
        }
    });
});



/* $(document).ready(function(){
    // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu>a").click(function(){
    	$("#wine_cd").show();
        // 현재 클릭한 태그가 a 이기 때문에;
        // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
        $(this).next("ul").toggleClass("wine_cd");
    });
});

$(document).ready(function(){
    // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu>a").click(function(){
    	$("#wine_price").show();
        // 현재 클릭한 태그가 a 이기 때문에
        // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
        $(this).next("ul").toggleClass("wine_price");
    });
});
 */

var filteraa = {"curPage" : 1, "rowSizePerPage" : 15, "lastRow" : 15};
function fn_wine_filter() {	//필터,더보기 ajax
	var price = "";
	var checkArray = [];
	
	$('.wine_price_box input[type=radio]:checked').each(function(i) {
		price = $(this).val(); 
		filteraa.searchPrice = price;	
	});
	if($("input[type=checkbox]:checked").length == 0) {
		checkArray = [];
		filteraa.searchCd = checkArray;
		
	} else if ($("input[type=checkbox]:checked").length > 0) {
		$('.wine_cd_box input[type=checkbox]:checked').each(function(i) {
			checkArray.push($(this).val());
			filteraa.searchCd = checkArray;
		});
	}
	$.ajax({
		url: "<c:url value='/wine/wineFilterList' />",
		data: filteraa,
		dataType: "JSON",
		type: "POST",
		traditional : true,
		async: false,
		success: function(data) {		
			var str = "";
			$.each(data.data, function(index, el) {
              if(index % 3 == 0 || index == 0) {
            	   str += '<tr>';
                } 
          	   	str += '<th>'
          	   		+ '<ul style="font-size: 10px; cursor: default;">'
          	   		+ '<li class="wine-image"><a href="wineView.wow?'+'wineNo='+el.wineNo+'"><img alt="" src="'+ el.wineImg +'"style="width: 200px; height: 300px; margin-bottom: 30px; margin-top: 100px;"></a></li>'
     				+ '<li><a href="wineView.wow?wineNo='+el.wineNo+'">' + el.wineEn +'<br>'
          	   		+ el.wineKo +'<br>'
          	   		+ el.winePrice +'원</li>'
  				 	+ '</ul>'
  				 	+ '</th>';
          	   if (index % 3 == 2) {
	          	   str += '</tr>';
               }
			});
          	$('#wineTbody').append(str);
          	filteraa.curPage += 1;
		}
	});
}


$(document).ready(function () {
	fn_wine_filter();	
	$('#wine_price').on('click',function(){
		filteraa.curPage = 1;
	});	
	$('#wine_cd').on('click',function(){
		filteraa.curPage = 1;
	});	
	$('#id_wine_list_more').on("click", function(e) {
	    var price = "";
	    var checkArray = [];
	    if($("input[type=checkbox]:checked").length > 0 || $("input[type=radio]:checked")) {
	    //필터선택시
	    	$("input:checked").each(function(i) {
				checkArray.push($(this).val());
			});		
			$('.wine_price_box input[type=radio]:checked').each(function(i) {
				price = $(this).val();
			});
			$('.wine_cd_box input[type=checkbox]:checked').each(function(i) {
				checkArray.push($(this).val());
			});
			e.preventDefault();
			fn_wine_filter();	
		}
	});	
	
	//초기화
	$('.filter_reset').on("click", function(e) {
		filteraa.curPage = 1;
		if($("input[type=checkbox]:checked").length > 0 || $("input[type=radio]:checked")) {
			$("input:checked").prop('checked',false);
			$('#wineTbody').empty();
			$("input:radio[id='price00']").prop("checked", true);
			fn_wine_filter();	
		}
	});
	
	
	//필터링
	$('input[type=checkbox]').change(function() {
		$('#wineTbody').empty();	
		fn_wine_filter();
	});
	$('input[type=radio]').change(function() {
		$('#wineTbody').empty();
		fn_wine_filter();
	});
});

</script>





</html>
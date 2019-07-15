<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://maps.googleapis.com/maps/api/js"></script>

<script>

function initialize() {


  var LatLng = new google.maps.LatLng(35.158679, 129.062082);

  var mapProp = {

    center: LatLng, // 위치

    zoom:14, // 어느정도까지 세세하게 볼 것인지.

    mapTypeId:google.maps.MapTypeId.ROADMAP

  };

  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);





  var marker = new google.maps.Marker({

	position: LatLng,

	map: map,

	

  });

}
google.maps.event.addDomListener(window, 'load', initialize);




</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div id="wrap">
		<!-- 헤더가 들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더가 들어가는 곳 -->

		<!-- 본문 들어가는 곳 -->
		<!-- 서브페이지 메인이미지 -->
		<div class="clear"></div>
		<div id="sub_img_center">
		</div>
		<!-- 서브페이지 메인이미지 -->
		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="welcome.jsp">Welcome</a></li>
				<li><a href="location.jsp">Location</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<!-- 내용 -->
		<article>
			<h1>L o c a t i o n</h1>
			<h3>제가 교육받은 학원 위치입니다.</h3><br>
			<h4>부산 부산진구 동천로 109 삼한골든게이트 7층 아이티윌교육센터</h4>
<div id="googleMap" style="width:500px;height:380px;"></div>

		</article>
		<!-- 내용 -->
		<!-- 본문 들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터 들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는 곳 -->
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function idcheck() {
	
	// id상자 비어 있으면 "입력하세요" 포커스
	if(document.fr.id.value==""){
		alert("입력하세요");
		document.fr.id.focus(); //포커스
		return;
	}
		var idCheckOk = 0;
		var items = fr.id.value;
		for (var i = 0; i < items.length; i++) {
			if (!( items.charAt(i) >= 'a' && items.charAt(i) <= 'z'
				|| items.charAt(i) >= 'A' && items.charAt(i) <= 'Z'
				|| items.charAt(i) >= '0' && items.charAt(i) <= '9'
				|| items.charAt(i) == '-' || items.charAt(i) == '_'|| items.charAt(i) == '@')) {
				idCheckOk += 1;
			}
		}
		
		if (idCheckOk > 0) {
			alert("아이디에 사용 불가한 문자입니다.\n영문자 및 숫자, 특수기호 '-','_','@'만 사용 가능합니다.");
			fr.id.select();
			return;
		} else {
			if (fr.id.value.length > 0) {
				var uid=document.fr.id.value;
				
	//window.open("오픈할파일,주소","창이름","창의크기,위치,..");
	// 새창 열기(get방식, id가 중복인지 아닌지 화면 띄우기)		
	//userId라는 이름으로 중복체크할 id를 idcheck 페이지로 가지고 가기 // 문자열 다음 +로 해서 넘김

				window.open("idcheck.jsp?userId="+uid,"","width=300, height=200");
			}
		}
		
	}

</script>

<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript">
        function openDaumZipAddress() {

            new daum.Postcode({
                
                oncomplete:function(data) {

                    jQuery('#postcode1').val(data.postcode1);
                    jQuery('#postcode2').val(data.postcode2);
                    jQuery('#address').val(data.address);
                    jQuery('#address_etc').focus();
                    console.log(data);
                }
            }).open();
        }
    </script>
</head>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="login.jsp">Login</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" method="post" name="fr" enctype="multipart/form-data">

<!-- // 자바 스크립트 사용하려면 name이나 id사용 필요 -->
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" style="width: 165px;" name="id" id="id" class="id" required="required" autofocus="autofocus" maxlength="20">
<input type="button" value="ID Check" class="dup" onclick="idcheck()"><br>
<label>Password</label>
<input type="password" name="pass" style="width: 165px;" required="required"><br>
<label>Retype Password</label>
<input type="password" name="pass2" style="width: 165px;" required="required"><br>
<label>Name</label>
<input type="text" name="name" style="width: 165px;" required="required" maxlength="20"><br>
<label>Profile-image</label>
<input type="file" name="file" style="text-align:right;"><br>
<label>E-Mail</label>
<input type="email" name="email" style="width: 165px;" required="required" maxlength="50"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
    <input id = "postcode1" name = "postcode1" type = "text" value = "" style="width: 125px;" readonly/> -
    <input id = "postcode2" name = "postcode2" type = "text" value = "" style="width: 125px;" readonly/>&nbsp;
    <input type = "button" onClick = "openDaumZipAddress()" value = "주소 찾기" />
    <br/>
    <input type="text" id = "address" name = "address" value = "" style="width: 200px;" readonly/>
    <input type="text" id = "address_etc" name = "address_etc" value = "" style="width: 200px;"/><br>

<label>Phone Number</label>
<input type="text" name="phone" maxlength="20"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" maxlength="20"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
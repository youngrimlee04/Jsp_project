<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div class="clear"></div>
		<div id="main_img"><img src="../images/main_img_rim.jpg"
 width="971" height="282"></div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="notice.jsp">자료실</a></li>
				<li><a href="galary.jsp">갤러리</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->
		<form action="gfwritePro.jsp" method="post" enctype="multipart/form-data">
		<article>
			<h1>Galary</h1>
			<%String id = (String)session.getAttribute("id"); %>
			<table id="notice">
				<tr>
					<th class="tread">Writer</th>
					<td><input type="text" name="name" value="<%=id%>" style="background-color: #dcdcdc"  readonly></td>
					<th class="tdate">Password</th>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<th class="tread">Title</th>
					<td colspan="3"><input type="text" name="subject" size="50"></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: right;">파일</td><td><input type="file" name="file" style="text-align: right;"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: left; vertical-align: top;"><textarea name="content" rows="20" cols="80"></textarea></td>
				</tr>
			</table>
			<div id="table_search" style="text-align: right;">
			<input type="submit" value="글쓰기" class="btn"><br><br>
			</div>
			<div class="clear"></div>
			<div id="page_control"></div>
		</article>
		</form>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>

<%@page import="board3.BoardBean3"%>
<%@page import="board3.BoardDAO3"%>
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
<%
int num = Integer.parseInt(request.getParameter("num"));

BoardDAO3 bdao = new BoardDAO3();
BoardBean3 bb = bdao.getContent(num);
%>
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
		<form action="gupdatePro.jsp?num=<%=bb.getNum()%>" method="post" enctype="multipart/form-data">
		<article>
			<h1>갤러리</h1>
			<table id="notice">
				<tr>
					<th class="tread">Writer</th>
					<td><input type="text" name="name" value="<%=bb.getName()%>" style="background-color: #dcdcdc" readonly></td>
					<th class="tdate">Password Check</th>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<th class="tread">Title</th>
					<td colspan="3"><input type="text" name="subject" size="70" value="<%=bb.getSubject()%>"></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: right;">첨부된 파일 : <%=bb.getFile() %> 파일</td><td><input type="file" name="file" style="text-align: right;"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: left; vertical-align: top;"><textarea name="content" rows="20" cols="80"><%=bb.getContent() %></textarea></td>
				</tr>
			</table>
			<div id="table_search" style="text-align: right;">
			<input type="submit" value="글수정" class="btn">
			<input type="button" value="취소" class="btn" onclick="history.back()"><br><br>
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
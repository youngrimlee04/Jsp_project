<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">BlockChain News</a></li>
<li><a href="#">Individual Portfolio</a></li>
<li><a href="../center/fnotice.jsp">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<%
String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("../member/login.jsp");
}

%>

<article>

<h1>Notice Content</h1>
<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
<table id="notice">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id%>" readonly></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass" required="required"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>파일</td><td><input type="file" name="file"></td ></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
</table>

<div id="table_search">
<!-- //<input type="button" value="글쓰기" class="btn" onclick="location.href='writeForm.jsp'"> -->
<input type="submit" value="글쓰기" class="btn" onclick="location.href='notice.jsp'">
<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
</div>
<div class="clear"></div>
<div id="page_control">
</div>
</form>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
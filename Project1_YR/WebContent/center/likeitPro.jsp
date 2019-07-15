<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="/inc/top.jsp" />
<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">My Portfolio</a></li>
<li><a href="../galary/galary.jsp">Gallery</a></li>
</ul>
</nav>
<!-- 게시판 -->
<%
String id=(String)session.getAttribute("id");
int num = Integer.parseInt(request.getParameter("num"));

BoardDAO bdao = new BoardDAO();
MemberDAO mdao = new MemberDAO();

bdao.updateLikeit(num);
%>
	<script type="text/javascript">
	  alert("이 글을 좋아합니다.");
	  location.href="content.jsp?num=<%=num %>&likeitReturn=ok";
	</script>  

<article>
<form action="../center/content.jsp?num=+<%=num %>" method="post">
</form>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
</div>
</body>
</html>
</body>
</html>
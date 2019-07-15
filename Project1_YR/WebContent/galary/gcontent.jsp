
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
	%>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div class="clear"></div>
		<div id="main_img"><img src="../images/main_img_rim.jpg" width="971" height="282"></div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="notice.jsp">My Portfolio</a></li>
				<li><a href="galary.jsp">갤러리</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->
		<article>
			<h1>갤러리</h1>
			<table id="notice">
				<%
					BoardDAO3 bdao = new BoardDAO3();
					bdao.updateReadcount(num);
					BoardBean3 bb = bdao.getContent(num);
					
				%>
				<tr>
					<th class="tno">No.</th>
					<td><%=bb.getNum()%></td>
					<th class="tno">Read</th>
					<td><%=bb.getReadcount()%></td>
				</tr>
				<tr>
					<th class="tno">Writer</th>
					<td><%=bb.getName()%></td>
					<th class="tno">Date</th>
					<td><%=bb.getDate()%></td>
				</tr>
				<tr>
					<th class="tno">Title</th>
					<td colspan="3"><%=bb.getSubject()%></td>
				</tr>
				<tr>
					<%
						if (bb.getFile() == null) {
						} else {
					%>
					<td colspan="4" style="text-align: right;">첨부파일 <a
						href="../upload3/<%=bb.getFile()%>" download><%=bb.getFile()%></a>
						<%
							}
						%>
				</tr>
				<tr>
					<td colspan="4"
						style="height: 400px; text-align: left; vertical-align: top;">
						<img src="../upload3/<%=bb.getFile()%>" style="max-width: 100%; height: auto;"><br> <%=bb.getContent()%></td>
				</tr>
			</table>
			<div id="table_search">
				<input type="button" value="글목록" class="btn"
					onclick="location.href='galary.jsp'"> 
					<% String id = (String)session.getAttribute("id");
				if(id != null) { 
				if(id.equals(bb.getName())) {%>
					<input type="button"
					value="글삭제" class="btn"
					onclick="window.open('gdeleteForm.jsp?num=<%=bb.getNum()%>','비밀번호 확인', 'width=270,height=170,location=no,status=no,scrollbars=yes')">
				<input type="button" value="글수정" class="btn"
					onclick="location.href='gupdateForm.jsp?num=<%=bb.getNum()%>'">
					<% }
				} %>
			</div>
			<div class="clear"></div>
			<div id="page_control"></div>
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
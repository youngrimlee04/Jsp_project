<%@page import="board3.BoardDAO3"%>
<%@page import="board3.BoardBean3"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

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
		String id = (String)session.getAttribute("id");
	
		BoardDAO3 bdao = new BoardDAO3();

		// 	List boardList = bdao.getBoardList();

		int count = bdao.getBoardCount();

		int pageSize = 9;

		String pageNum = request.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int startRow = currentPage * pageSize - 8;
		int endRow = currentPage * pageSize;

		List boardList = bdao.getBoardList(startRow, pageSize);

		int totalPage = count / pageSize;
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
				<li><a href="../center/notice.jsp">My Portfolio</a></li>
				<li><a href="../galary/galary.jsp">갤러리</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->
		<article>
			<h1>My traces so far..</h1>
				<%
					for (int i = 0; i < boardList.size(); i++) {
						BoardBean3 bb = (BoardBean3) boardList.get(i);
				%>

					<div style="display: inline-block;">
					<a href="gcontent.jsp?num=<%=bb.getNum()%>"><img src="../upload3/<%=bb.getFile() %>" width="200" height="200"></a><br>
					<div style="text-align: center">
					<%=bb.getSubject()%><br>
					<%=bb.getName()%><br>
					<%=bb.getDate()%><br>
					<%=bb.getReadcount()%></div>
					</div>

				<%
					}
				%>

<section>
			<div id="table_search">
				<form action="galarySearch.jsp" method="get">
				<input type="text" name="search" class="input_box"> <input type="submit" value="검색" class="btn">
					<%if(id != null) { %>
					<input type="button" value="글쓰기" class="btn" onclick="location.href='gwrite.jsp'">
					<% } %>
					</form>
					</div>
			<div class="clear"></div>
			</section> 
			<div id="page_control" style="width: 100%">
				<%
			if (count != 0) {
				int pageCount = count / pageSize + ((count % pageSize == 0) ? 0 : 1);
				int pageBlock = 10;

				int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount) {
					endPage = pageCount;
				}
				
				if(startPage > pageBlock) {
					%><a href="?pageNum=<%=startPage-pageBlock%>">[이전]</a><%
				}

				for (int i = 1; i <= endPage; i++) {
		%><a href="?pageNum=<%=i%>">[<%=i%>]</a>
		<%
			}
				if(endPage < pageCount) {
					%><a href="?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
				}
			}
		%>
			</div>
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
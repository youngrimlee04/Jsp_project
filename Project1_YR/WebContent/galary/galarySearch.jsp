
<%@page import="board3.BoardBean3"%>
<%@page import="board3.BoardDAO3"%>
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
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://jsp5shim.googlecode.com/svn/trunk/jsp5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String search = request.getParameter("search");
	
		String id = (String)session.getAttribute("id");
	
		BoardDAO3 bdao = new BoardDAO3();

		// 	List boardList = bdao.getBoardList();

		int count = bdao.getBoardCount(search);

		int pageSize = 9;

		String pageNum = request.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int startRow = currentPage * pageSize - 8;
		int endRow = currentPage * pageSize;

		List boardList = bdao.getBoardList(startRow, pageSize, search);

		int totalPage = count / pageSize;
	%>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div class="clear"></div>
		<div id="main_img"><img src="../images/center/jenesis.jpg"
 width="971" height="282"></div>
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
<!-- 			<table id="notice"> -->
<!-- 				<tr> -->
<!-- 					<th class="tno">No.</th> -->
<!-- 					<th class="ttitle">Title</th> -->
<!-- 					<th class="twrite">Picture</th> -->
<!-- 					<th class="twrite">Writer</th> -->
<!-- 					<th class="tdate">Date</th> -->
<!-- 					<th class="tread">Read</th> -->
<!-- 				</tr> -->
				<%
					for (int i = 0; i < boardList.size(); i++) {
						BoardBean3 bb = (BoardBean3) boardList.get(i);
				%>
<!-- 				<tr> -->
<%-- 					<td><%=bb.getNum()%></td> --%>
					<div style="display: inline-block;">
					<a href="gcontent.jsp?num=<%=bb.getNum()%>"><img src="../upload/<%=bb.getFile() %>" width="200" height="200"></a><br>
					<div style="text-align: center">
					<%=bb.getSubject()%><br>
					<%=bb.getName()%><br>
					<%=bb.getDate()%><br>
					<%=bb.getReadcount()%></div>
					</div>
<!-- 				</tr> -->
				<%
					}
				%>
<!-- 			</table> -->
<section>
			<div id="table_search">
				<input type="text" name="search" class="input_box"> <input
					type="button" value="검색" class="btn"><br><br>
					<span style="float:right"><%if(id != null) { %>
					<input type="button" value="글쓰기" class="btn" onclick="location.href='gwrite.jsp'"></span>
					<% } %>
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
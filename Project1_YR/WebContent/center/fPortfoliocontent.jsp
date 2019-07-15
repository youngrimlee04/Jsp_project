<%@page import="board2.BoardBean2"%>
<%@page import="board2.BoardDAO2"%>
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
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/Portfolio.jsp">YR's interests</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
// int num = num파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
// 객체생성 BoardDAO bdao
BoardDAO2 bdao=new BoardDAO2();
BoardBean2 bb2=bdao.getBoard2(num);
bdao.updateReadcount(num);
%>
<article>
<h1>Notice</h1>
<table id="notice">
<tr><td class="tno">글번호</td><td><%=bb2.getNum() %></td>
    <td class="tno">조회수</td><td><%=bb2.getReadcount() %></td></tr>
<tr><td class="tno">이영림</td><td><%=bb2.getName() %></td>
    <td class="tno">작성일</td><td><%=bb2.getDate() %></td></tr>
<tr><td class="tno">글제목</td><td colspan="3"><%=bb2.getSubject() %></td></tr>
<tr><td class="tno">글내용</td><td colspan="3"><%=bb2.getContent() %></td></tr>
<tr><td>첨부파일</td>
		<td  colspan="3">
		<a href="../upload2/<%=bb2.getFile()%>"><%=bb2.getFile()%></a>
		<a href="file_down3.jsp?file_name=<%=bb2.getFile()%>"><%=bb2.getFile()%></a>
		<img src="../upload2/<%=bb2.getFile()%>" width="50" height="50"></td></tr>
</table>
<div id="table_search">
<%
//세션값 가져오기

String id=(String)session.getAttribute("id");
if(id!=null) {
	if(id.equals(bb2.getName())){
	

%>

<input type="button" value="글수정" class="btn" onclick="location.href='portfoupdateForm.jsp?num=<%=bb2.getNum()%>'">
<input type="button" value="글삭제" class="btn" onclick="location.href='portfodeleteForm.jsp?num=<%=bb2.getNum()%>'">
<%
 }
}
%>
<input type="button" value="글목록" class="btn" onclick="location.href='Portfolio.jsp'">
</div>
<div class="clear"></div>
<div id="page_control">
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
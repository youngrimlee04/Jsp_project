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
<li><a href="#">YR Portfolio</a></li>
</ul>
</nav>
<!-- 게시판 -->
<%
// int num = num파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
// 객체생성 BoardDAO bdao
BoardDAO bdao=new BoardDAO();
// BoardBean bb  =   getBoard(num)
BoardBean bb=bdao.getBoard(num);
%>
<article>
<h1>My Portfolio</h1>
<table id="notice">
<tr><td class="tno">글번호</td><td><%=bb.getNum()%></td>
    <td class="tno">조회수</td><td><%=bb.getReadcount()%></td></tr>
<tr><td class="tno">작성자</td><td><%=bb.getName()%></td>
    <td class="tno">글쓴날짜</td><td><%=bb.getDate()%></td></tr>
<tr><td class="tno">글제목</td><td colspan="3"><%=bb.getSubject()%></td></tr>
<tr><td class="tno">글내용</td><td colspan="3"><%=bb.getContent()%></td></tr>
<tr><td>첨부파일</td>
		<td  colspan="3">
		<a href="../upload/<%=bb.getFile()%>"><%=bb.getFile()%></a>
		<a href="file_down2.jsp?file_name=<%=bb.getFile()%>"><%=bb.getFile()%></a>
		<img src="../upload/<%=bb.getFile()%>" width="50" height="50"></td></tr>
</table>
<div id="table_search">
<%
//세션값 가져오기

String id=(String)session.getAttribute("id");
if(id!=null) {
	if(id.equals(bb.getName())){
	

%>

<input type="button" value="글수정" class="btn" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="글삭제" class="btn" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">
<%
 }
}
%>
<input type="button" value="글목록" class="btn" onclick="location.href='fnotice.jsp'">
</div>
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
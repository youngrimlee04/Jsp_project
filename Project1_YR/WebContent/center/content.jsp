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
<!-- 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">My Portfolio</a></li>
<li><a href="../galary/galary.jsp">갤러리</a></li>
</ul>
</nav>
<!-- 게시판 -->
<%
// int num = num파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String likeitReturn = request.getParameter("likeitReturn");
// 객체생성 BoardDAO bdao
BoardDAO bdao=new BoardDAO();

// 페이지에서 좋아요 하고 새로고침 했을 때 조회수 올라가는 것 방지
if(likeitReturn == null || !likeitReturn.equalsIgnoreCase("ok")) {
	bdao.updateReadcount(num);
}
//bdao.updateLikeit(num);
BoardBean bb = bdao.getContent(num);
%>
<article>
<h1>Portfolio</h1>
<table id="notice">
<tr>
<td class="tno">좋아요</td><td><%=bb.getLikeit() %> </td>
<td class="tno">글번호</td><td><%=bb.getNum() %></td>
<td class="tno">조회수</td><td><%=bb.getReadcount() %></td>
</tr>

<tr>
<td class="tno">작성자</td><td><%=bb.getName() %></td>
<td class="tno" colspan="3">글쓴날짜</td><td><%=bb.getDate() %></td>
</tr>

<tr>
<td class="tno">글제목</td><td colspan="5"><%=bb.getSubject() %></td>
</tr>

<tr>
<td class="tno">글내용</td><td colspan="5"><%=bb.getContent() %></td>
</tr>

<tr>
<td>첨부파일</td>
<td  colspan="5">
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

<%
 }
	%> 
	<input type="button" value="글수정" class="btn" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
    <input type="button" value="글삭제" class="btn" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">
	<input type="button" value="답글쓰기" class="btn" onclick="location.href='../boardre/reWriteForm.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
    <input type="image" src="../images/likeit.png" onclick="location.href='../center/likeitPro.jsp?num=<%=bb.getNum() %>'">
<% 
}
%>
<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
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
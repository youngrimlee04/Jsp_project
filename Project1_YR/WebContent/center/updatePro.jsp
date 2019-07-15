<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/center/updatePro.jsp</h1>

<%
//한글 가져오기
request.setCharacterEncoding("utf-8");

// 파라미터 가져오기 num, name, pass, subject, content
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

//자바빈
BoardBean bb=new BoardBean();
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

BoardDAO bdao = new BoardDAO();

int check = bdao.numPassCheck(bb);

if (check == 1) {
	bdao.updateBoard(bb);
	response.sendRedirect("notice.jsp");
}
else if (check == 0) {
%>
<script type="text/javascript">
alert("비밀번호 틀림");
history.back();
</script>
<%
} else {
	%>
	<script type="text/javascript">
	alert("넘버 없음");
	history.back();
	</script>
	<%
}
%>
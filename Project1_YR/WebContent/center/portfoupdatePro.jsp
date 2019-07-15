<%@page import="board2.BoardDAO2"%>
<%@page import="board2.BoardBean2"%>
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
<h1>WebContent/center/portfoupdatePro.jsp</h1>

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
BoardBean2 bb2=new BoardBean2();
bb2.setNum(num);
bb2.setName(name);
bb2.setPass(pass);
bb2.setSubject(subject);
bb2.setContent(content);

BoardDAO2 bdao = new BoardDAO2();

int check = bdao.numPassCheck(bb2);

if (check == 1) {
	bdao.updateBoard2(bb2);
	response.sendRedirect("Portfolio.jsp");
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
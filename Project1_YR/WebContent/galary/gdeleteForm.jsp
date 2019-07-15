<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body style="background-color: white;">
	<%
		int num = Integer.parseInt(request.getParameter("num"));
	%>
	
	<form action="gdeletePro.jsp" method="post">
	<img src="../images/s.png" width="220" height="62" alt="DELETE" style="margin-left: 10px"> <br>
		<input type="hidden" name="num" value="<%=num%>"> <p style="padding-left: 20px">비밀번호 확인 : <input
			type="password" name="pass" size="15"> </p> <br>
		
			<input type="submit" value="글삭제" class="btn" style="margin: auto; width: 80%;">
	</form>
</body>
</html>
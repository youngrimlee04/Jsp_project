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
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

Class.forName("com.mysql.jdbc.Driver");

String dburl = "jdbc:mysql://localhost:3306/jspdb1";
String dbuser = "jspid";
String dbpass = "jsppass";

Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);

String sql = "select * from board3 where num = ?";

PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1,num);

ResultSet rs = pstmt.executeQuery();

if(rs.next()) {
	if(pass.equals(rs.getString("pass"))) {
		sql = "DELETE FROM board3 where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		%><script type="text/javascript">
		window.close();
		opener.location.href="galary.jsp";
		</script> <%
	}else {
		%> 
		<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다.")
		history.back();
		</script>
		<%
	}
	
}

%>
</body>
</html>
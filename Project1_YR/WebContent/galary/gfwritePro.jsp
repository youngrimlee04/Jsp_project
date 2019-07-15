<%@page import="board3.BoardDAO3"%>
<%@page import="board3.BoardBean3"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
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
<h1>WebContent/board/fwritePro.jsp</h1>
<%
String uploadPath = request.getRealPath("/upload3");
System.out.println("upload 폴더의 물리적 위치 : "+uploadPath);
int maxSize = 5*1024*1024;
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());


String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String file = multi.getFilesystemName("file");

BoardBean3 bb = new BoardBean3();
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setFile(file);

BoardDAO3 bdao = new BoardDAO3();

bdao.finsertBoard(bb);

%>
<script type="text/javascript">
alert("글쓰기 성공!");
location.href="galary.jsp";
</script>


</body>
</html>
<%@page import="board2.BoardDAO2"%>
<%@page import="board2.BoardBean2"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdk.nashorn.internal.ir.ForNode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/Board/PortfowritePro.jsp</h1>
<%
String uploadPath=request.getRealPath("/upload2");
int maxSize=5*1024*1024; 

MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

request.setCharacterEncoding("utf-8");

String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");

// BoardBean 객체 생성 bb
BoardBean2 bb2=new BoardBean2();


//BoardBean 멤버변수에 파라미터값 저장
bb2.setName(name);
bb2.setPass(pass);
bb2.setSubject(subject);
bb2.setContent(content);
bb2.setFile(file);


// BoardDAO 객체 생성 bdao
BoardDAO2 bdao = new BoardDAO2();

// insertBoard(bb) 메서드 호출
bdao.finsertBoard2(bb2);
%>
<script type="text/javascript">
alert("글쓰기완료");
location.href="Portfolio.jsp";
</script>

</body>
</html>
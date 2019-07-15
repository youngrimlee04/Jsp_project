<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
<h1>WebContent/Board/fwritePro.jsp</h1>
<%
//WEB INF LIB 밑에 cos.jar가 꼭 있어야 함
// 


String uploadPath=request.getRealPath("/upload"); //만든 upload 폴더의 물리적 경로를 가져옴
//System.out.println("upload 물리적 위치"+uploadPath);

// 업로드할 파일 최대 크기((5M임, 10으로 하고 싶으면 5 대신 10으로 수정)
int maxSize=5*1024*1024; 

// MultipartRequest 객체 생성하면 upload 폴더에 파일이 업로드됨
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());


//request.setCharacterEncoding("utf-8");

//multi에 있는 정보를 받아옴
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");

// 업로드된 파일 이름 (fwriteform에 입력된 file의 name)
String file=multi.getFilesystemName("file");

// 패키지 board 파일 BoardBean 객체 만들기하면서 BoardBean.java에도 파일 만드는 곳 생성
// private String file; 선언하고 get/set


// BoardBean 객체 생성 bb
BoardBean bb=new BoardBean();


//BoardBean 멤버변수에 파라미터값 저장

bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setFile(file);


// 패키지 board 파일 BoardDAO 만들기 / insertBoard(bb) 메서드 만들기

// BoardDAO 객체 생성 bdao
BoardDAO bdao = new BoardDAO();

// insertBoard(bb) 메서드 호출
bdao.finsertBoard(bb);
%>
<script type="text/javascript">
alert("글쓰기완료");
location.href="fnotice.jsp";
</script>

</body>
</html>
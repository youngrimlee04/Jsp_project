<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String uploadPath = request.getRealPath("/upload3");
System.out.println("upload3 폴더의 물리적 위치 : "+uploadPath);
int maxSize = 5*1024*1024;
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

int num=Integer.parseInt(request.getParameter("num"));
String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String file = multi.getFilesystemName("file");

Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
//3단계 sql 조건 num에 해당하는 게시판글 가져오기
String sql="select * from board3 where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
//4단계 실행해서 결과 저장 
ResultSet rs=pstmt.executeQuery();
//5단계 rs 저장되어있는 데이터 첫행(다음행)이동 데이터 있으면
//      비밀번호 비교 맞으면  
//    3단계 sql update 수정 name subject content 조건 num일치하면
//    4단계 실행   "수정성공"  list.jsp 이동
//                 틀리면  "비밀번호틀림" 뒤로이동
if(rs.next()){
	
	if(pass.equals(rs.getString("pass"))){
//   3단계 sql update 수정 name subject content 조건 num일치하면
		sql="update board3 set subject=?,content=?,file=? where num=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, content);
		pstmt.setString(3, file);
		pstmt.setInt(4, num);
		pstmt.executeUpdate();
		%>
		<script type="text/javascript">
			alert("수정성공");
			location.href="galary.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("비밀번호틀림");
			history.back();
		</script>
		<%
	}
}
%>
</body>
</html>

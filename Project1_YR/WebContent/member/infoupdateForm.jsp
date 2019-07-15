<%@page import="Member.MemberBean"%>
<%@page import="Member.MemberDAO"%>
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
String id=(String)session.getAttribute("id");
if(id==null) {
	response.sendRedirect("login.jsp");
}

// MemberDAO md 객체 생성
MemberDAO md=new MemberDAO();

// MemberBean mb=getMember(id) 메서드 호출
MemberBean mb=md.getMember(id);
%>

<h1>회원정보 수정</h1>
<form action="infoupdatePro.jsp" method="post" enctype="multipart/form-data">
아이디 : <input type="text" name="id" value="<%=id%>" readonly><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name" value="<%=mb.getName()%>"><br>
회원사진 : <input type="file" name="file" value="<%=mb.getFile()%>"><br>
전화번호 :  <input type="text" name="mobile" value="<%=mb.getMobile()%>"><br>
주소 : <input type="text" name="address" value="<%=mb.getAddress()%>"><br>
이메일 : <input type="text" name="email" value="<%=mb.getEmail()%>"><br>

<input type="submit" value="회원정보 수정">
</form>
</body>
</html>
<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberBean"%>
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
//name이 한글이니 한글 처리

String id=request.getParameter("id");
String pass=request.getParameter("pass");


// 자바빈
MemberBean mb=new MemberBean();
mb.setId(id);
mb.setPass(pass);


MemberDAO md = new MemberDAO();

int check = md.userCheck(id, pass);

if (check == 1) {
	md.deleteMember(id);
	response.sendRedirect("../center/notice.jsp");
	session.invalidate();
%>
<script type="text/javascript">
alert("회원정보 삭제 성공");
history.back();
</script>
<% 
}
else if (check == 0) {
	%>
<script type="text/javascript">
alert("비밀번호 틀림");
history.back();
</script>
<%
} 
else {
}
%>
</body>
</html>
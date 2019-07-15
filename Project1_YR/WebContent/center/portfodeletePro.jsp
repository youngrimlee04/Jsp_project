<%@page import="board2.BoardDAO2"%>
<%@page import="board2.BoardBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/center/portfodeletePro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
//name이 한글이니 한글 처리

int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");


// 자바빈
BoardBean2 bb2=new BoardBean2();
bb2.setNum(num);
bb2.setName(name);
bb2.setPass(pass);


BoardDAO2 bdao = new BoardDAO2();

int check = bdao.numPassCheck(bb2);

if (check == 1) {
	bdao.deleteBoard2(num);
	response.sendRedirect("Portfolio.jsp");
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
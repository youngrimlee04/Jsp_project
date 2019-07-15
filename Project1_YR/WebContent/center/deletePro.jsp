<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/center/deletePro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
//name이 한글이니 한글 처리

int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");


// 자바빈
BoardBean bb=new BoardBean();
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);


BoardDAO bdao = new BoardDAO();

int check = bdao.numPassCheck(bb);

if (check == 1) {
	bdao.deleteBoard(num);
	response.sendRedirect("notice.jsp");
	session.invalidate();
%>
<script type="text/javascript">
alert("삭제 완료");
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
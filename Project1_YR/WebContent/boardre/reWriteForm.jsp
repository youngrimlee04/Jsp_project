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
int num=Integer.parseInt(request.getParameter("num"));
int re_ref=Integer.parseInt(request.getParameter("re_ref"));
int re_lev=Integer.parseInt(request.getParameter("re_lev"));
int re_seq=Integer.parseInt(request.getParameter("re_seq"));
String id = (String)session.getAttribute("id");
%>



<h1>MyPortfolio 게시판 답글</h1>
<form action="reWritePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="re_ref" value="<%=re_ref%>">
<input type="hidden" name="re_lev" value="<%=re_lev %>">
<input type="hidden" name="re_seq" value="<%=re_seq%>">

	<table id="notice">
				<tr>
					<th class="tread">Writer</th>
					<td><input type="text" name="name" value="<%=id%>" style="background-color: #dcdcdc"  readonly></td>
					<th class="tdate">Password</th>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<th class="tread">Title</th>
					<td colspan="3"><input type="text" name="subject" value="[답글]" size="50"></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: right;">파일</td><td><input type="file" name="file" style="text-align: right;"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: left; vertical-align: top;"><textarea name="content" rows="20" cols="80"></textarea></td>

<tr><td colspan="2"><input type="submit" value="글쓰기" class="btn">
<input type="reset" value="다시쓰기" class="btn"></td>

</tr>
</table>
</form>
</body>
</html>

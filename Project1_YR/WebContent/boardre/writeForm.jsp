<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/boardRe/writeForm.jsp</h1>
<h1>게시판 글등록</h1>
<form action="writePro.jsp" method="post">
<table border="1">
<tr><td>글쓴이</td><td><input type="text" name="name"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass" required="required"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>

<tr><td colspan="2"><input type="submit" value="글쓰기">
<input type="reset" value="다시쓰기"></td></tr>
</table>
</form>
</body>
</html>

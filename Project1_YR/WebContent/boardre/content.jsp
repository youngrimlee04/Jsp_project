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

	<%
	//num 파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	
	// BoardDAO bdao 객체 생성
	BoardDAO bdao = new BoardDAO();
	
// 	BoardBean bb =getBoard(num) 메서드 만들고 호출
	BoardBean bb=bdao.getBoard(num);
	
	// 조회수 증가 readcount 1씩 증가하는 updateReadcount(num) 함수 만들기
	// update 구문에서 readcount가 몇개인지는 모르고 기존 readcount에 +1하는 작업
    
	bdao.updateReadcount(num);
		
	%>

	<h1>WebContent/Board/content.jsp</h1>
	<h1>글 내용 상세 보기</h1>		
		<table border="1">
		<tr><td>글번호</td><td><%=bb.getNum()%></td><td>조회수</td><td><%=bb.getReadcount()%> </td></tr>
		<tr><td>작성자</td><td><%=bb.getName()%></td><td>글쓴날짜</td><td><%=bb.getDate()%></td></tr>
		<tr><td>글제목</td><td  colspan="3"><%=bb.getSubject()%></td></tr>
		<tr><td>첨부파일</td>
		<td  colspan="3">
		<a href="../upload/<%=bb.getFile()%>"><%=bb.getFile()%></a>
		<a href="file_down2.jsp?file_name=<%=bb.getFile()%>"><%=bb.getFile()%></a>
		<img src="../upload/<%=bb.getFile()%>" width="50" height="50"></td></tr>
		<tr><td>글내용</td><td  colspan="4"><%=bb.getContent()%></td></tr>
       	<tr><td colspan="4"> 
		<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
		<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">
		<input type="button" value="답글쓰기" onclick="location.href='reWriteForm.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
		<input type="button" value="글목록" onclick="location.href='list.jsp'"></tr>
	    </table>
	
</body>
</html>
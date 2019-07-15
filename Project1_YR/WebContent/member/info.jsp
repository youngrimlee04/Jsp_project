<%@page import="Member.MemberBean"%>
<%@page import="Member.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더가 들어가는 곳 -->
<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="../center/notice.jsp">게시판으로 이동</a></li>
				<li><a href="../member/infoupdateForm.jsp">회원정보 수정</a></li>
				<li><a href="../member/infodeleteForm.jsp">회원정보 삭제</a></li>
			</ul>
		</nav>

<!-- 왼쪽메뉴 -->
<!-- 내용 -->

<h1>회원정보 조회 및 수정 삭제</h1>
<%
  
String id=(String)session.getAttribute("id");

if(id==null) {
response.sendRedirect("login.jsp");
}

// MEMBERDAO MD 객체생성 후 여기에 있는 getMember 함수 호출
MemberDAO md=new MemberDAO();
MemberBean mb=md.getMember(id);
	%>
<table id="notice">
<tr><th class="tno">아이디</th><td><%=mb.getId()%></td>
    <th class="tno">이름</th><td><%=mb.getName()%></td></tr>
<tr><th class="tfile">회원사진</th>
	<td><img src="../upload2/<%=mb.getFile() %>" width="200" height="200"></td></tr>    
<tr><th class="tno">주소</th><td><%=mb.getAddress()%></td></tr>
<tr><th class="tno">이메일</th><td colspan="3"><%=mb.getEmail()%></td></tr>
<tr><th class="tno">핸드폰번호</th><td colspan="3"><%=mb.getMobile()%></td></tr>
<tr><th class="tno">전화번호</th><td colspan="3"><%=mb.getPhone()%></td></tr>
<tr><th class="tno">가입날짜</th><td colspan="3"><%=mb.getReg_date()%></td></tr>
</table>

<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>

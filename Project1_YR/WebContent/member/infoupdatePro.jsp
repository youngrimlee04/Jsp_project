<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String uploadPath=request.getRealPath("/upload2");
int maxSize=5*1024*1024; 

MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

request.setCharacterEncoding("utf-8");
//name이 한글이니 한글 처리

String id=multi.getParameter("id");
String pass=multi.getParameter("pass");
String name=multi.getParameter("name");
String mobile=multi.getParameter("mobile");
String address=multi.getParameter("address");
String email=multi.getParameter("email");
String file=multi.getFilesystemName("file");
//Timestamp reg_date=new Timestamp(System.currentTimeMillis());

// 자바빈
MemberBean mb=new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setMobile(mobile);
mb.setAddress(address);
mb.setEmail(email);
mb.setFile(file);
// mb.setReg_date(reg_date);

MemberDAO md = new MemberDAO();

int check = md.userCheck(id,pass);

if (check == 1) {
	md.updateMember(mb);
	response.sendRedirect("../center/notice.jsp");
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
	
	%>
	<script type="text/javascript">
	alert("id 없음");
	history.back();
	</script>
	
	<%
}
%>


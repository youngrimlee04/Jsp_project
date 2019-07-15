<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function ok() {
	//join.jsp id 상자 value = idcheck.jsp userId 상자 value값(검색한 id값) 저장
	//alert("검색한 아이디 : "+document.wfr.userId.value);
	// 여기서 opner는 처음 여는 창인 join.jsp를 열어서 중복값을 검색하고 창을 열어서 검색한 값이 join.jsp의 value에 들어감
	// 내가 찾은 값이 join.jsp 값에 들어갈 것임
	opener.document.fr.id.value=document.wrf.userId.value;
	//창 닫기
	window.close();
}
</script>
</head>
<body>
<h1>member/idcheck.jsp</h1>
<% String id=request.getParameter("userId");
%>
입력한 id 값 : <%=id%>

<!-- // 해당 id가 DB에 있는지 찾아 오기 -->
<!-- //1. MemberDAO mdao 객체 생성 -->
<% MemberDAO mdao=new MemberDAO();

// <!// 2. int check=idCheck(id) 메서드 만들고 호출 -->
int check=mdao.idCheck(id);

// <!-- // 3. check==1 "아이디 중복" , 비번 비교 할 필요 없음-->
if(check==1){
	%>아이디중복<% 
}else{
	%>아이디중복 아님 사용가능한 아이디
<input type="button" value="아이디사용" onclick="ok()"> <% 			
}
%>
<form action="idcheck.jsp" name="wrf">
아이디 : <input type="text" name="userId" value="<%=id%>"><br>
<input type="submit" value="아이디 찾기">
</form>
</body>
</html>
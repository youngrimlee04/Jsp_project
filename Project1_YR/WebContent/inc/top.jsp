<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// 세션값 가져오기
String id = (String)session.getAttribute("id"); 

//세션값 없는 경우 login
if(id==null) {
	%>
<div id="login"><a href="../member/login.jsp">login</a>
| <a href="../member/join.jsp">join</a></div>	
	<% 
 }else{ 
 %>
<div id="login"><%=id%>님<a href="../member/logout.jsp">logout</a>
| <a href="../member/info.jsp">info</a></div>
<% 
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/rimlogo.jpg" width="265" height="62" alt="Rim logo top"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">GREETINGS</a></li>
	<li><a href="../center/Portfolio.jsp">YR's interests</a></li>
	<li><a href="../center/notice.jsp">PORTFOLIO</a></li>
	<li><a href="../center/contactus.jsp">CONTACT US</a></li>
</ul>
</nav>
</header>
<!-- 헤더들어가는 곳 -->
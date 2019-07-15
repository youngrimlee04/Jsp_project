
<%@page import="board2.BoardBean2"%>
<%@page import="board2.BoardDAO2"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../center/fnotice.css" rel="stylesheet" type="text/css">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/Portfolio.jsp">YR's Interests</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<%
//src에서 Board라는 패키지 만들고 Boardbean.javaㄹ아 BoardDAo.java 넣기
//패키지 board 파일이름 BoardDAo
BoardDAO2 bdao=new BoardDAO2();
//객체 생성 BoardDAO bdao
int count=bdao.getBoardCount();
//= int count= 메서드 호출 getBorardCount

// 한 화면에 보여줄 글 개수
int pageSize=5;

// 페이지 번호 가져오기
String pageNum=request.getParameter("pageNum");

//페이지번호가 없으면 "1" 설정
if(pageNum==null){
pageNum="1";
}

// 시작하는 행번호 구하기
int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;

// 끝나는 행번호 구하기
int endRow=pageSize*currentPage;

List boardList=bdao.getBoardList(startRow, pageSize);
	//boardList=getBoardList(시작행번호, 몇 개)
	// getBoardList() 게시판 글 가져오기 시작행번호, 몇 개 글	
	%>
<h1>YR's Interests</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer's id</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>

<% 
for(int i=0; i<boardList.size();i++){
	BoardBean2 bb2=(BoardBean2)boardList.get(i); 
	//배열은 while이 아닌 for문 씀
	// for문은 처음과 끝을 알 때 씀
%>

<tr onclick="location.href='fPortfoliocontent.jsp?num=<%=bb2.getNum()%>'"><td><%=bb2.getNum()%></td>
<td class="left"><%=bb2.getSubject()%></td>
    <td><%=bb2.getName()%></td>
    <td><%=bb2.getDate()%></td>
    <td><%=bb2.getReadcount()%></td></tr>
    
<%
}
%>
</table>

<article>
<div id="table_search">
<%
String id=(String)session.getAttribute("id");

//세션값이 있으면 글쓰기 버튼 보이기
if(id!=null){%>
<input type="button" value="글쓰기" class="btn" onclick="location.href='portfowriteForm.jsp'">
<%  
}
%>
<input type="button" value="글목록" class="btn" onclick="location.href='Portfolio.jsp'">
</div>


<div id="table_search">
<input type="text" name="search" class="input_box">
<!-- //<input type="button" value="search" class="btn"> -->
</div>
<div class="clear"></div>
<div id="page_control">

<% 
if(count!=0){
	
int pageCount=count/pageSize+(!(count%pageSize==0)?  1 : 0);	
int pageBlock=2;
int StartPage= ((currentPage-1)/pageBlock)*pageBlock+1;
int endPage= StartPage+(pageBlock-1);
if(endPage>pageCount){
		endPage=pageCount;
}
	
	if(StartPage>pageBlock){
		%><a href="Portfolio.jsp?pageNum=<%=StartPage-pageBlock%>">[PRE]</a><% 		
	}
		
	for(int i=StartPage; i<=endPage; i++) {
	%><a href="Portfolio.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	 <%
	}
	
	if(endPage<pageCount){
	%><a href="Portfolio.jsp?pageNum=<%=StartPage+pageBlock%>">[NEXT] </a><%	
	}	
	}
	%>
	
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
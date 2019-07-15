<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../center/notice.css" rel="stylesheet" type="text/css">
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
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">My Portfolio</a></li>
<li><a href="../galary/galary.jsp">갤러리</a></li>
</ul>
</nav>

<%
//한글 처리
request.setCharacterEncoding("utf-8");

//검색어 가져오기(notice의 search 파라미터 가져옴)
String search=request.getParameter("search");

BoardDAO bdao=new BoardDAO();
//객체 생성 BoardDAO bdao

int count=bdao.getBoardCount(search);

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

List boardList=bdao.getBoardList(startRow, pageSize,search);	
	%>
	

<h1>Notice Search [검색된 전체글 개수 : <%=count %>]</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>

<% 
for(int i=0; i<boardList.size();i++){
	BoardBean bb=(BoardBean)boardList.get(i); 
	//배열은 while이 아닌 for문 씀
	// for문은 처음과 끝을 알 때 씀
%>

<tr onclick="location.href='content.jsp?num=<%=bb.getNum()%>'"><td><%=bb.getNum()%></td>
<td class="left"><%=bb.getSubject()%></td>
    <td><%=bb.getName()%></td>
    <td><%=bb.getDate()%></td>
    <td><%=bb.getReadcount()%></td></tr>
    
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
<input type="button" value="글쓰기" class="btn" onclick="location.href='writeForm.jsp'">
<%  
}
%>
<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
</div>

<!-- 검색 기능 -->
<div id="table_search">
<form action="noticeSearch.jsp" method="get">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
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
		%><a href="notice.jsp?pageNum=<%=StartPage-pageBlock%>">[PRE]</a><% 		
	}
		
	for(int i=StartPage; i<=endPage; i++) {
	%><a href="notice.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	 <%
	}
	
	if(endPage<pageCount){
	%><a href="notice.jsp?pageNum=<%=StartPage+pageBlock%>">[NEXT] </a><%	
	}	
	}
	%>
	
</div>
</article>
<!-- 게시판 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
</div>
</body>
</html>
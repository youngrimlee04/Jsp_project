<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
//Member DAO 객체 생성
BoardDAO bdao = new BoardDAO();

// 게시판 전체 글 개수 구하기 getBoardCount()
int count=bdao.getBoardCount();

// 한 화면에 보여줄 글의 개수 설정
int pageSize=3;

// 1페이지, 2페이지 등 페이지번호 가져오기
String pageNum=request.getParameter("pageNum");

// 페이지번호를 안가져온 경우 1페이지로 이동
if(pageNum==null){
pageNum="1";
}

// pageNum pageSize 이용 가져올 글의 시작행 구하기
// 1페이지 10 => 1행 ~ 10행
// 2페이지 10 => 11행 ~ 20행
// 3페이지 10 => 21행 ~ 30행
// - * +

int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;


// currentPage와 pageSize 이용 가져올 글의 끝행 구하기
int endRow=pageSize*currentPage;


// List MemberList=get MemberList(시작행, 글 개수) 함수 호출
// 시작행부터 글 개수만큼 글 가져오기(1행부터 10개, 2행은 11행부터 10개 등)
List boardList=bdao.getBoardList(startRow,pageSize);

//1~4단계 동일
%>

<h1>WebContent/Board/list.jsp</h1>
<h1>글목록[전체글 개수 : <%=count%>]</h1><a href="main.jsp">main.jsp로 이동</a>
<table border="1">
<tr><td>번호</td><td>이름</td><td>비밀번호</td><td>제목</td>
<td>내용</td><td>조회수</td><td>날짜</td></tr>
<% 
for(int i=0; i<boardList.size();i++){
	BoardBean bb=(BoardBean)boardList.get(i); 
	//배열은 while이 아닌 for문 씀
	// for문은 처음과 끝을 알 때 씀ㄴ
%>
<tr>
<td><%=bb.getNum()%></td>
<td><%=bb.getName()%></td>
<td><%=bb.getPass()%></td>


<td>
<%
int wid=0;

//답글인지 아닌 지 물어봄
if(bb.getRe_lev()>0){
	wid=bb.getRe_lev()*10;
	wid=10;
	%>
	<img src="level.gif" width="<%=wid%>" height="10">
	<img src="re.gif">
<% 
}

%>
<a href="fcontent.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject()%></a></td>
<td><%=bb.getContent()%></td><td><%=bb.getReadcount()%></td>
<td><%=bb.getDate()%></td>
</tr>
<%
}
%>
</table>
<!-- // [1][2][3] ... [10] 다음 -->
<%
// count는 게시판 전체 글의 개수
if(count!=0) {
	// 게시판 전체 페이지수
	// 글 개수 count 50개 글 한 화면에 보여줄 글 개수 10개 -> 5+0 = 5페이지
	// 글 개수 count 56개 글 한 화면에 보여줄 글 개수 10개 -> 5+1 = 6페이지
	// pageSize+(조건, 삼항 연산자 사용)
	int pageCount=count/pageSize+(!(count%pageSize==0)?  1 : 0);
	
	// 한 화면에 보여줄 페이지수 
	int pageBlock=3;
	
	// 시작하는 페이지 번호 구하기
	//1에서 10까지 페이지는 0+1이 나오게끔, 11에서 20까지는 시작 페이지가 10+1 그 다음은 20+1
	// - / *
 	int StartPage= ((currentPage-1)/pageBlock)*pageBlock+1;
	
// 	currentPage pageBlock StartPage
	
	
	
	// 끝나는 페이지 번호 구하기
	// 1~ 10은 10, 11~20은 20이 나오게
	int endPage= StartPage+(pageBlock-1);
	
	// end 페이지 구할 때 1~10 다 나오게 하지 말고, 현재 글 19면 2까지만 나오게 함
	if(endPage>pageCount){
		endPage=pageCount;
	}
	
	//이전 글자는 1이 아닌 11부터 보임 [1][2]...[10][다음]      [이전][11][12]... [20][다음]           [이전][21][22]
	if(StartPage>pageBlock){
		%><a href="list.jsp?pageNum=<%=StartPage-pageBlock%>">[이전]</a><% 		
	}
		
	for(int i=StartPage; i<=endPage; i++) {
	%><a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	 <%
	}
	
	if(endPage<pageCount){
	%><a href="list.jsp?pageNum=<%=StartPage+pageBlock%>">[다음] </a><%	
	}	
	}
	%>
	<br>
</body>
</html>
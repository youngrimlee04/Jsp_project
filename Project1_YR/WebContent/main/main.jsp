<%@page import="board3.BoardBean3"%>
<%@page import="board3.BoardDAO3"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<header>
<jsp:include page="../inc/top.jsp"></jsp:include>
</header>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img_rim.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<div id="solution">
<div id="hosting">
<h3>블록체인 최신뉴스</h3>
<p>삼성SDS 제공 블록체인은 정보를 안전하게 저장하고, 중개자 없이 
즉시 공유해 확인할 수 있어 효율적인 기업 간 협력을 이끌어낼 기술로 주목받는다. 
기업들이 실제 업무에 적용 가능한 블록체인 플랫폼에...<a href="http://it.chosun.com/site/data/html_dir/2019/03/28/2019032801272.html/"target="_blank">More</a></p>
</div>
<div id="security">
<h3>블록체인 업계동향</h3>
<p>지난 24일 방코르(Bancor)가 최근 삼성 갤럭시 S10, 갤럭시 S10+ 내 
블록체인 키스토어(Blockchain KeyStore)와 서비스를 통합한다는 소식이 들렸다. 
방코르는 이오스를 지원하는 이스라엘 기반... <a href="http://www.kinews.net/news/articleView.html?idxno=208498/"target="_blank">More</a></p>
</div>
<div id="payment">
<h3>기타</h3>
<p>삼성전자 갤럭시 S10에 암호화폐 지갑인 블록체인 키스토어가 탑재됐고, 
카카오는 4300여만명의 이용자를 보유한 카카오톡에 암호화폐 지갑 적용을 
검토 중인 것으로 알려졌다. 업계는 이같은 플랫폼들을....<a href="http://www.newstomato.com/ReadNews.aspx?no=884590/"target="_blank">More</a></p>
</div>
</div>
<div class="clear"></div>


			<div id="sec_news">
				<h3 style="padding-left: 30px;">
					<span class="gray"> Gallery</span> board
				</h3>
				<%
String id = (String)session.getAttribute("id");

BoardDAO3 bdao = new BoardDAO3();

int count2 = bdao.getBoardCount();

int pageSize = 6;

String pageNum = request.getParameter("pageNum");

if (pageNum == null) {
	pageNum = "1";
}

int currentPage = Integer.parseInt(pageNum);

int startRow = currentPage * pageSize - 5;
int endRow = currentPage * pageSize;

List boardList2 = bdao.getBoardList(startRow, pageSize);

int totalPage = count2 / pageSize;
					for (int i = 0; i < boardList2.size(); i++) {
						BoardBean3 bb = (BoardBean3) boardList2.get(i);
				%>
				<div style="display: inline-block;">
					<a href="../galary/gcontent.jsp?num=<%=bb.getNum()%>"><img
						src="../upload3/<%=bb.getFile() %>" width="125" height="125"></a><br>
				</div>
				<%
					}
				%>
				<br>
				<p style="text-align: right; padding-right: 40px;"><a href="../galary/galary.jsp" style="text-decoration: none; color: black;"><img src="../images/8.jpg"  width="25" height="25">더보기</a></p>
			</div>



<div id="news_notice">
<h3 class="gray">My portfolio</h3>
<table>
<%
//객체생성 BoardDAO bdao
BoardDAO bdao2 = new BoardDAO();

// int count=메서드호출 getBoardCount()
int count=bdao2.getBoardCount();

List boardList=null;
if(count!=0){
	
	boardList=bdao2.getBoardList(1, 5);
	
	for(int i=0; i<boardList.size();i++){
		BoardBean bb=(BoardBean)boardList.get(i); 
		%>
		<tr>
			<td><%=bb.getNum()%></td>
			<td class="left"><a
				href="../center/notice.jsp?num=<%=bb.getNum()%>"
				style="color: black; text-decoration: none;"><%=bb.getSubject()%></a></td>
			<td><%=bb.getName()%></td>
			<td width="80px"><%=bb.getDate()%></td>
			<td><%=bb.getReadcount()%></td>
		</tr>
		<%
	}	
		}
	%>
	</table>
	<p style="text-align: right; padding-right: 30px;"><a href="../center/notice.jsp" style="text-decoration: none; color: black;"><img src="../images/8.jpg" width="25" height="25">더보기</a></p>
	<div class="clear"></div>
</div>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>
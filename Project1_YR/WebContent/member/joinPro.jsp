<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Member.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
//String uploadPath=request.getRealPath("/upload2");
// localhost가 아니고 실제 서버에 올라갔을 때는 경로를 알아내야 함 
// localhost에서는 사진이 upload2에 저장
String uploadPath = "";
String path = request.getServerName();
if(path.equalsIgnoreCase("localhost")) {
	uploadPath = "C:/Users/이영림/Desktop/프로그램/Project1_YR/WebContent/upload2";
} else {
	uploadPath=request.getRealPath("/upload2");
}
//System.out.println(uploadPath);

int maxSize=5*1024*1024; 

MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

request.setCharacterEncoding("utf-8");

// id pass name email address phone mobile date 파라미터값 가져오기(자바파일mb에)
// 이거 윗부분 multipart로 바꾸고 아래 multi. 안바꿔줘서 에러 났었음

String id=multi.getParameter("id");
System.out.print(id);
String pass=multi.getParameter("pass");
String name=multi.getParameter("name");
String email=multi.getParameter("email");
String address=multi.getParameter("address");
String phone=multi.getParameter("phone");
String mobile=multi.getParameter("mobile");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());
String file = multi.getFilesystemName("file");
// 지금 이거 null값 찍힘, id 못받아오니 확인 필요함. System.out.println(id);

// MemberBean 객체 생성 mb
MemberBean mb=new MemberBean();


//MemberBean 멤버변수에 파라미터값 저장

mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);
mb.setReg_date(reg_date);
mb.setFile(file);


// JDBC 설치



// 패키지 member 파일 MemberDAO 만들기
MemberDAO mdao = new MemberDAO ();

//메서드 insertMember(mb)) 만들고 호출
mdao.insertMember(mb);

// 다 됐으면 login.jsp로 이동

%>

<script type="text/javascript">
alert("회원가입완료");
location.href="login.jsp";
</script>

</body>
</html>
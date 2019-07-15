<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.ServletUtils"%>

<!-- //jsp 책 320쪽 참고-->

<%
	request.setCharacterEncoding("utf-8");

    String fileName = request.getParameter( "file_name" );
 System.out.println(fileName);
     String savePath = "upload";
     ServletContext context = getServletContext();
     String sDownloadPath = context.getRealPath(savePath);
     String sFilePath = sDownloadPath + "\\" + fileName;

   byte b[] = new byte[4096];
   File oFile = new File(sFilePath);

   FileInputStream in = new FileInputStream(oFile);

   String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType>>>"+sMimeType );

// octet-stream은  8비트로 된 일련의 데이터로 지정되지 않은 파일 형식
 
   if(sMimeType == null) sMimeType = "application/octet-stream";
   response.setContentType(sMimeType);

   
   String userAgent = request.getHeader("User-Agent");
   boolean ie = (userAgent.indexOf("MSIE") > -1)|| (userAgent.indexOf("Trident") > -1); //익스플로러일 때 한글처리
   String sEncoding=null;
   if(ie) {
	  sEncoding = URLEncoder.encode(fileName, "utf-8").replaceAll("\\+", "%20");
	  System.out.println(sEncoding);
   }else{ //크롬일 때 한글처리
	  sEncoding = new String(fileName.getBytes("utf-8"),"8859_1");
	  System.out.println(sEncoding);
  }
   
  
// 한글 업로드 (한글 파일명이 깨지는 것을 방지)
// String sEncoding = new String(fileName.getBytes("utf-8"),"8859_1");
// System.out.println(sEncoding);

// 첨부파일 사용하게끔 header값 설정
   response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding); 
   ServletOutputStream out2 = response.getOutputStream();
   int numRead;

// 바이트 배열b의 0번 부터 numRead번 까지 브라우저로 출력
   while((numRead = in.read(b, 0, b.length)) != -1) {
    out2.write(b, 0, numRead);
   }
   out2.flush(); 
   out2.close();
   in.close();

   out.clear();
	out = pageContext.pushBody();
 //  ServletUtils.returnFile( PdsMisc.UPLOAD_DIRECTORY + File.separator + StringMisc.uniToEuc( fileName ), response.getOutputStream() );
%>

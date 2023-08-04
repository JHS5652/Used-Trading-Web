
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.Console"%>
<%@page import="java.awt.Image"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="goodsList.GoodsListDAO"%>
<%@ page import="goodsList.GoodsListDTO"%>
<%@ page import="java.io.File"%>



<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%
request.setCharacterEncoding("UTF-8");
String userID;
String fileName;
String subject;
String price;
String date;
String content;

//String uploadDir = this.getClass().getResource("").getPath();

//uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "Project/src/main/webapp/uploadImage";

String uploadDir ="D:/바탕화면/2023_웹서버구축_1학기/Project/src/main/webapp/uploadImage/image";

int maxSize = 1024 * 1024 * 1024;

String encoding = "UTF-8";

MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding,
		new DefaultFileRenamePolicy());


userID = (String) session.getAttribute("userID");

//fileName = multipartRequest.getOriginalFileName("file");
fileName = multipartRequest.getFilesystemName("file");

subject = multipartRequest.getParameter("subject");
price = multipartRequest.getParameter("price");

date = multipartRequest.getParameter("date");
content = multipartRequest.getParameter("content");

GoodsListDAO gl = new GoodsListDAO();

int result = gl.upload(userID, fileName, subject, price, date, content);

if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('상품을 추가했습니다.')");
	script.println("location.href='goodsList.jsp';");
	script.println("</script>");
	script.close();
	return;
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('한번 더 시도해주세요')");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}
%>
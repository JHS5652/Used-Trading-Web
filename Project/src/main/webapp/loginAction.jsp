<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="user" class="user.UserDTO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />


<%
request.setCharacterEncoding("UTF-8");
String userID = null;
String userPassword = null;

if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
if (userID != null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인이 되어있습니다.')");
	script.println("location.href='index.jsp';");
	script.println("</script>");
	script.close();
	return;
	
}

userID = request.getParameter("userID");
userPassword = request.getParameter("userPassword");
UserDAO userDAO = new UserDAO();
int result = userDAO.loginCheck(userID, userPassword);

if (result == 1) {
	session.setAttribute("userID", user.getUserID());
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인에 성공했습니다.')");
	script.println("location.href='main.jsp';");
	script.println("</script>");
	script.close();
	return;
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인인에 실패했습니다..')");
	script.println("location.href='index.jsp';");
	script.println("</script>");
	script.close();
	return;
}
%>
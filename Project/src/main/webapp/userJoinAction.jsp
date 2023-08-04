<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="user" class="user.UserDTO" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<%

	request.setCharacterEncoding("UTF-8");
	String userPassword = null;
	String userID = null;

	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
	}
	if (request.getParameter("userPassword") != null) {
		userPassword = (String) request.getParameter("userPassword");
	}	
	if (userID == null || userPassword == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	boolean b = userDAO.ID_Check(userID);

	if (b==true) {
		session.setAttribute("userID", user.getUserID());
		int result = userDAO.join(userID, userPassword);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.')");
		script.println("location.href='main.jsp';");
		script.println("</script>");	
		script.close();
		return;
	}else{

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 있는 아이디입니다.')");
		script.println("history.back();");
		script.println("</script>");	
		script.close();
		return;
	}
%>
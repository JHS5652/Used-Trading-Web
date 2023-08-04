<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="goodsList.GoodsListDAO"%>
<%@ page import="java.io.PrintWriter"%>


<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	UserDAO user = new UserDAO();
	GoodsListDAO gl = new GoodsListDAO();
	gl.goodsDeleteALL(userID);
	
	String num = (String)request.getParameter("num");
	int i = user.deleteUserID(userID);

	session.invalidate();
	

	if (i==-1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류')");
		script.println("location.href='main.jsp';");
		script.println("</script>");	
		script.close();
		return;
		
	}else{

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원탈퇴')");
		script.println("location.href='main.jsp';");
		script.println("</script>");	
		script.close();
		return;
	}
	%>
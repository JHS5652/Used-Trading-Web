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
	String memberID = (String)request.getParameter("memberID");
	gl.goodsDeleteALL(memberID);
	
	int i = user.deleteUserID(memberID);
	

	if (i==-1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류')");
		script.println("location.href='accountPage.jsp';");
		script.println("</script>");		
		script.close();
		return;
		
	}else{

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 삭제')");
		script.println("history.back();");
		script.println("</script>");	
		script.close();
		return;
	}
	%>
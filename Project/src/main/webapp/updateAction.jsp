<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="goodsList.GoodsListDAO"%>
<%@ page import="goodsList.GoodsListDTO"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="glDAO" class="goodsList.GoodsListDAO" scope="page" />


<%

request.setCharacterEncoding("UTF-8");
String subject = (String) request.getParameter("subject");
String price = (String) request.getParameter("price");
String date = (String) request.getParameter("date");
String content = (String) request.getParameter("content");
int num = Integer.parseInt(request.getParameter("num"));
int i = glDAO.setGoodsUpdate(subject, price, date,content, num);

if (i == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다.')");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('정보를 수정하였습니다.')");
	script.println("location.href='myGoods.jsp';");
	script.println("</script>");
	script.close();
	return;
}
%>
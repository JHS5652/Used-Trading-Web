<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="goodsList.GoodsListDAO"%>
<%@ page import="goodsList.GoodsListDTO"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="glDAO" class="goodsList.GoodsListDAO" scope="page" />


<%

	GoodsListDAO gl = new GoodsListDAO();
	String num = (String)request.getParameter("num");
	int i = gl.goodsDelete(num);
	
if (i == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('오류 발생')");
	script.println("</script>");
	script.close();
	return;
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");	
	script.println("alert('삭제하였습니다.')");
	script.println("location.href='myGoods.jsp';");
	script.println("</script>");
	script.close();
	return;
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="index_css.css">
</head>
<body>	


<div class="parents">	
    <div class="login-wrapper children">
        <h2>로그인</h2>
        <form method="post" action="./loginAction.jsp" id="login-form">
            <input type="text" name="userID" placeholder="Email">
            <input type="password" name="userPassword" placeholder="Password">
            <input type="submit" value="Login">
            <a href="register.jsp">회원가입</a>
        </form>
    </div>
</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="index_css.css">
</head>
<body>
	<div class="parents">
		<div class="login-wrapper children">
			<h2>회원가입</h2>
			<form method="post" action="./userJoinAction.jsp" id="login-form">
				<input type="text" name="userID" placeholder="Email"> <input
					type="password" name="userPassword" placeholder="Password">
				<input type="submit" value="register">
			</form>
			
            <a href="index.jsp">로그인</a>
		</div>
		
	</div>
</body>
</html>
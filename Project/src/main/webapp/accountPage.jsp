<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.util.ArrayList"%>

<head>
<meta charset="UTF-8">
<title>accountPage</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link rel="stylesheet" href="myGoods.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">학생 물품 대여 시스템</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="goodsList.jsp">중고
							물품 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="input_list.jsp">물품
							추가</a></li>
					<li class="nav-item"><a class="nav-link"
						href="myGoods.jsp?ID=<%=userID%>">내 물품</a></li>
					<%
					if (userID != null) {
						if (userID.equals("tmskdlvj124")) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="accountPage.jsp">관리자 페이지</a></li>
					<%
					}
					}
					%>
				</ul>
				<%
				if (userID != null) {
				%>
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="true"> <%=userID%>님
							안녕하세요
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
							<li><a class="dropdown-item" href="deleteUserID.jsp">회원탈퇴</a></li>
						</ul></li>

				</ul>
				<%
				} else {
				%>
				<ul class="navbar-nav ">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="true"> 접속하기 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="index.jsp">로그인</a></li>
							<li><a class="dropdown-item" href="register.jsp">회원가입</a></li>
						</ul></li>
				</ul>

				<%
				}
				%>
			</div>
		</div>
	</nav>
	<section class="container">
		<br>
		<h2>가입된 계정</h2>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">순번</th>
					<th scope="col">아이디</th>
					<th scope="col">비밀번호</th>
					<th scope="col">물품 리스트</th>
					<th scope="col">계정 삭제</th>
				</tr>
			</thead>
			<tbody>

				<%
				UserDAO glDAO = new UserDAO();
				ArrayList<UserDTO> list = glDAO.getUserList();

				for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<th scope="row"><%=i%></th>
					<td><%=list.get(i).getUserID()%></td>
					<td><%=list.get(i).getUserPassword()%></td>
					<td><button type="button" class="btn btn-primary"
							onClick="location.href='acount_MemberGoods.jsp?memberID=<%=list.get(i).getUserID()%>'">물품
							보기</button></td>
					<td><button type="button" class="btn btn-danger"
							data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button></td>
				</tr>


				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">관리자</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">삭제하시겠습니까?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal" onClick="location.href='acount_MemberDelete.jsp?memberID=<%=list.get(i).getUserID()%>'">삭제</button>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</tbody>
		</table>
	</section>



	<div class="container mt-4">
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<a href="/"
					class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
					<svg class="bi" width="30" height="24">
						<use xlink:href="#bootstrap" /></svg>
				</a> <span class="mb-3 mb-md-0 text-muted"> 2023
					copyright&copy;지현석 </span>
			</div>

			<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<use xlink:href="#twitter" /></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<use xlink:href="#instagram" /></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<use xlink:href="#facebook" /></svg></a></li>
			</ul>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</body>
</html>
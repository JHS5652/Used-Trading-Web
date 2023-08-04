<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="goodsList.GoodsListDAO"%>
<%@ page import="goodsList.GoodsListDTO"%>
<%@ page import="java.util.ArrayList"%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link rel="stylesheet" href="goodsView.css">
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


	<section class="container mt-4">


		<%
		GoodsListDAO glDAO = new GoodsListDAO();
		GoodsListDTO glDTO = new GoodsListDTO();
		glDTO = glDAO.getThisGoods(request.getParameter("num"));
		%>
		<div class="row">
			<div class=" col-7">
				<img src="uploadImage/image/<%=glDTO.getFileName()%>"
					class="img-thumbnail" alt="..."
					style="width: 800px; height: 500px;">
			</div>

			<div class="col-5">

				<div class="jumbotron">
					<div class="container">
						<h2 class="display-3"><%=glDTO.getSubject()%></h2>
					</div>
				</div>
				<hr>
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<p>
								<b>등록 아이디: </b>
								<%=glDTO.getUserID()%>
							<p>
								<b>대여 가능 날짜</b> :
								<%=glDTO.getDate()%>
							<p>
								<b>가격</b> :
								<%=glDTO.getPrice()%>원
							<p>

								<b>상품정보</b><br> <span><%=glDTO.getContent()%></span>
							<p>
							<div class="mt-4">

								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									구매</button>

								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">Message</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												이 상품에 대하여 구매 신청 하시겠습니까?
												<div class="input-group mb-3">
													<span class="input-group-text"
														id="inputGroup-sizing-default">대여 날짜</span> <input
														type="text" class="form-control"
														aria-label="Sizing example input"
														aria-describedby="inputGroup-sizing-default">
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">닫기</button>
												<button type="button" class="btn btn-primary"
													onclick="location.href='./goodsList.jsp'">구매</button>
											</div>
										</div>
									</div>
								</div>


								<button type="button" class="btn btn-secondary"
									onclick="location.href='./goodsList.jsp'">상품 목록</button>

								<!-- 								<a href="#" class="btn btn-info"> 상품 주문 &raquo;</a> <a
									href="./goodsList.jsp" class="btn btn-secondary">상품 목록
									&raquo;</a> -->
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</section>


	<div class="container">
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
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
		<link rel="icon" href="" type="image/x-icon" />
		<title>skkcandle</title>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<%-- 부트스트랩 아이콘 --%>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer/footer.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header/navHeader.css">
		<script src="${pageContext.request.contextPath}/resources/js/newHeader.js"></script>
	</head>
	<body>
		<nav class="navbar row">
			<div class="navbar_logo_box col-auto">
				<a class="navbar_logo" href="/skkcandle">
					<img src="${pageContext.request.contextPath}/resources/images/skkcandle_nuki2.png" alt="이미지를 로드할 수 없습니다">
				</a>				
			</div>
			<div class="col-5 navbar_white_space"></div>
		</nav>
		
		<nav class="navbar2">
			<ul class="navbar_menu col-6">
				<c:if test="${login != null}">
					<li><a href="mypage">마이페이지</a></li>
					<li><a href="payment">결제페이지</a></li>
					<li><a href="qna">Q&A</a></li>
					<li><a href="productList">상품리스트</a></li>
				</c:if>
				<c:if test="${login == null}">
					<li><a href="loginForm">마이페이지</a></li>
					<li><a href="loginForm">결제페이지</a></li>
					<li><a href="loginForm">Q&A</a></li>
					<li><a href="productList">상품리스트</a></li>
				</c:if>
				<li><a href="#">메뉴4</a></li>
				<li><a href="#">메뉴5</a></li>
			</ul>
			
			<div class="col-4 d-flex icon_menu">
				<button class="mobile_menu">
					<i class="bi bi-list"></i>
				</button>
				<div class="d-flex">
					<c:if test="${login != null}">
						<a class="navbar_short_icon" href="getCartList">
							<i class="bi bi-cart"> Cart</i>
						</a>
						<a class="navbar_short_icon" href="logout">
							<i class="bi bi-box-arrow-right"> Logout</i>
						</a>
						<a class="navbar_short_icon" href="mypage">
							<i class="bi bi-person"> myPage</i>	
						</a>
					</c:if>
					<c:if test="${login == null}">
						<a class="navbar_short_icon" href="loginForm">
							<i class="bi bi-cart"> Cart</i>
						</a>
						<a class="navbar_short_icon" href="loginForm">
							<i class="bi bi-person"> Login</i>	
						</a>
					</c:if>
				</div>
			</div>
		</nav>
		
		<div class="navbar_search row">
			<form method="get" action="productList" class="navbar_search_form col">
				<div class="navbar_search_input">
					<input type="search" class="form-control" placeholder="Search..." name="searchWord">
				</div>
				<button class="navbar_search_button" type="submit" class="btn">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>

	</body>
</html>
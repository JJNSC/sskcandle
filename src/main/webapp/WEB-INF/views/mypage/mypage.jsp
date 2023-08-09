<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width-device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon" />
		<title>마이페이지</title>

		<!-- Bootstrap 을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script><!-- slim을 뺀다 ajax 관련 기능이 지금피료없기때문에) -->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
		<script src="${pageContext.request.contextPath }/resources/js/mypage.js"></script>
	
	</head>
	<%@ include file="../header/navHeader.jsp" %>
	<body>
	<div style="max-width:1320px; margin:0 7%;  display:inline-block;">
		<div class="wrap" >
			<!-- body left part -->
			<div id ="nav-left">
				<div id = "myMenu" style="border-top: 1px solid rgb(225, 228, 230);">
					<nav>
						<div >
							<div class="myMenuTitle"><img src="data:${userinfo.userAttachType};base64, ${base64Img}" width="120"/> </div>
							<div>
								<ul>
									<li>이름 : ${userinfo.userName}</li>
									<li>메일주소 :<br> ${userinfo.userEmail}</li>
									<li>등급 : ${userinfo.userGrade}</li>
									<li>가입날짜 : <br><fmt:formatDate value="${userinfo.userJoinDate}" pattern="yyyy-MM-dd"></fmt:formatDate></li>
									<li>포인트 : ${userinfo.userPoint}</li>
								</ul>
							</div>
						</div>
						<div>
							<a href="mypage?subpage=myshoppinglist"  class="myMenuTitle">내 구매 리스트</a>
						</div>
						<div>
							<a href="mypage?subpage=mywishlist"  class="myMenuTitle">내 찜 리스트</a>
						</div>
						<div >
							<a href="mypage?subpage=myreviewlist"  class="myMenuTitle">내 리뷰 리스트</a> 
						</div>
						<div>
							<a href="mypage?subpage=myinfocheck" class="myMenuTitle">내 정보 확인/수정</a>
						</div>
						<div style="border-bottom: 0px solid rgb(225, 228, 230);">
							<a href="mypage?subpage=withdraw" class="myMenuTitle">회원 탈퇴</a>
						</div>
					</nav>
				</div>
				
			</div>
			<!-- body right part -->
			<div id="body-right">
				<c:if test="${subpage.equals('myshoppinglist') }">
					<%@ include file="myshoppinglist.jsp" %>
				</c:if>
				<c:if test="${subpage.equals('myreviewlist') }">
					<%@ include file="myreviewlist.jsp" %>
				</c:if>
				<c:if test="${subpage.equals('myinfocheck') }">
					<%@ include file="myinfocheck.jsp" %>
				</c:if>
				<c:if test="${subpage.equals('myinfo') }">
					<%@ include file="myinfo.jsp" %>
				</c:if>
				<c:if test="${subpage.equals('mywishlist') }">
					<%@ include file="mywishlist.jsp" %>
				</c:if>
				<c:if test="${subpage.equals('withdraw') }">
					<%@ include file="withdraw.jsp" %>
				</c:if>
			</div>
		
		</div>
	</div>
		<%@ include file="/WEB-INF/views/footer/footer.jsp" %> 

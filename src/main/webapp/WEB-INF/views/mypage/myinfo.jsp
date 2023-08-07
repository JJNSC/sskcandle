<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
	
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
		<script src="${pageContext.request.contextPath }/resources/js/mypage.js"></script>
	<style>
	.form-control {
		height:auto;
	}
	input{
		border:none;
	}
	</style>
	
	</head>
		<div class="wrap" style="border:0px solid black; margin-left:50px;">
			<h3>내 정보 확인/수정</h3>
			<br>
			<form class="form-group ">
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<span>
						프로필 사진 수정 하는곳
					</span>
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="text" placeholder="${userinfo.userName }"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<span>
						메일 : ${userinfo.userEmail }
					</span>
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="password" placeholder="수정할 비밀번호 입력"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="password" placeholder="수정할 비밀번호 재입력"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="number" placeholder="${userinfo.userPhone }"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="text" placeholder="${userinfo.userAddress }"> 
				</div>
			</form>
			<button onclick="checkUserInfo()"> 수정하기 </button>
		</div>
	</body>
</html>
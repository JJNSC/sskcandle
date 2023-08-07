<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width-device-width, initial-scale=1.0">

		<!-- Bootstrap 을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script><!-- slim을 뺀다 ajax 관련 기능이 지금피료없기때문에) -->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
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
					<input type="text" placeholder="기존의 이름"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<span>
						메일 : 기존 이메일
					</span>
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="password" placeholder="수정할 비밀번호 입력"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="password" placeholder="수정할 비밀번호 재입력"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="number" placeholder="기존의 전화번호"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="number" placeholder="기존의  주소"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<span>
						프로필 사진 수정 하는곳
					</span>
					
				</div>
			</form>
		</div>
	</body>
</html>
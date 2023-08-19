<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="http://www.google.com/s2/favicons?domain=https://login.coupang.com/login/memberJoinFrm.pang" type="image/x-ico">
		<title>로그인</title>
		
		<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<%-- 부트스트랩 아이콘 --%>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joinForm.css">
		<script src="${pageContext.request.contextPath}/resources/js/joinForm.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/findEmailResult.js"></script>

	</head>
	<body>
		<div class="wrapper" style="max-width: 400px;line-height: 50px; margin-top:100px;">
			<c:if test="${resultMsg != null }">
				회원님의 이메일은 <input type="text" id="resultMsg" value="${resultMsg }" style="border:0px; font-weight: bolder; font-size: 20px;" readonly="readonly"> 입니다.
			</c:if>
			<c:if test="${resultMsg == null }">
				<span>잘못된 정보를 입력하셨습니다.</span><br>
				<span>다시 입력바랍니다.</span> 
			</c:if>
			<input type="hidden" id="result" value="${result }">
				
			<div class="login__content login__content--trigger">
           		<button class="btn btn-primary btn-block font-weight-bold" form="findEmailForm" id="closeButton" type="submit" style="margin-top:30px; border-color:#17a2b8 ;padding: 10px 0; background-color:#88c8bc;">확인</button>
			</div>

		</div>
	</body>
</html>
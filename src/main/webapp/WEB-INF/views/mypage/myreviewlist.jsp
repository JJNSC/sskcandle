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
			<h3>내 리뷰 리스트</h3>
			<br>
			<table>
				<thead>
					<tr>
						<td>번호</td>
						<td>상품 명</td>
						<td>제목</td>
						<td>작성 날짜</td>
						<td>별점</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="">
					<tr>
						<td>상품 이미지</td>
						<td>상품 명</td>
						<td>상품 가격</td>
						<td>상품 갯수</td>
					</tr>
					</c:if>
				</tbody>
			
			</table>
		</div>
	</body>
</html>
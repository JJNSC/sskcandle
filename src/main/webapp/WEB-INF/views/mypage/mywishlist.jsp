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
	
	button {
		border:none;
		background-color: #fff;
	}
	</style>
	
	</head>
		<div class="wrap" style="border:0px solid black; margin-left:50px;">
			<h3>내 찜 목록</h3>
			<br>
			<c:forEach var="wish" items="${wishLists}" >
			    <table class="table table-sm" style="margin-bottom:0;">
			        <tbody>
			            <tr>
			                <td style="width:120px; height:120px;">
			                    <a href="productDetail?productId=${wish.product.productId}">
			                        <img src="data:${wish.productImages.pattachtype};base64, ${wish.productImages.base64Image}" width="120"/>
			                    </a>
			                </td>
			                <td style="text-align: left; width:500px; line-height: 120px;">${wish.product.productName}</td>
			                <td style="line-height: 120px; width:100px;">${wish.product.productPrice} 원</td>
			                <td style="line-height: 60px;">
			                	<div><button >장바구니에 담기</button></div>
			                	<div><button >찜목록 제거하기 </button></div>
			                </td>
			            </tr>
			        </tbody>
			    </table>
			    <hr style="margin-top: 0; margin-bottom: 0px;">
			</c:forEach>
		</div>
	</body>
</html>
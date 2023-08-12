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
			<h3>내 구매 목록</h3>
			<br>
			<c:forEach var="BuyList" items="${orderList }" >
			<table class="table table-sm" style="margin-bottom:0;">
				<thead>
					<tr>
						<td>${BuyList.order.orderId }</td>
						<td>${BuyList.order.orderStatus }</td>
						<td><fmt:formatDate value="${BuyList.order.orderDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
						<td>${BuyList.order.shippingAddress }</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="orderProduct" items="${BuyList.product }" varStatus="a">
					    <c:forEach var="orderDetail" items="${BuyList.orderDetail }" varStatus="b">
					        <c:if test="${a.index == b.index}">
					            <tr>
					                <td>${a.index}</td>
					                <td>${b.index}</td>
					                <td>${orderProduct.productName}</td>
					                <td>${orderProduct.productPrice}</td>
					                <td>${orderDetail.quantity} 개</td>
					            </tr>
					        </c:if>
					    </c:forEach>
					</c:forEach>
				</tbody>
			</table>
			<hr style="margin-top:0; margin-bottom:40px;">
			</c:forEach>
		</div>
	</body>
</html>
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
						<td>주소 : ${BuyList.order.shippingAddress }</td>
						<td>주문 날짜  </td>
						<td><fmt:formatDate value="${BuyList.order.orderDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
						<td>${BuyList.order.orderStatus }</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="orderProduct" items="${BuyList.product }" varStatus="a">
					    <c:forEach var="orderDetail" items="${BuyList.orderDetail }" varStatus="b">
					        <c:if test="${a.index == b.index}">
					            <tr>
					            	<td>
					                    <c:forEach var="productImage" items="${BuyList.productImages}" varStatus="c">
					                        <c:if test="${c.index==a.index}">
					                            <a href="productDetail?productId=${orderProduct.productId}">
					                            	<img src="data:${productImage.pattachtype};base64, ${productImage.base64Image}" width="120"/>
					                            </a>
					                        </c:if>
					                    </c:forEach>
					                </td>
					                <td>
					                	<br><br>
					                	<a href="productDetail?productId=${orderProduct.productId}">${orderProduct.productName}</a>
					                </td>
					                <td>
					                	<br>
					                	${orderProduct.productPrice}원
					                	<br><br>
					                	${orderDetail.quantity} 개
					                </td>
					                <td>
					                	<br><br>
					                	${orderProduct.productPrice*orderDetail.quantity} 원
					                </td>
					                <td>
					                	<br><br>
					                	<a type="button" style="border:none; background-color:#fff;">리뷰 작성하기</a>
					                </td>
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
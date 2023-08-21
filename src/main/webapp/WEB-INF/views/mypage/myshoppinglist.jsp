<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
		<script src="${pageContext.request.contextPath }/resources/js/mypage/myshoppinglist.js"></script>
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
			<c:if test="${noPaging!=1}"> 
				<span style="float:right;">${shoppingPager.pageNo}/${shoppingPager.totalPageNo} </span>
			</c:if>
			<br>
			<c:forEach var="BuyList" items="${orderList }" >
			<table class="table table-sm" style="margin-bottom:0;">
				<thead>
					<tr>
						<td>${BuyList.order.orderId }</td>
						<td>주소 : ${BuyList.order.shippingRoadAddress } ${BuyList.order.shippingDetailAddress }</td>
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
					                            	<img src="data:${productImage.pattachtype};base64, ${productImage.base64Image}" width="120" height="120"/>
					                            </a>
					                        </c:if>
					                    </c:forEach>
					                </td>
					                <td style="width:440px;">
					                	<br><br>
					                	<a href="productDetail?productId=${orderProduct.productId}">${orderProduct.productName}</a>
					                </td>
					                <td>
					                	<br>
					                	<fmt:formatNumber value="${orderProduct.productPrice}" pattern="#,###원"/>
					                	<br><br>
					                	${orderDetail.quantity} 개
					                </td>
					                <td>
					                	<br><br>
					                	<fmt:formatNumber value="${orderProduct.productPrice*orderDetail.quantity}" pattern="#,###원"/>
					                </td>
					                <td>
					                	<br><br>
					                	<c:if test="${orderDetail.review==1}">
					                		<a type="button" href="reviewForm?productId=${orderProduct.productId}&orderId=${orderDetail.orderId}" style="border:none; background-color:#fff;">리뷰 작성하기</a>
					                	</c:if>
					                	<c:if test="${orderDetail.review==2}">
					                		<span >리뷰작성 완료</span>
					                	</c:if>
					                </td>
					            </tr>
					        </c:if>
					    </c:forEach>
					</c:forEach>
				</tbody>
			</table>
			<hr >
			</c:forEach>
			<c:if test="${noPaging!=1}"> 
				<div style="margin:auto; padding:0 auto; ">
					<table style="margin-left:28%; ">
						<tr>
							<td colspan="4" class="text-center">
								<div>
									<a class="btn btn-sm" href="mypage?subpage=myshoppinglist&searchWord=${shoppingPager.searchWord }&shoppingPageNo=1">처음</a>
									<c:if test="${shoppingPager.groupNo>1}">
										<a class="btn btn-outline-info btn-sm" href="mypage?subpage=myshoppinglist&searchWord=${shoppingPager.searchWord }&shoppingPageNo=${shoppingPager.startPageNo-1}">이전</a>
									</c:if>
									<c:forEach var="i" begin="${shoppingPager.startPageNo}" end="${shoppingPager.endPageNo}">
										<c:if test="${shoppingPager.pageNo != i}">
											<a class="btn  btn-sm" href="mypage?subpage=myshoppinglist&searchWord=${shoppingPager.searchWord }&shoppingPageNo=${i}">${i}</a>
										</c:if>
										<c:if test="${shoppingPager.pageNo == i}">
											<a class="btn btn-sm" style="color:#20c997;" href="mypage?subpage=myshoppinglist&searchWord=${shoppingPager.searchWord }&shoppingPageNo=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<c:if test="${shoppingPager.groupNo<shoppingPager.totalGroupNo}">
										<a class="btn btn-outline-info btn-sm" href="mypage?subpage=myshoppinglist&searchWord=${shoppingPager.searchWord }&shoppingPageNo=${shoppingPager.endPageNo+1}">다음</a>
									</c:if>
									<a class="btn btn-sm" href="mypage?subpage=myshoppinglist&searchWord=${shoppingPager.searchWord }&shoppingPageNo=${shoppingPager.totalPageNo}">맨끝</a>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</c:if>
		</div>
	</body>
</html>
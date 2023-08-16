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
			<table class="table table-sm" style="margin-bottom:0;">
				<thead>
					<tr>
						<td style="width:5%;">번호</td>
						<td style="width:20%;">상품 명</td>
						<td style="width:30%;">제목</td>
						<td style="width:10%;">작성 날짜</td>
						<td style="width:5%;">별점</td>
					</tr>
				</thead>
					<tbody>
						<c:forEach var="review" items="${myreview }" varStatus="a">
							<c:forEach var="product" items="${productList }" varStatus="b">
								<c:if test="${a.index==b.index}">
									<tr>
										<td>${review.reviewId }</td>
										<td>${product.productName }</td>
										<td>
											<p>
												<a class="btn btn-primary" data-toggle="collapse" data-target="#collapseExample${review.reviewId }" href="#collapseExample${review.reviewId }" role="button" aria-expanded="false" aria-controls="collapseExample${review.reviewId }">
												  ${review.reviewTitle }
												</a>
												<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample${review.reviewId }" aria-expanded="false" aria-controls="collapseExample">
												  Button with data-target
												</button>
											</p>
										</td>
										<td><fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
										<td>${review.ratingScore }</td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td colspan="5">
									    	<div class="collapse" id="collapseExample${review.reviewId }">
												<div class="card card-body">
													${review.reviewContent }
												</div>
											</div>
									    </td>
									</tr>
								</c:if>
							</c:forEach>
						</c:forEach>
					</tbody>
			</table>
			<hr style="margin-top:0;">
		</div>
	</body>
</html>
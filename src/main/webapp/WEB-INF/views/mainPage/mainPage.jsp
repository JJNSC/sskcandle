<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
		<link rel="icon" href="" type="image/x-icon" />
		<title>skkcandle</title>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<%-- 부트스트랩 아이콘 --%>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainPage/mainPage.css">
		<script src="${pageContext.request.contextPath}/resources/js/mainPage.js"></script>
	</head>
	<body>
		<div class="container">
			<%-- 부트스트랩 슬라이드 --%>
			<div id="carousel_slide" class="carousel slide" data-ride="carousel">
			    <div class="carousel-inner">
			        <div class="carousel-item active" data-interval="5000">
			            <div class="d-flex align-items-center justify-content-center" style="height: 400px;">
			            	<a href="">
				                <img src="${pageContext.request.contextPath}/resources/images/mainPage/wood_wick.png" style="height: 400px;" class="d-block w-100" alt="...">
			            	</a>
			            </div>
			        </div>
			        <div class="carousel-item" data-interval="5000">
			            <div class="d-flex align-items-center justify-content-center" style="height: 400px;">
			                <a href="">
			                	<img src="${pageContext.request.contextPath}/resources/images/mainPage/yankee_candle.png" class="d-block w-100" alt="...">
			            	</a>
			            </div>
			        </div>
			        <div class="carousel-item" data-interval="5000">
			            <div class="d-flex align-items-center justify-content-center" style="height: 400px;">
			                <a href="">
			                	<img src="${pageContext.request.contextPath}/resources/images/mainPage/spaas_candle.jpg" class="d-block w-100" alt="...">
			           		</a>
			            </div>
			        </div>
			        <div class="carousel-item" data-interval="5000">
			            <div class="d-flex align-items-center justify-content-center" style="height: 400px;">
			                <a href="">
			                	<img src="${pageContext.request.contextPath}/resources/images/mainPage/light_up.jpg" class="d-block w-100" alt="...">
			            	</a>
			            </div>
			        </div>
				    <button class="carousel-control-prev" type="button" data-target="#carousel_slide" data-slide="prev">
				        <span class="fa-solid fa-chevron-left" style="font-weight: bolder; font-size: 30px; color: #000;" aria-hidden="true"></span>
				        <span class="sr-only">Previous</span>
				    </button>
				    <button class="carousel-control-next" type="button" data-target="#carousel_slide" data-slide="next">
				        <span class="fa-solid fa-chevron-right" style="font-weight: bolder; font-size: 30px; color: #000;" aria-hidden="true"></span>
				        <span class="sr-only">Next</span>
				    </button>
			    </div>
			</div>

			<div class="row">
				<div class="col-sm-12 text-center mb-4 mt-5">
					<div class="title_main">New arrivals</div>
					<div class="title_split"></div>
					<div class="title_content">SKKCANDLE 신규 상품을 만나보세요.</div>
				</div>
			</div>

			<div class="row productList">
				<c:forEach var="product" items="${product}" varStatus="loop">
					<c:if test="${loop.index < 3}">
						<div class="col-lg-4 d-flex justify-content-center">
							<div class="product-entry">
								 <a href="productDetail?productId=${product.productId}" class="prod-img">
			                       	<h3><span class="badge badge-danger">New</span></h3>
			                        <img src="data:image/jpeg;base64,${product.base64Image}" />
			                    </a>
			                    <div class="product_info text-center">
			                        <h2><a href="productDetail?productId=${product.productId}">${product.productName}</a></h2>
			                        <span class="price"><fmt:formatNumber value="${product.productPrice}" pattern="#,###원"/></span>
			                    </div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			
			<div class="row">
				<div class="col-sm-12 text-center mb-4 mt-5">
					<div class="title_main">BEST Review</div>
					<div class="title_split"></div>
					<div class="title_content">이 달의 베스트 리뷰를 확인하세요.</div>
				</div>
			</div>
			
			<div class="row productList">
				<c:forEach var="reviewSortProduct" items="${reviewSortProduct}" varStatus="loop">
					<div class="col-lg-4 d-flex justify-content-center">
							<div class="border product_thumbnail">
								 <a href="productDetail?productId=${reviewSortProduct.productId}" class="prod-img border">
			                        <img src="data:image/jpeg;base64,${reviewSortProduct.base64Image}" />
			                    </a>
			                    <div class="sortProduct_info text-center">
			                        <h2><a href="productDetail?productId=${reviewSortProduct.productId}">${reviewSortProduct.productName}</a></h2>
			                        <span class="price"><fmt:formatNumber value="${reviewSortProduct.productPrice}" pattern="#,###원"/></span>
			                    </div>
			                    <div class="review_info">
			                    	<span class="review_title">${reviewSortProduct.reviewTitle}</span>
			                    	<span class="review_content">${reviewSortProduct.reviewContent}</span>
			                    	<div class="review_split_line"></div>
			                    	<div class="review_userName">
				                    	<span id="format_userName">${reviewSortProduct.userName}</span>			                    				                    		
										<span></span>
										<span class="star_avg">★★★★★</span>
			                    	</div>
			                    </div>
							</div>
						</div>
				</c:forEach>
			</div>
			
		</div>
	</body>
</html>
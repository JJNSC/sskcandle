<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<script src="${pageContext.request.contextPath}/resources/js/mainPage/mainPage.js"></script>
	</head>
	<body>
	
		<div class="swiper_slide">
			<div class="swiper_img">
				<img src="${pageContext.request.contextPath}/resources/images/mainPage/wood_wick.png" />
				<img src="${pageContext.request.contextPath}/resources/images/mainPage/yankee_candle.png" />
				<img src="${pageContext.request.contextPath}/resources/images/mainPage/spaas_candle.jpg" />
				<img src="${pageContext.request.contextPath}/resources/images/mainPage/light_up.jpg" />
			</div>
		</div>
		
		<div class="container">
		
			<div class="row">
				<div class="col-sm-12 text-center mb-5 mt-5">
					<h2>이런 캔들은 어떠세요?</h2>
				</div>
			</div>
			
			<div class="row">
				<c:forEach var="product" items="${product}">
					<div class="col-lg-3 mb-4 text-center productList">	
						<div class="border product-entry">
							<a href="productDetail?productId=${product.productId}" class="prod-img">
								<img src="data:image/jpeg;base64,${product.base64Image}" />
							</a>
							<div class="desc">
								<a href="#">${product.productMaker}</a>
								<h2><a href="productDetail?productId=${product.productId}">${product.productName}</a></h2>
								<span class="price">&#8361;${product.productPrice}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>
</html>
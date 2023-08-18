<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="" type="image/x-icon" />
		<title>상품 리스트 페이지</title>
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<%-- 부트스트랩 아이콘 --%>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productList/productList.css">
		<script src="${pageContext.request.contextPath}/resources/js/productList/productList.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>
		
		<div class="container">
			<div class="filter">
				<div class="pageName">캔들</div>
				<div class="filter_menu">
					<ul>
						<li><a href="" class="active">추천순</a></li>
						<li><a href="">최신순</a></li>
						<li><a href="">낮은가격</a></li>
						<li><a href="">높은가격</a></li>
						<li><a href="">브랜드</a></li>
					</ul>
				</div>
			</div>
			
			<%-- 다른 스타일 필터메뉴(보류) --%>
			<%-- <div>
				<ul class="sort_menu">
					<li>
						<a href="#">신상품</a>
					</li>
					<li>
						<a href="#">상품명</a>
					</li>
					<li>
						<a href="#">낮은가격</a>
					</li>
					<li>
						<a href="#">높은가격</a>
					</li>
					<li>
						<a href="#">제조사</a>
					</li>
					<li>
						<a href="#">판매량</a>
					</li>
				</ul>
			</div> --%>
			
			<div class="productList">
				<c:forEach var="product" items="${product}">
					<div class="item_list col-3">
						<div class="thumbnail">
							<a href="productDetail?productId=${product.productId}">
								<img src="data:image/jpeg;base64,${product.base64Image}">
							</a>
						</div>
						<div class="product_info">
							<ul class="d-flex flex-column">
								<li class="product_tag col align-self-center">
									<a href="#">${product.productMaker}</a>
								</li>
								<li class="product_name col align-self-center" >
									<a href="productDetail?productId=${product.productId}" style="line-height: 1.2; height: 50px">${product.productName}</a>
								</li>
								<li class="col align-self-center">
									<span class="product_price">&#8361;${product.productPrice}</span>
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
			
		</div>

		<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
	</body>
</html>
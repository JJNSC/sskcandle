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
						<li><a href="#">필터1</a></li>
						<li><a href="#">필터2</a></li>
						<li><a href="#">필터3</a></li>
						<li><a href="#">필터4</a></li>
						<li><a href="#">필터5</a></li>
					</ul>
				</div>
			</div>
			
			<div>
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
			</div>
			
			<div class="productList">
				<c:forEach var="product" items="${product}">
					<div class="item_list col-3">
						<div class="thumbnail">
							<a href="productDetail?productId=${product.productId}">
								<img src="data:image/jpeg;base64,${product.base64Image}">
							</a>
						</div>
						<div class="product_info">
							<ul>
								<li class="product_name"><a href="productDetail?productId=${productId}">${product.productName}</a></li>
								<%-- <li class="product_tag"><a href="#">Stock: ${product.productStock}</a></li>
								<li class="product_tag"><a href="#">Maker: ${product.productMaker}</a></li> --%>
								<li><span class="product_price">&#8361;${product.productPrice}</span></li>
							</ul>
						</div>
					</div>
				</c:forEach>
				
				
			
				<!-- <div class="item_list">
					<div class="thumbnail">
						<a href="#">
							<img src="https://mblogthumb-phinf.pstatic.net/MjAxODEwMTdfNjQg/MDAxNTM5NzU3NDY3NTcz.muUzv_uWvcnE73aUXmauvR-eCUk2D8ve7UqTr2rqLpcg.h_-YxNV14CBhLvlDxksVBaeQKDrrqZfdsJetA0N8HfAg.JPEG.dangbi052/1539755554548.jpg?type=w800">
						</a>
					</div>
					<div class="product_info">
						<ul>
							<li class="product_name"><a href="#">제목</a></li>
							<li class="product_tag"><a href="#">태그 및 간단한 설명</a></li>
							<li><span class="price">가격</span></li>
						</ul>
					</div>
				</div> -->
				
			</div>
		</div>

		<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
	</body>
</html>
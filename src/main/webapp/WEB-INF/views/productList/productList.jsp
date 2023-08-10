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
		
		<div>
			
		</div>
		
		<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
	</body>
</html>
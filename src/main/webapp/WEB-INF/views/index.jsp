<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="/html_css_javascript/favicon.ico" type="image/x-ico">
		<title>인덱스 페이지</title>
		
	   
	</head>
	<body>
		<%@include file ="header/navHeader.jsp" %>
	
		<%@include file ="mainPage/mainPage.jsp" %>      
		
		<%@include file ="footer/footer.jsp" %>      

	<script>
		 // 이전 페이지의 상태를 저장
	       history.pushState(null, null, location.href);
	       
	       // 뒤로가기 버튼을 눌러도 페이지가 변경되지 않도록
	       window.onpopstate = function(event) {
	           history.pushState(null, null, location.href);
	       };
	</script>
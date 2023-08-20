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
	// 뒤로가기 버튼을 눌렀을 때 실행되는 함수
    function customBack() {
        history.go(-2); // 2 페이지 전으로 이동
    }

    // 브라우저의 뒤로가기 동작을 재정의
    window.addEventListener("popstate", function(event) {
        // 여기서 조건을 검사하여 특정 페이지일 때만 customBack 함수를 호출
        // 조건을 충족하지 않으면 기본 브라우저 동작을 그대로 실행
            customBack();
    });
		</script>
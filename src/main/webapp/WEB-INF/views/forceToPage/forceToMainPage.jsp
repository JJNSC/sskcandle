<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width-device-width, initial-scale=1.0">
		<link rel="icon" href="/html_css_javascript/skull.png" type="image/x-icon">
		<title>Insert title here</title>
		
		<!-- Bootstrap 을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script><!-- slim을 뺀다 ajax 관련 기능이 지금피료없기때문에) -->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<script>
		$(init)
		function init (){
			history.pushState(null, null, location.href); 
			window.onpopstate = function(event) { 
			history.go(1); 
			};
			location.href = "../skkcandle";
		}
	</script>
	<body>
		aa
	</body>
</html>
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
			<h3>내 정보 확인/수정</h3>
			<br>
			<%-- <form id="" method="post" action="imageTest" enctype="multipart/form-data">
				<input name="userId" placeholder="${userinfo.userId }" value="${userinfo.userId }"></input>
				<input id="battach" type="file" name="battach" >
				<button>수정</button>
			</form> --%>
			<form id="updateMyInfoForm" class="form-group" method="post" action="updateMyInfo" enctype="multipart/form-data">
				<input type="hidden" name="userId" value="${userinfo.userId }">
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<span>
						<img src="data:${userinfo.userAttachType};base64, ${base64Img}" width="120"/>
						<input id="battach" type="file" name="battach" >
					</span>
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="text" name="userName" value="${userinfo.userName }" placeholder="${userinfo.userName }"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<span>
						메일 : ${userinfo.userEmail }
					</span>
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="password" name="userPassword" value="" placeholder="수정할 비밀번호 입력"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="password" placeholder="수정할 비밀번호 재입력"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="number" name="userPhone" value="${userinfo.userPhone }" placeholder="${userinfo.userPhone }"> 
				</div>
				<div class="form-control pt-3 pb-3 pl-4 mt-3">
					<input type="text" name="userAddress" value="${userinfo.userAddress }" placeholder="${userinfo.userAddress }"> 
				</div>
			</form>
			<button onclick="checkUserInfo()" form="updateMyInfoForm"> 수정하기 </button>
			<!-- 수정하기 버튼누르면 창이 열리면서 이메일,비밀번호 확인 창이뜸. 일치하면 수정 -->
			<script>
			
			function checkUserInfo(){
				/* var w = window.open("/popup.html","PopupWin ","width=500,height=600");
				
				//여기서 팝업된 창의 주소를 변경하자.
				w.location.href = "userInfoCheck"; */
				
				var child;
				var url = "userInfoCheck";
				child = window.open(url, 'popup_child', 'menubar=no', 'scrollbars=yes', 'status=yes', 'resizable=auto', 'titlebar=no', 'hotkey=0','width=500', 'height=600', 'left=0', 'top=0');
			}
				 
			
			</script>
		</div>
	</body>
</html>
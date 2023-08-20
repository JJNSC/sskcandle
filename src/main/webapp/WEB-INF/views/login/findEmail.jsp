<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="http://www.google.com/s2/favicons?domain=https://login.coupang.com/login/memberJoinFrm.pang" type="image/x-ico">
		<title>로그인</title>
		
		<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<%-- 부트스트랩 아이콘 --%>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joinForm.css">
		<script src="${pageContext.request.contextPath}/resources/js/joinForm.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/findEmail.js"></script>

	</head>
	<body>
		<div class="wrapper" style="max-width: 400px;">
			<header class="text-center pt-5">
					<img src="${pageContext.request.contextPath}/resources/images/skkcandle.png"
						style="width: 250px; " />
			</header>
			<input type="hidden" class="d-none" id="loginErrMsg" value="${loginErrMsg }" >
			
			<section id="login_section">
				<div id="join_input">
					<%-- 이름 --%>
					<form id="findEmailForm" method="post" action="findEmail" novalidate>
						<div class="join_input_userInfo">
							<label for="userName">
								<span class="join_input_icon_box">
									<!-- <i class="join_input_icon icon_name"></i> -->
									<i class="fa-solid fa-user" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="text" class="join_input_content" id="userName" name="userName" 
										placeholder="이름" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'"/>
								</span>
							</label>
						</div>
						<span id="nameErr1" class="errorMsg text-danger d-none small">이름 필수 입력 사항입니다.</span>
						
						
						<%-- 휴대폰 번호 --%>
						<div class="join_input_userInfo">
							<label for="userTel">
								<span class="join_input_icon_box">
									<!-- <i class="join_input_icon icon_tel"></i> -->
									<i class="fa-solid fa-phone-flip" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="text" class="join_input_content" id="userPhone" name="userPhone" oninput="autoHyphen(this)" maxlength="13"
										placeholder="휴대폰 번호" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '휴대폰 번호'"/>
								</span>
							</label>
						</div>
						<span id="phoneErr1" class="errorMsg text-danger d-none small">휴대폰 번호는 필수 입력 사항입니다.</span>
			    		<span id="phoneErr2" class="errorMsg text-danger d-none small">휴대폰 번호 형식에 맞지않습니다.</span>
					</form>
				</div>
				
			</section>
			<div class="login__content login__content--trigger">
           		<button class="btn btn-primary btn-block font-weight-bold" form="findEmailForm" onclick="checkValidation()" type="submit" style="border-color:#17a2b8 ;padding: 10px 0; background-color:#88c8bc;">이메일 찾기</button>
			</div>

		</div>
	</body>
</html>
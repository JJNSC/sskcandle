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
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginForm.css">
		<script src="${pageContext.request.contextPath}/resources/js/loginForm.js"></script>
		
		<script>
	        function openFindEmailPage() {
	        	var width = 500;
	            var height = 415;
				var left = (window.innerWidth - width) / 2;
				var top = (window.innerHeight - height) / 2;
	            var childWindow = window.open('findEmail', '_blank', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);
	        }
	
	        function setEmail(email) {
	            $("#userEmail").val(email);
	        }
	        
	        function openFindPasswordPage() {
	        	var width = 500;
	            var height = 600;
				var left = (window.innerWidth - width) / 2;
				var top = (window.innerHeight - height) / 2;
	            var childWindow = window.open('findPassword', '_blank', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);
	        }
	    </script>
	</head>
	<body>
		<div class="wrapper">
			<header class="text-center pt-5">
				<a href="/skkcandle">
					<img src="${pageContext.request.contextPath}/resources/images/skkcandle.png"
						style="width: 250px; " />
				</a>
			</header>
			<input type="hidden" class="d-none" id="loginErrMsg" value="${loginErrMsg }" >
			
			<section id="login_section">
				<div id="join_input">
					<%-- 이메일(아이디) --%>
					<form id="join_input_form" method="post" action="login" novalidate>
						<div class="join_input_userInfo_email" style="height:50px;">
							<label for="userEmail">
								<span class="join_input_icon_box">
									<i class="fa-solid fa-envelope" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="email" class="join_input_content" id="userEmail" name="userEmail" 
										placeholder="아이디(이메일)" autocomplete="off" onclick="blueBox_email()" onblur="checkValidation()"/>
								</span>
							</label>	
						</div>
				    	<span id="emailErr1" class="errorMsg text-danger d-none small">이메일은 필수 입력 사항입니다.</span>
						<span id="emailErr2" class="errorMsg text-danger d-none small">이메일 형식이 맞지 않습니다.</span>
						
						
						<%-- 비밀번호 --%>
						<div class="join_input_userInfo_pwd" style="height:50px;">
							<label for="userPassword" >
								<span class="join_input_icon_box" >
									<i class="fa-solid fa-lock" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="password" class="join_input_content" id="userPassword" name="userPassword" 
										placeholder="비밀번호" autocomplete="off" onclick="blueBox_pwd()" onblur="checkValidation()"/>
								</span>
							</label>
							<span>
								<button class="member__util-trigger _loginPasswordShowTrigger" type="button" tabindex="-1" onclick="clickEye()">
					                <i class="member__sprite member__sprite--show-password  
					                       }} _loginPasswordIconOpenedEye" title="문자 보이기" style="display: inline-block;"></i>
					                <i class="member__sprite member__sprite--hide-password   _loginPasswordIconClosedEye" title="문자 숨기기" style="display: none;"></i>
					            </button>
							</span>
						</div>
						<span id="pwdErr1" class="errorMsg text-danger d-none small">패스워드는 필수 입력 사항입니다.</span>
			    		<span id="pwdErr2" class="errorMsg text-danger d-none small">8자 이상 입력해야합니다.</span>
						
						<div></div>
						<%-- 아이디, 비밀번호 찾기 --%>
						<div class="login__content login__content--util mt-1">
                            <a onclick="openFindPasswordPage()" type="button" class="login__link login__link--find-id-password _loginFindIdPwLink"
                            	style="text-decoration: none; color:#17a2b8;">비밀번호 찾기 <strong>></strong></a>
                            <a onclick="openFindEmailPage()" type="button" class="login__link login__link--find-id-password _loginFindIdPwLink"
                            	style="text-decoration: none; color:#17a2b8;">이메일 &nbsp&nbsp&nbsp∙ <strong></strong></a>
                        </div>
                        <div class="login__content login__content--trigger">
                        	<button class="btn btn-primary btn-block font-weight-bold" onclick="checkValidation()" type="submit" style="border-color:#17a2b8 ;padding: 10px 0; background-color:#88c8bc;">로그인</button>
                            <hr class="login_separator">
                            <a href="join" class="btn btn-light btn-block font-weight-bold border border-gray" style="padding: 10px 0;">회원가입</a>
                    	</div>
					</form>
				</div>
				
			</section>
			
			<footer id="footer">
				<p>©Skks Corp. All rights reserved.</p>
			</footer>
		</div>
	</body>
</html>
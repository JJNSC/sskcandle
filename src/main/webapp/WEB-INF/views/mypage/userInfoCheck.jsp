<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="http://www.google.com/s2/favicons?domain=https://login.coupang.com/login/memberJoinFrm.pang" type="image/x-ico">
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joinForm.css">
		<script src="${pageContext.request.contextPath}/resources/js/joinForm.js"></script>
		<title>회원 정보 인증</title>
	</head>
	<body>
		<div class="wrapper">
			<header class="join_header">
				<img src="${pageContext.request.contextPath}/resources/images/skkcandle_nuki2.png"/>
			</header>

			<section id="join_section">
				<div id="section_name">회원정보를 입력해주세요.</div>
				
				<%-- 사용자 정보 입력 --%>
				<div id="join_input">
					<%-- 이메일(아이디) --%>
					<form id="userInfoCheck_form" method="post" action="register">
						<div class="join_input_userInfo">
							<label for="userEmail">
								<span class="join_input_icon_box">
									<i class="join_input_icon icon_email"></i>
								</span>
								<span class="join_input_box">
									<input type="email" class="join_input_content" id="userEmail" name="userEmail" value=""
										placeholder="이메일" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'"/>
								</span>
							</label>
						</div>
						<%-- 비밀번호 --%>
						<div class="join_input_userInfo">
							<label for="userPassword">
								<span class="join_input_icon_box">
									<i class="join_input_icon icon_password"></i>
								</span>
								<span class="join_input_box">
									<input type="password" class="join_input_content" id="userPassword" name="userPassword" value="${user.userPassword }"
										placeholder="비밀번호" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'"/>
								</span>
							</label>
						</div>
					</form>
				</div>
				<%-- 확인 버튼 --%>
				<div class="join_submit_button">
				    <button type="submit" class="button_style " form="userInfoCheck_form" id="join_success_button">
				           회원정보 수정하기
				    </button>
				</div>
				
			</section>
			
			<%-- 푸터영역 --%>
			<footer id="join_footer">
				<p>©SkksCandle Corp. All rights reserved.</p>
			</footer>
		</div>
	</body>
</html>
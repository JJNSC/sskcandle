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
		<script src="${pageContext.request.contextPath}/resources/js/findPassword.js"></script>

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
					<%-- 이메일 --%>
					<form id="findPasswordForm" method="post" action="findPassword" novalidate>
						<div class="join_input_userInfo">
							<label for="userEmail">
								<span class="join_input_icon_box">
									<i class="fa-solid fa-envelope" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="email" class="join_input_content" id="userEmail" name="userEmail" value="" style="width:300px;"
										placeholder="이메일" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'"/>
								</span>
							</label>
						</div>
						<span id="emailErr1" class="errorMsg text-danger d-none small">이메일은 필수 입력 사항입니다.</span>
						<span id="emailErr2" class="errorMsg text-danger d-none small">이메일 형식이 맞지 않습니다.</span>
						
						<%-- 휴대폰 번호 --%>
						<div class="join_input_userInfo">
							<label for="userTel">
								<span class="join_input_icon_box">
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
			    		<!-- 비밀번호 확인 질문  -->
						<div class="join_input_userInfo">
							<label for="userTel">
								<span class="join_input_icon_box">
									<i class="fa-solid fa-question" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<select id="userCheckPasswordQuestion" name ="userCheckPasswordQuestion" style="border:0px; height:48px; width:310px;">
										<option selected disabled hidden>비밀번호 확인 질문</option>
										<option value="1">기억에 남는 추억의 장소는?</option>
										<option value="2">자신의 인생 좌우명은?</option>
										<option value="3">자신의 보물 제1호는?</option>
										<option value="4">가장 기억에 남는 선생님 성함은?</option>
										<option value="5">타인이 모르는 자신만의 신체비밀이 있다면?</option>
										<option value="6">유년시절 가장 생각나는 친구 이름은?</option>
										<option value="7">인상 깊게 읽은 책 이름은?</option>
										<option value="8">읽은 책 중에서 좋아하는 구절이 있다면?</option>
										<option value="9">자신이 두번째로 존경하는 인물은?</option>
										<option value="10">다시 태어나면 되고 싶은 것은?</option>
										<option value="11">내가 좋아하는 캐릭터는?</option>
									</select>
								</span>
							</label>
						</div>
						<!-- 비밀번호 확인 답변 -->
						<div class="join_input_userInfo" style="height:50px;">
							<label for="userName">
								<span class="join_input_icon_box">
									<i class="fa-solid fa-exclamation" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="text" class="join_input_content" id="userCheckPasswordAnswer" name="userCheckPasswordAnswer"
										placeholder="비밀번호 확인 답변" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인 답변'"/>
								</span>
							</label>
						</div>
					</form>
				</div>
				
			</section>
			<div class="login__content login__content--trigger">
           		<button class="btn btn-primary btn-block font-weight-bold" form="findPasswordForm" id="q" type="submit" style="border-color:#17a2b8 ;padding: 10px 0; background-color:#88c8bc;">비밀번호 찾기</button>
			</div>

		</div>
	</body>
</html>
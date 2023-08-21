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
		<%-- 부트스트랩 아이콘 --%>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joinForm.css">
		<script src="${pageContext.request.contextPath}/resources/js/findPasswordResult.js"></script>
		<title>회원가입</title>
		
		<script>
			
		
		</script>
		
	</head>
	<body>
		<div class="wrapper">
			<header class="join_header">
				<a>
					<img src="${pageContext.request.contextPath}/resources/images/skkcandle.png"/>			
				</a>
			</header>

			<section id="join_section">
				<div id="section_name">새로운 비밀번호를 입력해주세요.</div>
				
				<%-- 사용자 정보 입력 --%>
				<div id="join_input">
					<form id="change_password_form" >
						<input type="hidden" id="userId" name="userId" value="${userId }">
						<%-- 비밀번호 --%>
						<div class="join_input_userInfo">
							<label for="userPassword">
								<span class="join_input_icon_box">
									<!-- <i class="join_input_icon icon_password"></i> -->
									<i class="fa-solid fa-lock" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="password" class="join_input_content" id="userPassword" name="userPassword" 
										placeholder="비밀번호" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'"/>
								</span>
							</label>
						</div>
						<span id="pwdErr1" class="errorMsg text-danger d-none small">패스워드는 필수 입력 사항입니다.</span>
			    		<span id="pwdErr2" class="errorMsg text-danger d-none small">8자 이상 입력해야합니다.</span>
						<%-- 비밀번호 확인 --%>
						<div class="join_input_userInfo">
							<label for="userCheckPassword">
								<span class="join_input_icon_box">
									<!-- <i class="join_input_icon icon_checkPassword"></i> -->
									<i class="fa-solid fa-unlock" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="password" class="join_input_content" id="userCheckPassword" name="userCheckPassword" 
										placeholder="비밀번호 확인" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'"/>
								</span>
							</label>
						</div>
						<span id="pwdErr3" class="errorMsg text-danger d-none small">비밀번호가 일치하지 않습니다.</span>
					</form>
				</div>
	
				<%-- 확인 버튼 --%>
				<div class="join_submit_button">
				    <button type="submit" class="button_style " style="background-color:#88c8bc;" id="changePassword_success_button">
				          비밀번호 수정하기
				    </button>
				</div>
			</section>
		</div>
	</body>
</html>
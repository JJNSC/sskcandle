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
		<script src="${pageContext.request.contextPath}/resources/js/joinForm.js"></script>
		<title>회원가입</title>
	</head>
	<body>
		<div class="wrapper">
			<header class="join_header">
				<a href="/skkcandle">
					<img src="${pageContext.request.contextPath}/resources/images/skkcandle_nuki2.png"/>			
				</a>
			</header>

			<section id="join_section">
				<div id="section_name">회원정보를 입력해주세요.</div>
				
				<%-- 사용자 정보 입력 --%>
				<div id="join_input">
					<%-- 이메일(아이디) --%>
					<form id="join_input_form" method="post" action="register">
						<div class="join_input_userInfo">
							<label for="userEmail">
								<span class="join_input_icon_box">
									<!-- <i class="join_input_icon icon_email"></i> -->
									<i class="fa-solid fa-envelope" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="email" class="join_input_content" id="userEmail" name="userEmail" value=""
										placeholder="${register_msg}" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '${register_msg}'"/>
								</span>
							</label>
						</div>
						<span id="emailErr1" class="errorMsg text-danger d-none small">이메일은 필수 입력 사항입니다.</span>
						<span id="emailErr2" class="errorMsg text-danger d-none small">이메일 형식이 맞지 않습니다.</span>
						<%-- 비밀번호 --%>
						<div class="join_input_userInfo">
							<label for="userPassword">
								<span class="join_input_icon_box">
									<!-- <i class="join_input_icon icon_password"></i> -->
									<i class="fa-solid fa-lock" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="password" class="join_input_content" id="userPassword" name="userPassword" value="${user.userPassword }"
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
						<%-- 이름 --%>
						<div class="join_input_userInfo">
							<label for="userName">
								<span class="join_input_icon_box">
									<!-- <i class="join_input_icon icon_name"></i> -->
									<i class="fa-solid fa-user" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="text" class="join_input_content" id="userName" name="userName" value="${user.userName }"
										placeholder="이름" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'"/>
								</span>
							</label>
						</div>
						<span id="nameErr1" class="errorMsg text-danger d-none small">이름 필수 입력 사항입니다.</span>
						<%-- 전화번호 --%>
						<div class="join_input_userInfo">
							<label for="userTel">
								<span class="join_input_icon_box">
									<!-- <i class="join_input_icon icon_tel"></i> -->
									<i class="fa-solid fa-phone-flip" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box">
									<input type="text" class="join_input_content" id="userPhone" name="userPhone" value="${user.userPhone }"
										placeholder="휴대폰 번호" autocomplete="off" onfocus="this.placeholder = ''" onblur="this.placeholder = '휴대폰 번호'"/>
								</span>
							</label>
						</div>
						<span id="phoneErr1" class="errorMsg text-danger d-none small">휴대폰 번호는 필수 입력 사항입니다.</span>
			    		<span id="phoneErr2" class="errorMsg text-danger d-none small">휴대폰 번호 형식에 맞지않습니다.</span>
						<%-- 주소 --%>
						<div class="join_input_userInfo" style="height:150px;">
							<label for="userAddress">
								<span class="join_input_icon_box" style="height:148px; display:flex;  flex-direction: column ; align-items: center; justify-content: center; ">
									<!-- <i class="join_input_icon icon_email"></i> -->
									<i class="fa-solid fa-map-location-dot" style="color: #c3c6d1;"></i>
								</span>
								<span class="join_input_box" >
									<span class="ml-2"></span>
									<!-- <a type="button" onclick="sample4_execDaumPostcode()" ><i class="fa-solid fa-magnifying-glass"></i></a> -->
									
									
									<input type="text" id="sample4_postcode" name="userPostcode" placeholder="우편번호" style="border:1px solid #ccc; width:100px;">
									<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기" class="mb-3 mr-1 mt-3 ml-3" 
										style=" border:1px solid gray; color:#fff; background-color: darkgray; box-shadow: 3px 3px lightgray; width:100px; font-size:16px;"><br>
									<input type="text" id="sample4_roadAddress" name="userRoadAddress" placeholder="도로명주소" class="ml-2 mb-3" style="width:295px;border:1px solid #ccc;">
									<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" style="width:280px;">
									<span id="guide" style="color:#999;display:none"></span><br>
									<input type="text" id="sample4_detailAddress" name="userDetailAddress" placeholder="상세주소" class="ml-2 mb-3" style="width:295px;border:1px solid #ccc;">
									<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
								</span>
							</label>
						</div>
						<span id="addressErr1" class="errorMsg text-danger d-none small">주소는 필수 입력 사항입니다.</span>
					</form>
				</div>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
				    function sample4_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var roadAddr = data.roadAddress; // 도로명 주소 변수
				                var extraRoadAddr = ''; // 참고 항목 변수
				
				                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                    extraRoadAddr += data.bname;
				                }
				                // 건물명이 있고, 공동주택일 경우 추가한다.
				                if(data.buildingName !== '' && data.apartment === 'Y'){
				                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                }
				                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                if(extraRoadAddr !== ''){
				                    extraRoadAddr = ' (' + extraRoadAddr + ')';
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('sample4_postcode').value = data.zonecode;
				                document.getElementById("sample4_roadAddress").value = roadAddr;
				                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
				                
				                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				                if(roadAddr !== ''){
				                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
				                } else {
				                    document.getElementById("sample4_extraAddress").value = '';
				                }
				
				                var guideTextBox = document.getElementById("guide");
				                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				                if(data.autoRoadAddress) {
				                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				                    guideTextBox.style.display = 'block';
				
				                } else if(data.autoJibunAddress) {
				                    var expJibunAddr = data.autoJibunAddress;
				                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				                    guideTextBox.style.display = 'block';
				                } else {
				                    guideTextBox.innerHTML = '';
				                    guideTextBox.style.display = 'none';
				                }
				            }
				        }).open();
				    }
				</script>
				
				<%-- 모든 약관 동의 --%>
				<div id="join_terms_chkAll">
				    <div id="join_terms">
				        <input type="checkbox" id="chk_checkall" aria-hidden="true">
				        <label for="chk_checkall">
				        <!-- <label for="chk_checkall" role="checkbox" aria-label="모두 확인하였으며 동의합니다" aria-checked="false">
				            <i aria-hidden="true" class="icon_chk"></i> -->
				            <span aria-hidden="true">모두 확인하였으며 동의합니다.</span>
				        </label>
				    </div>
				    <span class="chk_all_message">
	                	전체 동의에는 필수 및 선택 정보에 대한 동의가 포함되어 있으며,&nbsp;개별적으로 동의를 선택 하실 수 있습니다.&nbsp;선택 항목에 대한 동의를 거부하시는 경우에도 서비스 이용이 가능합니다.
	            	</span>
				</div>
				
				<%-- 약관 동의 목록 --%>
				<ul class="join_terms_other">
			        <div class="join_terms_frame">
				        <input type="checkbox" id="chk_join-terms-fourteen" name="cbox" >
				        <label for="chk_join-terms-fourteen">
				        <!-- <label for="chk_join-terms-fourteen" role="checkbox" aria-label="만 14세 이상입니다" aria-checked="false">
				            <i aria-hidden="true" class="icon-chk"></i> -->
				            <span aria-hidden="true">[필수] 만 14세 이상입니다</span>
				        </label>
					</div>
					<div id="c-checkbox-item_join-terms-commerce" class="join_terms_frame">
				        <input type="checkbox" id="chk_join-terms-commerce" name="cbox">
				        <label for="chk_join-terms-commerce">
				       <!--  <label for="chk_join-terms-commerce" role="checkbox" aria-label="전자금융거래 이용약관 동의" aria-checked="false">
				            <i aria-hidden="true" class="icon-chk"></i> -->
				            <span aria-hidden="true">[필수] 전자금융거래 이용약관 동의</span>
				        </label>
					</div>
					<div id="c-checkbox-item_join-terms-privacy-collect-use" class="join_terms_frame">
				        <input type="checkbox" id="chk_join-terms-privacy-collect-use" name="cbox">
				        <label for="chk_join-terms-privacy-collect-use">
				        <!-- <label for="chk_join-terms-privacy-collect-use" role="checkbox" aria-label="개인정보 수집 및 이용 동의" aria-checked="false">
				            <i aria-hidden="true" class="icon-chk"></i> -->
				            <span aria-hidden="true">[필수] 개인정보 수집 및 이용 동의</span>
				        </label>
					</div>
					<div id="c-checkbox-item_agree-to-collect-third-part-information" class="join_terms_frame">
				        <input type="checkbox" id="chk_agree-to-collect-third-part-information" name="cbox">
				        <label for="chk_agree-to-collect-third-part-information">
				        <!-- <label for="chk_agree-to-collect-third-part-information" role="checkbox" aria-label="개인정보 제3자 제공 동의" aria-checked="false">
				            <i aria-hidden="true" class="icon-chk"></i> -->
				            <span aria-hidden="true">[필수] 개인정보 제3자 제공 동의</span>
				        </label>
					</div>
   				 </ul>
   				 
				<%-- 확인 버튼 --%>
				<div class="join_submit_button">
				    <button type="submit" class="button_style " style="background-color:#88c8bc;" form="join_input_form" id="join_success_button" disabled>
				           회원 가입
				    </button>
				</div>
				
				<%-- tip 메세지 --%>
				<!-- <div id="join_helpMessage">
					<p>법인 고객이신가요?</p>
					<p>사업자 회원으로 전용 특가 혜택을 누려보세요.</p>
					<a href="https://login.coupang.com/corporation/member/landing-page">쿠팡비즈 간편가입</a>			
				</div> -->
			</section>
			
			<%-- 푸터영역 --%>
			<footer id="join_footer">
				<p>©SkksCandle Corp. All rights reserved.</p>
			</footer>
		</div>
	</body>
</html>
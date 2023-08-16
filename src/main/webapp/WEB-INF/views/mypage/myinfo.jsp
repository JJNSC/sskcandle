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
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="mb-3" 
						style="margin-right:100px; border:1px solid #88c8bc; color:#88c8bc; background-color: #fff;">
					<input type="text" id="sample4_postcode" name="userPostcode" placeholder="${userinfo.userPostcode }"><br>
					<input type="text" id="sample4_roadAddress" name="userRoadAddress" placeholder="${userinfo.userRoadAddress }" class="mb-3" style="width:300px;">
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" style="width:300px;">
					<span id="guide" style="color:#999;display:none"></span><br>
					<input type="text" id="sample4_detailAddress" name="userDetailAddress" placeholder="${userinfo.userDetailAddress }" style="width:500px;">
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
				</div>
			</form>
			<button  form="updateMyInfoForm" style="width:100px;height:50px; border:3px solid #88c8bc;font-weight:bolder; color:#88c8bc; background-color: #fff; border-radius: 5%;"> 수정하기 </button>
			<!-- 수정하기 버튼누르면 창이 열리면서 이메일,비밀번호 확인 창이뜸. 일치하면 수정 -->
			
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
	</body>
</html>
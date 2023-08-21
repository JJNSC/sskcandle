<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="/html_css_javascript/favicon.ico"
			type="image/x-icon">
		<title>Insert title here</title>
		
		
		<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment/payment.css">
		<script src="${pageContext.request.contextPath}/resources/js/payment/payment.js"></script>
	
	</head>

	<body>
		<div id="" class="container">
		
			<!-- 헤더 -->
			<section class="d-flex-column mx-auto maincontainer" >
				<header class="border-h">
							<div class="head" style="postion:relative; left:-20px;">
								<a href="/skkcandle"><img src="${pageContext.request.contextPath}/resources/images/skkcandle.png"
									width="200"  alt="쿠팡"></a>
							</div>
					</header>
			</section>
			
			<hr style="border-top:0; margin-top:3rem;">
			
			<!-- 바디 -->
			<section class="d-flex-column mx-auto maincontainer" >
					
					<!-- 페이지창 -->
				<div class="d-flex justify-content-between" style="border-bottom: 3px solid #777">
					<h3>주문/결제</h3>
					<span class="align-self-center"> <span style="color: #346AFF">주문결제></span>주문완료
					</span>
				</div>
				
				<form onsubmit="return false;">
				
					<!-- 구매자 정보 -->
					<div class="">
						<h2>구매자정보</h2>
						<table class="consumerInfo">
							<tr>
								<th>이름</th>
								<td>${userinfo.userName }</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${userinfo.userEmail }</td>
							</tr>
							<tr>
								<th>휴대폰 번호</th>
								<td>${userinfo.userPhone }</td>
							</tr>
							<tr>
								<th>배송주소</th>
								<td>
									<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="mb-3" 
										style="margin-right:100px; border:1px solid #000; color:#000; background-color: #fff;">
									<input type="text" id="sample4_postcode" name="userPostcode" placeholder="${userinfo.userPostcode }"><br>
									<input type="text" id="sample4_roadAddress" name="userRoadAddress" placeholder="${userinfo.userRoadAddress }" class="mb-3" style="width:300px;">
									<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" style="width:300px;">
									<span id="guide" style="color:#999;display:none"></span><br>
									<input type="text" id="sample4_detailAddress" name="userDetailAddress" placeholder="${userinfo.userDetailAddress }" style="width:500px;">
									<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
								</td>
							</tr>
						</table>
					</div>
					
	
					
	
					<!--배송 n건중 n -->
					<div class="">
						<h2>배송 상품</h2>
						<div id="orderplus">
						<table class="consumerInfo">
							<thead>
								<tr>
									<th style="width:50%; text-align: left;">상품명</th>
									<td style="width:20%; background-color:#F4F4F4;">상품 가격 및 개수</td>
									<td style="width:20%; background-color:#F4F4F4;">총 금액</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="productinfo" items="${productinfo}" varStatus="a">
									<c:forEach var="productQuantity" items="${productQuantity}" varStatus="b" >
										<c:if test="${a.index==b.index}">
										<tr>
											<th style="background-color:#fff; text-align: left;"><input type="hidden" class="productId" value="${productinfo.productId }">${productinfo.productName}</th>
											<td><fmt:formatNumber value="${productinfo.productPrice }" pattern="#,###원"/> / 
												<input type="hidden" class="productQuantity" value="${productQuantity }">${productQuantity} 개
											</td>
											<td>합계 : <span class="pricesPerProduct"><fmt:formatNumber value="${productinfo.productPrice*productQuantity}" pattern="#,###원"/></span></td>
										</tr>
										</c:if>
									</c:forEach>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
	
	
					<!-- 결제 정보 -->
					<div id="payInfo" class="">
						<h2>결제 정보</h2>
						<table class="payInfomation">
							<tr>
								<th style="width:160px;">총상품가격</th>
								<td><span id="totalPrice"></span>원</td>
							</tr>
							<tr>
								<th>적립금</th>
								<td style="margin:0px; padding:0px;">
									<div style=" padding-top:10px; padding-left:16px; padding-bottom:10px;">
										<span style="display:inline-block; width:155px;"><span id ="balance">0</span><span>원</span></span>
										<span style="padding-top:20px;">보유 : <span id="cuBal">${userinfo.userPoint }</span></span>
										<button id="cuCashInput">적립금</button>
									</div>
								
									<div id="cuCashrow" style="background-color: #f8f8f8; padding-bottom:16px; padding-top:10px;">
									 	
										<input id="cuCash" type="number" value="" placeholder="0" name="cuCash" style="margin-left: 170px;">원 | 
										<input id="allUse" type="checkbox" name="allUse"> 모두사용
										<div><button id="cuCashApply" style="margin-left: 170px; margin-top:10px;">적립금</button></div>
										
										
										<div id="cashOver" class="choice-error" style="color: red; padding-left: 17px; margin-left: 170px; display: none;">
										사용가능한 적립금을 초과 입력하였습니다.
										</div>
									</div> 
								</td>
							</tr>	
							<tr>
								<th>배송비</th>
								<td>0원 <span style="color:red;"> 오픈 기념 이벤트로 인해 배송비 무료</span></td>
							</tr>
							<tr>
								<th>총결제금액</th>
								<td><span id="price"></span>원<span id="expectPoint" style="margin-left: 100px; display=none;">캐시적립 예정 : <span id="point">399</span>원</span></td>
							</tr>
							<tr>
								<th>결제 방법</th>
								<td>
								 <div class="payMethod" style="pading-right:10px;">
									<div id="L_account-transfer" class="payMethod-arrow">
										<label><input id="account-transfer" class="cash payMethod"
											type="radio" name="pay-method" value="계좌이체" checked="checked"> 계좌이체 </label></div>
										
									<div id="L_credit-card">
										<label><input
											id="credit-card" class="no-cash payMethod" type="radio" name="pay-method"
											value="신용/체크카드"> 신용/체크카드  </label></div>
									
									<div id="L_phone">
										<label><input
											id="phone" type="radio" class="no-cash payMethod" name="pay-method"
											value="휴대폰"> 휴대폰  </label></div>
									
									<div id="L_deposit-without-bankbook">
										<label><input
											id="deposit-without-bankbook" class="cash payMethod" type="radio"
											name="pay-method" value="무통장입금"> 무통장입금(가상계좌)  </label></div>
									 </div>		
										
										
										<!-- 계좌이체 선택시 옵션 -->
									<div id="account-transfer-option" class="pay_select">
										<div>
											<label><span style="padding-right:35px;">은행선택</span> 
											<select id="accountTransfer-choice">
												<option value="none">선택</option>
												<option value="카카오뱅크">카카오뱅크</option>
												<option value="농협은행">농협은행</option>
												<option value="국민은행">국민은행</option>
												</select>
											</label>
										</div>
										
										<div id="account-transfer-no-choice" class="choice-error" style="color: red; padding-left: 17px;">은행을
											선택해주세요</div>
											
									</div> 
									 <!-- 신용/체크카드 선택 시 옵션 -->
									<div id="credit-card-option" class="pay_select">
										<div>
											<label><span style="padding-right:35px;">카드선택</span> 
											<select id="creditCard-choice">
													<option value="KB국민카드">KB국민카드</option>
													<option value="롯데카드">롯데카드</option>
													<option value="신한카드">신한카드</option>
											</select>
											</label>
											
											 <span style="padding-right:35px;"></span> <label style="font-weight: lighter"><input type="checkbox"
													checked="checked"> ${userinfo.userName }님 명의 카드</label>
											
										</div>
										
									</div>
									<!-- 휴대폰 결제 선택 시 옵션 -->
									<div id="phone-option" class="pay_select">
										<div><label> <span style="padding-right:35px;">통신사 종류 </span> 
										<select id="phone-choice">
												<option value="none">선택</option>
												<option value="SKT">SKT</option>
												<option value="KT">KT</option>
												<option value="헬로모바일">헬로모바일</option>
												<option value="KCT">KCT</option>
										</select>
										</label>
										</div>
										
										<div id="mobile-corp-no-choice"  class="choice-error" style="color: red; padding-left: 17px;">통신사
											정보를 추가해주세요.</div>
									</div> <!-- 무통장입금(가상계좌) 선택 시 옵션 -->
									<div id="deposit-without-bankbook-option" class="pay_select">
										
											<div>
												<label> <span style="padding-right:35px;">입금은행</span> 
												<select id="withoutBankbook-choice">
														<option value="none">선택</option>
														<option>농협은행</option>
														<option>국민은행</option>
														<option>신한은행</option>
												</select>
												</label>
											
											</div>
											<div id="bank-no-choice" class="choice-error" style="color: red; padding-left: 17px;">은행을
											선택해주세요</div>
											<div style="border-top: 1px solid #e4e4e4; padding-top: 10px;">
													<span style="padding-right:35px;">입금기한</span><span>2023년 07월 12일 10시 00분까지</span>
											</div>
												
											<!-- <div>* 현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를
													보장하고 있습니다.</div> -->
											
									</div>
									
										
										<div id="deposit-without-bankbook-option-caution"><span>무통장 입금 시 유의사항</span>
											<ul>
												<li>입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</li>
												<li>무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</li>
												<li>은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</li>
											</ul>
										</div>
										
										
									<!-- <div id="discount-info">
											카드할인 및 무이자 할부 안내
									</div> -->
									<div id="selectPay" style="margin-top:10px;">
										<label style="cursor: pointer;"><input type="checkbox" checked="checked"> 선택한
											결제수단 및 휴대폰번호로 향후 결제 이용에 동의합니다.(선택)</label>
									</div>
									<div  id="basicPay"  style="margin-top:10px;">
										<label style="cursor: pointer;"><input type="checkbox" checked="checked"> 기본
											결제 수단으로 사용</label>
									</div></td>
							</tr>
						</table>
					</div>
	
					<!-- 주문 내용 확인, 동의 메시지 -->
					<div class="text-center" id="agreeMessage">위 주문 내용을 확인 하였으며, 회원 본인은 개인정보 이용 및
						제공(해외직구의 경우 국외제공) 및 결제에 동의합니다.</div>
					<div class="text-center" id="payButton">
						<button class="payb" id="finalPayButton" style=" border: none; box-shadow: 0 0 0">
							<img src="//image7.coupangcdn.com/image/rocketpay-order-image/pc/btn_payment.gif"
								width="260" height="60" alt="결제하기">
						</button>
					</div>
				</form>
			</section>
			
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
$(init)

window.onload = eventInit;
var totalPay
//내 보유 포인트 (변하지않는다.)
var myBalance

//계좌이체옵션선택
var accountTransfer
var creditCard
var phone
var withoutBankbook

//결제 페이지 실행시 불러들이는 값
function init(){
	order();
	
	$("#cuCashApply").click(totalCalculate);
	
	$("#finalPayButton").click(finalCheckAndPay);
	
	
}

function eventInit(){
	myBalance = parseInt($("#cuBal").text().replace(/,/gi, ""));
	priceCalculate();
	totalCalculate();
	
	//계좌이체의 옵션값이 변경될때마다 값을 저장해준다.
	$("#accountTransfer-choice").change(function() {
        accountTransfer = $(this).val();
        console.log("계좌이체의:"+ accountTransfer);
    });
	//신용/체크카드의 옵션값이 변경될때마다 값을 저장해준다.
	$("#creditCard-choice").change(function() {
		creditCard = $(this).val();
        console.log("체크카드의:"+ creditCard);
    });
	//휴대폰의 옵션값이 변경될때마다 값을 저장해준다.
	$("#phone-choice").change(function() {
		phone = $(this).val();
        console.log("휴대폰의:"+ phone);
    });
	//무통장입금의 옵션값이 변경될때마다 값을 저장해준다.
	$("#withoutBankbook-choice").change(function() {
		withoutBankbook = $(this).val();
        console.log("무통장입금의:"+ withoutBankbook);
    });
	
	
}

//결제하기 버튼 클릭시
function finalCheckAndPay(){
	
}



//총액 계산
function totalCalculate() {
    var totalSum = 0;
    console.log("실행");
    $('.pricesPerProduct').each(function() {
        var price = parseInt($(this).text());
        totalSum += price;
    });
    console.log("totalSum : "+ totalSum);

    $('#totalPrice').text(totalSum.toLocaleString("ko-KR"));
    var balance = parseInt($("#balance").text());
    var totalPay = parseInt($("#price").text());

    totalPay = totalSum-balance;
    $('#price').text(totalPay.toLocaleString("ko-KR"));
    
}

//결제 금액 계산
function priceCalculate() {
	
	var totalPrice = parseInt($('#totalPrice').text().replace(/,/gi, ""));
	console.log("totalPrice : "+ totalPrice);
	var balance = parseInt($('#balance').text().replace(/[^0-9]/g, ""));
	console.log("balance : "+ balance);
	if(isNaN(balance)){
		balance =0;
		parseInt($('#balance').text(0));
	}
	
	var price = parseInt($('#price').text().replace(/,/gi, ""));
	console.log("price : "+price);
	
	price = totalPrice - balance
	if(price < 0 ){
		$("#cashOver").css("display", "block");
		price = totalPrice;
		var changeBalance = myBalance;
		parseInt($('#balance').text(0));
	}else{
		var changeBalance = myBalance - balance;
		$("#cashOver").css("display", "none");
	}
	
	point = parseInt(price*0.01);
	$('#price').text(price.toLocaleString("ko-KR"));
	$('#point').text(point.toLocaleString("ko-KR"));
	
	$('#cuBal').text(changeBalance);
	
}

function openAdress() {
   		window.open("addressSelect.jsp", "winLogin", "left=350, top=300, width=500, height=650");
}
function openRequest() {
		window.open("addressRequest.jsp", "winLogin", "left=350, top=300, width=530, height=650");
}


$(document).ready(function(){
	
   	// 초깃값 설정
    $('#credit-card-option').hide();
	$('#coupay-money-option').hide();
	$('#corporation-card-option').hide();
	$('#phone-option').hide();
	$('#deposit-without-bankbook-option').hide();
	$('#account-transfer-option').show();
	$('#deposit-without-bankbook-option-caution').hide();
	$('#selectPay').hide();
	$('#basicPay').show();
	$('#discount-info').hide();
	$('#expectPoint').css('display', 'none');
	
	$("input[name='pay-method']").change(function(){
		$('#expectPoint').css('display', 'none');
		// 계좌이체 선택 시.
		if($("input[name='pay-method']:checked").val() == '계좌이체'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').hide();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').show();
			$('#cash-receipt').show();
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').hide();
			
			$('#L_account-transfer').addClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$("#L_credit-card").removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		
			
		}	
		// 쿠페이머니 선택 시.
		else if($("input[name='pay-method']:checked").val() == '쿠페이머니'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').show();
			$('#corporation-card-option').hide();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').hide();
			$('#cash-receipt').show();
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').hide();
			$('#expectPoint').css('display', 'inline-block');
			
			
			$("#L_coupay-money").addClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_credit-card").removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		
			
		}
		// 신용/체크카드 결제 선택 시.
		else if($("input[name='pay-method']:checked").val() == '신용/체크카드'){
			$('#credit-card-option').show();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').hide();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').hide();
			$('#cash-receipt').hide();
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').show();
			
			$("#L_credit-card").addClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		}
		// 법인카드 선택 결제 시
		else if($("input[name='pay-method']:checked").val() == '법인카드'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').show();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').hide();
			$('#cash-receipt').hide();
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').hide();
			
			$("#L_corporation-card").addClass("payMethod-arrow");
			$("#L_credit-card").removeClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		}
		// 휴대폰 선택 결제 시
		else if($("input[name='pay-method']:checked").val() == '휴대폰'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').hide();
			$('#phone-option').show();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').hide();
			$('#cash-receipt').hide();
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').show();
			$('#basicPay').hide();
			$('#discount-info').hide();
			
			$("#L_phone").addClass("payMethod-arrow");
			
			$("#L_credit-card").removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		}
		// 무통장입금 선택 결제 시
		else if($("input[name='pay-method']:checked").val() == '무통장입금'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').hide();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').show();
			$('#account-transfer-option').hide();
			$('#cash-receipt').show();
			$('#deposit-without-bankbook-option-caution').show();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').hide();
			
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_credit-card").removeClass("payMethod-arrow");
			
			$("#L_deposit-without-bankbook").addClass("payMethod-arrow");
		}
	});
	
	
	//현금 영수증 체크박스에 따라 아래 요소 숨기기
	$('#cash-receipt-type').hide();
	$('#cash-receipt-application').click(function(){
		   
		var checked = $('#cash-receipt-application').prop('checked');
		if (checked) {
			 $('#cash-receipt-type').show();
			 
	 	} else if (!checked) {
			 
			 $('#cash-receipt-type').hide();
 	 	}
	});
	
	//현금 영수증 라디오박스에 따라 요소 바꾸기
	$('#proof-of-expenditure-option').hide();
	
	$("input[name='cash-receipt-type']").change(function(){
		// 계좌이체 선택 시.
		if($("input[name='cash-receipt-type']:checked").val() == 'income-deduction'){
			$('#income-deduction-option').show();
			$('#proof-of-expenditure-option').hide();
			
			var select = $("#income-deduction-option option:selected").val();
			if(select === "pnum") {
				$('#numErr1').show();
				$('#numErr2').hide();
				$('#numErr3').hide();
			} else if(select === "cash-card"){
				$('#numErr1').hide();
				$('#numErr2').show();
				$('#numErr3').hide();
			}
			
		} else if($("input[name='cash-receipt-type']:checked").val() == 'proof-of-expenditure'){
			$('#proof-of-expenditure-option').show();
			$('#income-deduction-option').hide();
			var select = $("#proof-of-expenditure-option option:selected").val();
			
			if(select === "cash-card") {
				$('#numErr1').hide();
				$('#numErr2').show();
				$('#numErr3').hide();
			} else if(select === "biznum"){
				$('#numErr1').hide();
				$('#numErr2').hide();
				$('#numErr3').show();
			}
		}
	});
	
	//현금 영수증 체크박스에 따라 인풋 넘버 바꾸기
	$('#numErr1').show();
	$('#numErr2').hide();
	$('#numErr3').hide();
	
	$('#income-deduction-option').change(function(){
		$('#numErr1').hide();
		$('#numErr2').hide();
		$('#numErr3').hide();
		var select = $("#income-deduction-option option:selected").val();
		if(select === "pnum") {
			$('#numErr1').show();
			$('#numErr2').hide();
			$('#numErr3').hide();
		} else if(select === "cash-card"){
			$('#numErr1').hide();
			$('#numErr2').show();
			$('#numErr3').hide();
		}
		
	});

	$('#proof-of-expenditure-option').change(function(){
		
		$('#numErr1').hide();
		$('#numErr2').show();
		$('#numErr3').hide();
		var select = $("#proof-of-expenditure-option option:selected").val();
		if(select === "cash-card") {
			$('#numErr1').hide();
			$('#numErr2').show();
			$('#numErr3').hide();
		} else if(select === "biznum"){
			$('#numErr1').hide();
			$('#numErr2').hide();
			$('#numErr3').show();
		}
		
	});
	
	
	
		
		
		
	//쿠팡캐시 입력 클릭 이벤트
	$('#cuCashrow').hide();
	$('#cuCashInput').click(function(){
		$('#cuCashrow').toggle();
		
	});
	
	
	//쿠팡캐시 모두사용 체크 이벤트
	$('#allUse').click(function(){
		if($("#allUse").is(":checked")){
            var allCash = parseInt($('#cuBal').text());
            //$('#cuCash').attr('value', allCash);
           
            $('#cuCash').val(allCash);
            console.log(allCash);
            console.log(cuCash);
        }else if(!$("#allUse").is(":checked")){
        	$('#cuCash').val(0);
        }
	});
	
	//쿠팡캐시 적용 클릭 이벤트
	$('#cuCashApply').click(function(){
		$("#cashOver").css("display", "none"); 	
		var balance = parseInt( $('#cuBal').text());
		var totalprice = parseInt( $('#totalPrice').text().replace(/,/gi, ""))
		 	
		if(($("#cuCash").val())>balance || ($("#cuCash").val())>totalprice){
			console.log($("#cuCash").val());
			$("#cashOver").css("display", "block");
			
		} else if(($("#cuCash").val())<=balance) {
			
			$("#balance").text('-' + $('#cuCash').val()); 
			$('#cuCashrow').hide();
			priceCalculate();
			
		} else {
			console.log($("#cuCash").val());
			$('#cuCash').val(0);
			priceCalculate();
			$("#balance").text($('#cuCash').val()); 
		}
	});
		
		
		
		
	
	//계좌이체 선택 유효성 검사
	$('#account-transfer-no-choice').hide();
	$('#account-transfer-choice-bank').change(function(){

		$('#account-transfer-no-choice').hide();
		var nonselect = $("#account-transfer-choice-bank option:selected").val();
		
		if(nonselect === "none") {
				$('#account-transfer-no-choice').show();
			} else {
				$('#account-transfer-no-choice').hide();
			}
		
		
	});
	
	/*//할부기간 알림 메세지
	$('#interest-free-note').hide();
	$('#installment-period').change(function(){
		
		$('#interest-free-note').hide();
		var select = $("#installment-period option:selected").val();
		
		if(select === "pay-in-full") {
			$('#interest-free-note').hide();
			$('#pay-in-full-note').show();
		} else if(select !== "pay-in-full"){
			$('#interest-free-note').show();
			$('#pay-in-full-note').hide();
		}
	});*/

	//통신사 선택 유효성 검사
	$('#mobile-corp-no-choice').hide();
	$('#mobile-corp').change(function(){
		
		$('mobile-corp-no-choice').hide();
		var nonselect = $("#mobile-corp option:selected").val();
		
		if(nonselect === "none") {
			window.alert("통신사를 선택해주세요");
			$('#mobile-corp-no-choice').show();
		} else {
			$('#mobile-corp-no-choice').hide();
		}
		
		
	});
	
	//무통장입금 계좌 선택 유효성 검사
	$('#bank-no-choice').hide();
	$('#bank-choice').change(function(){
		
		$('bank-no-choice').hide();
		var nonselect = $("#bank-choice option:selected").val();
		
		if(nonselect === "none") {
			$('#bank-no-choice').show();
		} else {
			$('#bank-no-choice').hide();
		}
		
		
	});
	
	//무통장입금 계좌 선택 유효성 검사
	$('#bank-no-choice').hide();
	$('#bank-choice').change(function(){
		
		$('bank-no-choice').hide();
		var nonselect = $("#bank-choice option:selected").val();
		
		if(nonselect === "none") {
			$('#bank-no-choice').show();
		} else {
			$('#bank-no-choice').hide();
		}
		
		
	});
	
	//현금영수증 선택 유효성 검사
	$('#biznumErr').hide();
	$('#telnumErr').hide();
	$('#cashnumErr').hide();
		
	//결제하기 버튼 클릭시
	$('.payb').click(function(){
		console.log("결재하기 버튼 실행");
		
		//주소값 받아오기 
		var payAddress = $("#payAddress").val();
		if(payAddress==""){
			payAddress = $("#payAddress").attr("placeholder");
		}
		console.log("payAddress : "+ payAddress);
		
		
		//주문한 상품들의 productId 들 list로 저장
		var productList = [];

        // 각 productId 값을 productList에 추가
        $(".productId").each(function() {
            var productId = $(this).val();
            productList.push(productId);
        });
        
        console.log(productList);
        
        var quantityList = [];
        
        // 각 상품별 개수를 추가 
        $(".productQuantity").each(function() {
            var productQuantity = $(this).val();
            quantityList.push(productQuantity);
        });

        console.log(quantityList);
        
        //선택한 결제방법 가져오기
        var paymethod = $('input[name="pay-method"]:checked').val();
        console.log("Selected Value:", paymethod);
        
        var validation = true;
        
        if(paymethod=="계좌이체" && accountTransfer ==""){
        	validation = false;
        }else if(paymethod =="휴대폰" && phone==""){
        	validation = false;
        }else if(paymethod=="무통장입금" && withoutBankbook==""){
        	validation = false;
        }
		
		//현금 영수증 수정 유효성 검사
		$('#biznumErr').hide();
		$('#telnumErr').hide();
		$('#cashnumErr').hide();
		if($("input[name='cash-receipt-type']:checked").val() == 'income-deduction'){
			var select = $("#income-deduction-option option:selected").val();
			if(select === "pnum") {
				var tel = $("#numErr1").val();
				console.log(tel);
				if(tel ==="") {
					console.log(tel);
					$('#biznumErr').hide();
					$('#cashnumErr').hide();
					$('#telnumErr').show();
					console.log(select);
				} else{
					var pattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
					var result = pattern.test(tel);
					if(!result) {
		   			$('#biznumErr').hide();
		   			$('#cashnumErr').hide();
		   			$('#telnumErr').show();
					}
			}
			
			} else if(select === "cash-card"){
				var cashnum = $("#numErr2").val();
				if(cashnum ==="") {
					$('#biznumErr').hide();
					$('#telnumErr').hide();
					$('#cashnumErr').show();
					} else {
						var pattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
						var result = pattern.test(cashnum);
						if(!result) {
		   				$('#biznumErr').hide();
		   				$('#telnumErr').hide();
		   				$('#cashnumErr').show();
						}
					}
			}
		} else {
			
			$('#biznumErr').hide();
			$('#telnumErr').hide();
			$('#cashnumErr').hide();
			
			var select = $("#proof-of-expenditure-option option:selected").val();
				
				if(select === "cash-card") {
					//현금영수증카드번호 수정 유효성 검사	
					var cashnum = $("#numErr2").val();
					if(cashnum ==="") {
						$('#biznumErr').hide();
						$('#telnumErr').hide();
						$('#cashnumErr').show();
					} else {
						var pattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
						var result = pattern.test(cashnum);
						if(!result) {
		   				
		   				$('#biznumErr').hide();
		   				$('#telnumErr').hide();
		   				$('#cashnumErr').show();
						}
					}
					
				} else if(select === "biznum"){
					//사업자번호 수정 유효성 검사
					var biznum = $("#numErr3").val();	
						if(biznum ==="") {
							$('#telnumErr').hide();
							$('#cashnumErr').hide();
							$('#biznumErr').show();
						} else {
							var pattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
							var result = pattern.test(biznum);
							if(!result) {
			   				
			   				$('#telnumErr').hide();
			   				$('#cashnumErr').hide();
			   				$('#biznumErr').show();
							}
						}
				
				
				}
	
			}
			if(validation ==false){
				alert("잘못된 정보가 입력되었습니다. 확인 바랍니다.");
			}else{
				location.href = "payment/payComplete?"
				    + "payAddress=" + encodeURIComponent(payAddress)
				    + "&productList=" + encodeURIComponent(productList.join(','))
				    + "&quantityList=" + encodeURIComponent(quantityList.join(','))
				    + "&accountTransfer=" + encodeURIComponent(accountTransfer)
				    + "&creditCard=" + encodeURIComponent(creditCard)
				    + "&phone=" + encodeURIComponent(phone)
				    + "&withoutBankbook=" + encodeURIComponent(withoutBankbook);
				
			}/*var productList = [];

	        // 각 productId 값을 productList에 추가
	        $(".productId").each(function() {
	            var productId = $(this).val();
	            productList.push(productId);
	        });*/
				
		})
		
				
		
	});



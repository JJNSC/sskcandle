$(init)

window.onload = eventInit;


//결제 페이지 실행시 불러들이는 값
function init(){

	
	
}

function eventInit(){

}


$(document).ready(function(){
	//페이징의 특정  버튼 클릭시
	$('.payb').click(function(){
		console.log("결재하기 버튼 실행");
		
		//주소값 받아오기 
		var payAddress = $("#payAddress").val();
		if(payAddress==""){
			payAddress = $("#payAddress").attr("placeholder");
		}
		console.log("payAddress : "+ payAddress);
		
		
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
			
		}
		
				
	})
		
				
		
});



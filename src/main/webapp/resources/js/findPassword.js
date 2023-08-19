$(init);
function init() {
   //유효성 검사
   var checkButton = $("#findPasswordButton");
   checkButton.click(checkValidation);
}

//유효성 검사
function checkValidation(){
	console.log("유효성 검사 실행");
	
	isValidation = true;
	
	//모든 에러문구 d-none 으로 초기화
	var errorMsgs = $(".errorMsg");
	errorMsgs.each(function(index, el) {$(el).addClass("d-none")});

	//이메일 유효성 검사
	var email = $("#userEmail").val();
	if(email ===""){
		isValidation = false;
		var emailErr1 = $("#emailErr1");
		emailErr1.removeClass("d-none");
	}else{
		var pattern = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
		var result = pattern.test(email);
	 	if(!result) {
	 		isValidation = false;		
	 		var emailErr2 = $("#emailErr2");
	 		emailErr2.removeClass("d-none");
	 	} else {
	 	}
	}
	
	//휴대폰 번호 유효성 검사
	var phone = $("#userPhone").val();
	if(phone === ""){
		isValidation = false;
		var phoneErr1 = $("#phoneErr1");
		phoneErr1.removeClass("d-none");
	}else{
		var pattern = /^010[0-9]{4}[0-9]{4}$/;
		var result = pattern.test(phone);
		if(!result){
			isValidation = false;
			var phoneErr2 = $("#phoneErr2");
			phoneErr2.removeClass("d-none");
		}
	}
	
	//비밀번호 확인 질문 
	let passwordCheckQ =$("#userCheckPasswordQuestion").val();
	console.log("확인질문 : "+ passwordCheckQ);
	
	//비밀번호 확인 대답
	let passwordCheckA =$("#userCheckPasswordAnswer").val();
	console.log("확인대답 : "+ passwordCheckA);
	
	
	if(!isValidation) {
		event.preventDefault();		
	}
	event.preventDefault();	
}
   





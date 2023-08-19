$(init);
function init() {
   //유효성 검사
   var changeButton = $("#changePassword_success_button");
   changeButton.click(checkValidation);
}

function eventInit() {
	
}

//유효성 검사
function checkValidation(){
	console.log("유효성 검사 실행");
	let userId = $("#userId").val();
	console.log("userId : "+ userId);
	isValidation = true;
	
	//모든 에러문구 d-none 으로 초기화
	var errorMsgs = $(".errorMsg");
	errorMsgs.each(function(index, el) {$(el).addClass("d-none")});

	//비밀번호 유효성 검사
	var pwd = $("#userPassword").val();
	if(pwd === ""){
		isValidation = false;
		var pwdErr1 = $("#pwdErr1");
		pwdErr1.removeClass("d-none");
	}else if(pwd.length < 8){
		isValidation = false;
		var pwdErr2 = $("#pwdErr2");
		pwdErr2.removeClass("d-none");
	}else{
		var pwd2 = $("#userCheckPassword").val();
		if(pwd != pwd2){
			isValidation = false;
			var pwdErr3 = $("#pwdErr3");
			pwdErr3.removeClass("d-none");
		}
	}
	
	if(!isValidation) {
		event.preventDefault();		
	}
	
	$.ajax({
		url:"changePassword",
		method:"POST",
		data:{
			"userId":userId,
			"userPassword":pwd
		},
		success:function(data){
			alert(" 비밀번호가 수정되었습니다.\n 수정된 비밀번호로 로그인을 하세요.");
			window.close();
		}
		
	})
	
}
   





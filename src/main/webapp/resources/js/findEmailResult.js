$(document).ready(function() {
    $("#closeButton").click(function() {
        let result = $("#result").val();
        let email;
        if(result =="emailYes"){
        	email = $("#resultMsg").val();
        	// 이메일을 부모 페이지에 전달합니다.
        	window.opener.setEmail(email);
        }
        // 자식 페이지 닫기
        window.close();
    });
});


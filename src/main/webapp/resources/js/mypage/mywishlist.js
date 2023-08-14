$(init)

window.onload = eventInit;


//결제 페이지 실행시 불러들이는 값
function init(){

	
	
}

function eventInit(){

}


$(document).ready(function(){
	//장바구니에 담기 클릭시
	$(".addToCartBtn").click(function() {
        let productId = $(this).data("thisid");
        console.log("상품 ID: " + productId + " 가 장바구니에 담겼습니다.");
        
        $.ajax({
        	url: "wishToCart",
        	method:"POST",
        	data:{productId:productId},
        	success:function(){
        		if(confirm("장바구니로 이동하시겠습니까?")){
        			location.href="getCartList";
        		}
        	}
        })
    });
		
	//찜목록 제거하기 버튼 클릭시
	$(".deleteCartBtn").click(function() {
        let productId = $(this).data("thisid");
        console.log("상품 ID: " + productId + " 를 찜목록에서 제거합니다.");
        if(confirm("해당 상품을 찜목록에서 제거하시겠습니까?")){
        	$.ajax({
        		url: "deleteWish",
        		method:"POST",
        		data:{productId:productId},
        		success:function(){
        			 $("." + productId).addClass("d-none");
        		}
        	})
        }
    });
	//아작스로 DB에서 해당 유저의 해당 상품이 담긴 찜목록이 사라지게하고 
	
	// js로는 해당 칸에 d-none class를 더해서 보이지않게한다.
		
				
		
});



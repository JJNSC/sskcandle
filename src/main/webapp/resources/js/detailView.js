/**
 * @author 조성진 김종진
 * @param type
 * @returns
 */

function count(type)  {
	
  // 결과를 표시할 element
	
  var resultElement = $('input[name=result]').val();
  
  // 수량 변경 버튼 클릭시
  
  if(type === 'plus') {
    number = parseInt(resultElement) + 1;
  }else if(type === 'minus')  {
    number = parseInt(resultElement) - 1;
  }
  
  //input type text에서  value값 범위 지정

  if(number < 1) {
		alert("최소 1개 이상 주문하셔야 합니다.")
		number = 1
	} else if ( number > 10) {
		alert("최대 10개 주문 가능합니다.")
		number = 10
	};
  
  // input 태그 value 값 변경
	
  $('input[name=result]').attr('value', number);
};

function addCartBtn(){
	
	var userId = $('input[name=userId]').val();
	
	if(!userId) {
		  alert("로그인이 필요한 서비스 입니다.")
		  location.href="loginForm"
	} else {
	
		var productCount = $('input[id=productCount]').val();
		var productId = $('input[name=productId]').val();
		  console.log(productCount);
		  console.log(productId);
		 /* $('#cart').submit();*/
		
		if (confirm("장바구니에 추가되었습니다!\n장바구니로 이동하시겠습니까??")) { 
			location.href = "cartList?result="+productCount+ "&productId="+productId; //location 을 이렇게 주는 이유는 controller 에 productCount 를 넘겨주기 위함이다.
		}else{	
			location.href = "reProduct?result="+productCount+ "&productId="+productId;
		}
	}
};

/*function clickWishBtn() { 오류코드 
    var userId = $('input[name=userId]').val();
    var productId = $('input[name=productId]').val();
    var contextPath = "${pageContext.request.contextPath}";

    if (!userId) {
        alert("로그인이 필요한 서비스입니다.");
        location.href = "loginForm";
        return;
    } else {
        $.ajax({
            url: "changeWish",
            method: "GET",
            data: {productId:productId},
            dataType: "", // JSON 형식으로 응답을 기대함
            success: function(result) {
                console.log(result); // 콘솔에 isWished 값 출력
                if (result === 1) {
                    $("img[id='like']").prop('src', contextPath + '/resources/images/fullHeart.png').attr('alt', 'Full Heart');
                } else {
                    $("img[id='unlike']").prop('src', contextPath + '/resources/images/emptyHeart.png').attr('alt', 'Empty Heart');
                }
            }
        });
    }    
}*/

function changeWish() {
    var userId = $('input[name=userId]').val();
    var productId = $('input[name=productId]').val();
    console.log("userId : "+userId); 
    console.log("productId : "+productId); 

    $.ajax({
        url: "changeWish",
        method: "GET",
        data: {productId:productId},
        success: function(data) {
            console.log(data); 
        },
        error:function(error){
        	console.log(error);
        }
        
    });
}

function addCartAndPay(){
	console.log("실행되는가");
	var productId = $('input[name=productId]').val();
	console.log("productId : "+ productId);
	var quantity = $('input[id=productCount]').val();
	console.log("quantity : "+ quantity);
	
	if (confirm("구매하시겠습니까?")) { 
		location.href = "oneProductCart?productId="+productId+"&quantity="+quantity;
	}else{
		
	}
}

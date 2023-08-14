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
	//장바구니 alert 예 아니오 클릭시
	var productCount = $('input[id=productCount]').val();
	var productId = $('input[name=productId]').val();
	  console.log(productCount);
	  console.log(productId);
	 /* $('#cart').submit();*/
	if (confirm("장바구니에 추가되었습니다!\n장바구니로 이동하시겠습니까?")) { 
		location.href = "cartList?result="+productCount+ "&productId="+productId; //location 을 이렇게 주는 이유는 controller 에 productCount 를 넘겨주기 위함이다.
	}else{	
		location.href = "reProduct?result="+productCount+ "&productId="+productId;
	}
};

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













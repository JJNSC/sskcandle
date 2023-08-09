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
	  
	  if (confirm("장바구니에 추가되었습니다!\n장바구니로 이동하시겠습니까?")) { 
			location.href = "${pageContext.request.contextPath}/cart"	
		} else { // 취소 누르면
			location.href = "productDetail"	
		}
	};

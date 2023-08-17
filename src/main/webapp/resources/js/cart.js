/**
 * author: 조성진
 * 
 * @returns
 */

$(init)
window.onload = eventInit; //window.onload로 eventInit을 제일 나중에 실행해준다(index가 생성되고 갯수를 셀수있게)

function init() {
   //테이블 초기화
   //cartItem();
   
   //전체선택
   $(".cboxAll").click(checkAll);
   //전체선택 버튼 클릭시 항목별 체크박스
   $(".cboxAll").click(initItemSelectCount);
   //삭제버튼 클릭시
   $(".selected-delete").click(deleteItem);

}

function eventInit() {
	//장바구니 담긴 전체 상품 갯수
	initItemCount();
	//개별 상품 갯수
	initItemSelectCount();
	//삭제버튼 눌렀을시 개별 상품 갯수
	$(".dealSelectChk").click(initItemSelectCount);
}
   
   //전체선택 및 해제 
function checkAll() {
   if($(event.target).is(':checked')) { //boolean 타입을 반환
      $("input[name=cbox]").prop("checked", true); //true면 체크
      $(".cboxAll").prop("checked", true);
   } else {
      $("input[name=cbox]").prop("checked", false); //false 면 체크 해제한다.
      $(".cboxAll").prop("checked", false);
   }
   
   $(document).on("click", "input:checkbox[name=cbox]", function(e) {
      
      var chks = document.getElementsByName("cbox");
      var chksChecked = 0;
            
      for(var i=0; i<chks.length; i++) {
         var cbox = chks[i];
         
         if(cbox.checked) {
            chksChecked++;
         }
      }
      
      console.log ("chks: " + chks)
      console.log ("chksChecked: " + chksChecked)
      
      if(chks.length == chksChecked){
         $(".cboxAll").prop("checked", true);
      }else{
         $(".cboxAll").prop("checked",false);
      }
   });
}

//상품삭제 (예전코드)
/*function deleteItem(){
    if($("input:checkbox[name=cbox]:checked").length != 0){
          if (confirm("삭제 하시겠습니까?")) { 
             $("input:checkbox[name=cbox]:checked").each( function(index, item) {
                $(item).closest("tr").remove(); //가장 가까운 조상 element 삭제를 위해 closet 메서드 사용
             });
             
          initItemCount(); //삭제를 하면 총 상품의 갯수가 바뀌는 함수도 넣어주어 상품을 눌렸을시 상품 수도 바뀌게 해주었다.
          initItemSelectCount(); //삭제 후 클릭된 상품이 없으므로 선택된 상품은 0
          }﻿ 
    } 
     else { 
       Swal.fire("선택된 제품이 없습니다."); //부트스트램 사용 alert
     }﻿ 
     
     if($(".cart-deal-item").length == 0){
           emptyCart();
     }
 }﻿; */
 

 //체크 된 상품들 삭제(8월 11일)
function deleteItemList() {
    var checkedProductId = [];

    // 각 체크된 체크박스의 값을 checkedProductId 배열에 추가
    $("input:checkbox[name=cbox]:checked").each(function() {
        var productId = $(this).val();
        checkedProductId.push(productId);
    });
    
    console.log(checkedProductId);

    if (checkedProductId.length === 0) {
        alert("선택된 상품이 없습니다.");
    } else {
        if (confirm("장바구니에서 해당 상품을 삭제하시겠습니까?")) {
            location.href = "deleteList?" + "deleteList=" + encodeURIComponent(checkedProductId.join(','));
        }
    }
}
 
//구매하기 버튼 클릭시 구매 페이지로 넘어가게
 function buyCartList() {
	    var checkedBuyProductId = [];
	    
	    // 각 체크된 체크박스의 값을 checkedBuyProductId 배열에 추가
	    $("input:checkbox[name=cbox]:checked").each(function() {
	        var productId = $(this).val();
	        checkedBuyProductId.push(productId);
	    });
	    
	    console.log(checkedBuyProductId);
	    
	    if (checkedBuyProductId.length === 0) { // 배열 길이 확인을 0으로 변경
	        alert("선택된 상품이 없습니다.");
	    } else {
	       location.href = "payment?" + "buyCartList=" + encodeURIComponent(checkedBuyProductId.join(','));
	    }
	}


//주문하기 (예전코드)
/*function cartItem(){
   $.ajax({
      url: "itemdata.jsp",
      method:"get",
      success: function(data) {
           let html ="";
               html += '<tr>';
               html += 	'<td colspan="5" class="cart-bundle-title">';
               html += 		'<span class="title rocket">로켓배송 상품 </span>';
               html += 		'<span class="rocket-delivery-info">';
               html += 			'<span class="rocket-free">무료배송</span>';
               html += 			'(19,800원 이상 구매가능)';
               html += 		'</span>';
               html += 	'</td>';
               html += '</tr>';
     
            data.forEach((item, index) => { 
			  html +='<tr class="cart-deal-item">';
              html+= 	'<td class="product-select-event">';
              html+= 	'<input type="checkbox" class="dealSelectChk" name="cbox">';
              html+= 	'</td>';
              html+= 	'<td class="cart-deal-item_image">';
      		  html+=		'<img class = "product-img" src=' + item.thumbnail +'>';
              html+=	'</td>';
              html+=	'<td class="product-box">';
              html+=		'<div class="product-name-part">';
         	  html+=			'<a>' + item.itemname + '</a>';
              html+=		'</div>';
              html+=		'<div class="option-item-info">';
              html+=			'<span class="arrive-date" style="display: inline-block">';
          	  html+=			'<span class="arrive-date-date">' + deliveryDate + '</span>';
          	  html+=			'</span>';
              html+=			'<span class="delivery-condition">(밤 12시 전 주문 시)</span>';
              html+=		'</div>';
              html+=		'<div class="option-price-part">';
              html+=			'<span class="unit-cost">';
              html+=				'<span class="unit-price-area">';
              html+=				'<span class="unit-price">'+ item.itemprice.toLocaleString("ko-KR") + '</span>';
              html+=				'</span>';
              html+=				'<input type="number" class="edt-qty" value="' + item.itemqty + '" min="1" max="50">';
              html+=			'</span>';
              html+=		'</div>';
              html+=		'<div class="badge-item option-benefit">';
              html+=			'<span class="promo-cash-benefit">';
 			  html+=			'<i class="promo-cash-benefit__icon"></i>';
     		  html+=			'<em class="promo-cash-benefit__text"> 최대'+ (item.itemprice * 0.01) +'원 적립</em>';
     		  html+=			'</span>';
              html+=		'</div>';
              html+=	'</td>';
              html+=	'<td class="unit-total-price">';
         	  html+=		'<div class="union-total-sale-price">' + (item.itemqty * item.itemprice).toLocaleString("ko-KR") + '원</div>';
         	  html+=		'<img src="//img1a.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png" width="56" height="14" class="vendor-badge rocket" alt="로켓배송">';         
              html+=	'</td>';
              html+=	'<td class="delivery-fee">';
              html+=		'<span class="delivery-fee_free" rowspan="1">무료</span>';
              html+=	'</td>';
              html +='</tr>';
                 
               });
               
               $("#cartTable-sku").html(html);
               
               var count = $(".edt-qty"); //init 안에 선언해주면 for문이 다 돌기전에 값을 뽑아내므로 for문 밖에다 선언해준다.
               count.click(countQty);  
               
               $(".cboxAll").change(sum);
               $(".dealSelectChk").change(sum);
               $(".edt-qty").click(sum);
               $(".edt-qty").click(couMoney);
      		}
      });
}*/

//총 상품 개수 가져오기
function initItemCount() {
	var itemCount = $(".cart-deal-item").length;
	$(".all-num").text(itemCount);
	
	if($(".cart-deal-item").length == 0){
	    emptyCart();
	}

   return itemCount;
}

//선택된 상품 개수 가져오기
function initItemSelectCount() {
	var itemSelectCount = $('input:checkbox[name="cbox"]:checked').length;
	$(".selected-num").text(itemSelectCount);
	
	return itemSelectCount;
}

// 인풋 태그의 수량 뽑아내기
function countQty(){
	   var thisnum = $(event.target);
	   var unitPrice = thisnum.prev().children().html();
	   var Price = parseInt(unitPrice.replace(/[^0-9]/g, ""));
	   var totalPrice = Price * thisnum.val(); //가격 * 상품의 수
	   var finalPrice = 0;
	   
	    thisnum.parent().parent().parent().next().children().html(totalPrice.toLocaleString("ko-KR")+"원");
}

//날짜 함수
var now = new Date();

let dayText = "";
let year = now.getFullYear();
   let month = now.getMonth() + 1;
   let date = now.getDate() + 1;
   let day = now.getDay() + 1; //요일 일요일(0)~토요일(6)
      if(day == 0) {
         dayText = "일";
      } else if(day == 1) {
         dayText = "월";
      } else if(day == 2) {
         dayText = "화";
      } else if(day == 3) {
         dayText = "수";
      } else if(day == 4) {
         dayText = "목";
      } else if(day == 5) {
         dayText = "금";
      } else if(day == 6) {
         dayText = "토";
      }
   
   let deliveryDate = ("내일(" + dayText + ")" +month + "/" + date + "도착 보장");   




//총 가격 더해서 띄우기

function sum() {
	var total = 0;

	$("input:checkbox[name=cbox]").each(function(index, item) {
		if ($(this).is(":checked")) {
			var checkedItem = parseInt($(this).closest(".cart-deal-item").find(".union-total-sale-price").text().replace(/[^0-9]/g, ""));
            total += checkedItem;
        }
    });

    $(".final-order-price").text(total.toLocaleString("ko-KR") + "원");
}

	$("input:checkbox[name=cbox]").on("change", function() {
	    sum(); // 체크 박스 상태가 변경될 때마다 합산 갱신
	});

	$(".cboxAll").on("change", function() {
	    var isChecked = $(this).is(":checked");
	    $("input:checkbox[name=cbox]").prop("checked", isChecked);
	    sum(); // 전체 선택 체크 박스 상태 변경시 합산 갱신
	});

	$(document).ready(function() {
	    // 체크 박스 이벤트 처리
	    $("input:checkbox[name=cbox]").on("change", function() {
	        updateOrderPrice();
	    });

	    // 전체 선택 체크 박스 이벤트 처리
	    $(".cboxAll").on("change", function() {
	        var isChecked = $(this).is(":checked");
	        $("input:checkbox[name=cbox]").prop("checked", isChecked);
	        updateOrderPrice();
	    });
	    
	    // 수량 변경 이벤트 처리
	    $(".edt-qty").on("change", function() {
	        updateOrderPrice();
	    });
	    
	    // 최초 페이지 로딩시 가격 계산 및 표시
	    updateOrderPrice();
	});

	function updateOrderPrice() {
	    var total = 0;

	    $("input:checkbox[name=cbox]").each(function(index, item) {
	        if ($(this).is(":checked")) {
	            var checkedItem = parseInt($(this).closest(".cart-deal-item").find(".unit-total-price").text().replace(/[^0-9]/g, ""));
	            total += checkedItem;
	        }
	    });

	    // 전체 합산이 완료되면 총 가격 업데이트
	    $(".final-order-price").text(total.toLocaleString("ko-KR") + "원");
	}

	// 수량 변경 이벤트 처리
	$(document).on("change", ".edt-qty", function() {
	    const row = $(this).closest(".cart-deal-item");
	    const unitPrice = parseInt(row.find(".unit-price").text().replace(/[^0-9]/g, ""));
	    const newQuantity = parseInt($(this).val());
	    const total = unitPrice * newQuantity;

	    row.find(".unit-total-price").text(total.toLocaleString("ko-KR") + "원");
	    
	    // 수량 변경 시 가격 합산도 업데이트
	    updateOrderPrice();
	});
	
//담긴 상품이 없을때의 페이지(삭제) 예전코드

function emptyCart() {
	
		  $(".cartTable tbody").addClass("d-none");
	      $(".cboxAll").addClass("invisible");
	      $(".cart-bundle-title").addClass("d-none");
	      $(".all-select-event").addClass("d-none");
	      $(".payment-reward-cash-area").addClass("d-none");
	      $(".cart-total-price").addClass("d-none");
	      $(".order-buttons").addClass("d-none");
	      $(".order-table-foot").addClass("d-none");
	      $(".today-porduct").removeClass("d-none");
	      $(".cart-no-item").removeClass("d-none"); 
	};
	
	
//쿠페이 머니 계산 (예전코드)
/*	
function couMoney() {
	
	   var thisnum = $(event.target);
	   var unitPrice = thisnum.prev().children().html();
	   var Price = parseInt(unitPrice.replace(/[^0-9]/g, ""));
	   var totalPrice = Price * thisnum.val(); 
	   var Coumoney = totalPrice * 0.01;
	   
	   //클릭이벤트 발생 지점부터 받은 값을 넣어줄 위치를 찾은 다음에 em태그를 find 메서드로 찾아 주었다.
	   thisnum.parent().parent().next().children().find("em").html("최대" + Coumoney +"원 적립");
};
*/

//장바구니 페이지 수량 버튼 클릭시 값 변경
function updateQty() {
    $(".edt-qty").on("change", function() {
        const productId = $(this).data("productId");
        const newQuantity = $(this).val();
        
        console.log(productId);
        console.log(newQuantity);
        
        // Ajax 요청으로 서버에 데이터 전송
        $.ajax({
            type: "POST", // 혹은 "GET" 등 HTTP 요청 메서드 선택
            url: "updateQuantity", // 실제 요청을 처리할 URL
            data: {
                productId: productId,
                newQuantity: newQuantity
            },
            success: function(response) {
                console.log("Quantity updated successfully:", response);
            },
            error: function(error) {
                console.error("Error updating quantity:", error);
            }
        });
    });
}

//개별 상품 수량 변경

$(document).ready(function() {
    $(".edt-qty").change(function() {
        const row = $(this).closest("tr");
        const productPrice = parseInt(row.find(".product-price").text()); // 제품 단가
        const newQuantity = parseInt($(this).val()); // 새로운 수량
        const total = productPrice * newQuantity; // 총 가격
        
        console.log(productPrice);
        console.log(newQuantity);
        console.log(total);


        row.find(".unit-total-price").text(total.toLocaleString("ko-KR") + "원"); // 해당 행의 총 가격 업데이트
    });
});




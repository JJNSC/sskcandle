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

function clickWishBtn() { 
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
            method: "POST",
            data: {productId:productId},
            dataType: "", // JSON 형식으로 응답을 기대함
            success: function(result) {
                console.log(result); // 콘솔에 isWished 값 출력

                if (result === "add success") {
                    $("img[id='like']").attr({src:"/skkcandle/resources/images/fullHeart.png"}).attr('alt', 'Full Heart');
                } else {
                    $("img[id='like']").attr({src:"/skkcandle/resources/images/emptyHeart.png"}).attr('alt', 'Empty Heart');
                }
            }
        });
    }    
}
/*
function changeWish() {
    var userId = $('input[name=userId]').val();
    var productId = $('input[name=productId]').val();
    console.log("userId : "+userId); 
    console.log("productId : "+productId); 
    
    $.ajax({
        url: "changeWish",
        method: "POST",
        data: {"productId":productId},
        success: function(data) {
            console.log(data);
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
*/
function addCartAndPay(){
	console.log("실행되는가");
	var productId = $('input[name=productId]').val();
	console.log("productId : "+ productId);
	var quantity = $('input[id=productCount]').val();
	console.log("quantity : "+ quantity);
	var userId = $('input[name=userId]').val();
	console.log("userId : "+ userId);
	
	if(!userId) {
		  alert("로그인이 필요한 서비스 입니다.")
		  location.href="loginForm?productId="+productId;
	} else {
		if (confirm("구매하시겠습니까")) { 
			location.href = "oneProductCart?productId="+productId+"&quantity="+quantity;
		}
	}
}

/*$(document).ready(function() {
    // 버튼 클릭 이벤트 등록
    $("#bestButton").on("click", function() {
       showReview(productId, page, "best");
    });

    $("#newestButton").on("click", function() {
       showReview(productId, page, "newest");
    });
});*/

function showReview(productId, page, orderBy) {
	   $.ajax({
	      url: "getReviewList",
	      method: "get",
	      data: {
	         "productId": productId,
	         "page": page,
	         "orderBy": orderBy
	      },
	      dataType: "json",
	      contentType: "application/json",
	      success: function(data) {
	         console.log(data);
	         let html = "";
		      console.log(data);

	         data.forEach(function(item, index) {
	            // 사용자 이미지
	        	 html += "<div class='sdp-review__article__list__info__profile'>";
	        	 if (item.base64Image != null) {
	        	    html += "<img src='data:" + item.userAttachType + ";base64, " + item.base64Image + "'/>";
	        	 } else {
	        	    html += "<img class='js_reviewArticleCrop js_reviewUserProfileImage' src='//img1a.coupangcdn.com/image/productreview/web/pdp/profile/img-profile-empty.png' data-member-id='3644655' style='width: 100%; height: auto; margin-top: 0px; opacity: 1;'>";
	        	 }
	        	 html += "</div>";
	            // 사용자 이름
	            html += "<div class='sdp-review__article__list__info__user'>";
	            html += "<h2>" + item.userName + "</h2>";
	            html += "</div>";
	            // 별점
	            html += "<div class='rate'>";
	            if (item.ratingScore == 1) {
		               html += "<span style='width: 20%'></span>"; }
		        else if (item.ratingScore == 2) {
		               html += "<span style='width: 40%'></span>"; }
		        else if (item.ratingScore == 3) {
		               html += "<span style='width: 60%'></span>"; }
		        else if (item.ratingScore == 4) {
		               html += "<span style='width: 80%'></span>"; }
		        else {
		               html += "<span style='width: 100%'></span>"; }

	            html += "</div>";
	            
	            html += "<div class='sdp-review__article__list__info__product-info__reg-date'>";
	            const reviewDate = new Date(item.reviewDate);
	            const formattedDate = reviewDate.toISOString().substr(0, 10);
	            html += formattedDate;
	            html += "</div>";
	            html += "<div class='sdp-review__article__list__info__product-info__seller_name'>";
	            html += "제조사: " + item.productMaker;
	            html += "</div>";
	            html += "<div class='sdp-review__article__list__headline'>";
	            html += "</div>";
	            html += "<div class='sdp-review__article__list__review js_reviewArticleContentContainer'>";
	            html += "<div class='sdp-review__article__list__review__content js_reviewArticleContent'>";
	            html += item.reviewContent;
	            html += "</div>";
	            html += "</div>";
	            
	         });
	         
	         
	         // 수정된 위치에서 $("#review").html(html)을 호출합니다.
	         $("#review").html(html);
	      },
	      error: function(error) {
	         console.log("아왜");
	      }
	   });
	}



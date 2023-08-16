
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		<title>Insert title here</title>
	</head>
	<title>제품 상세페이지</title>
	<!-- External JS -->
	<script src="resources/js/detailView.js"></script>
	
	</head>
		<!-- External CSS -->
		<link rel = "stylesheet" href ="resources/css/detailView.css"/>
		<link rel = "stylesheet" href ="resources/css/header/navHeader.css"/>
		<link rel = "stylesheet" href ="resources/css/footer/footer.css"/>
		
	<body>
	
	<div class="container">	
      <header>
      </header>
		
		<!-- 상품의 썸네일 & 상세사진 -->
		
	  <div class="product">
	    
	    <div class="prod_image">
			<c:if test="${productThumbnailPicture.productImage != null }"> 
		       <img src="data:${productDetailPicture.pattachtype};base64, ${base64Thb}"/>
			</c:if>
		</div>   
		
		
		 <!-- 상품 기본정보 등록란 -->
		 
	    <div class="prod-buy">
	     	<div class="product_name">
	     		<h2>${detailproduct.productName}</h2>
	     	</div>
	     	
	     	<!-- 찜한 상품 여부에 따라 하트 아이콘 표시 -->
		   <div class="prod-favorite">
			    <a class="prod-favorite-btn" onclick="clickWishBtn()">
			        <c:choose>
			            <c:when test="${isWished}">
			                <img id="like" src="${pageContext.request.contextPath}/resources/images/fullHeart.png" alt="Full Heart">
			            </c:when>
			            <c:otherwise>
			                <img id="like" src="${pageContext.request.contextPath}/resources/images/emptyHeart.png" alt="Empty Heart">
			            </c:otherwise>
			        </c:choose>
			    </a>
			</div>
			
	     	<!-- 별점 -->
	     	
	     	<div class="prod-buy-header_productview">
		 		
		 		<div class="review_count">
		 			${totalReviewNum}개의 상품평
		 		</div> 
	     	</div>
	     	
		 	<hr>
			<div class="price">
				${detailproduct.productPrice}원
			</div>
			<div class="product-cash">
                  	<div class="max-cash">
                  		<img src="//image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png" width="14px">
                  		<span class="reward-cash-txt">최대 <fmt:parseNumber value="${detailproduct.productPrice *0.1}" type="number" /> 원 적립 </span> <!-- 소숫점 아래는 안나오게 fmt 활용 -->
                  	</div>
            </div>				
			<hr>
			<div class="shipping price">
				무료배송
			</div>
			<div class="arrived date">
				내일(목)6/22 도착 보장
			</div>
			<div class="product-reward-cash-container">
            	<div class="reward-cash-summary">
                  	<div class="reward-cash-summary_title">
	                 	<img src="//image6.coupangcdn.com/image/badges/sdp/cashback/web/cash-icon@2x.png" width="20px">
	                  	<span>캐시적립 혜택</span>
                  	</div>
               	</div>
                  		
             <!-- 쿠페이 머니 결제 -->
             
             <div class="reward-cash-promotion">
             	<p>[<strong>평민</strong> 등급 고객님] 결제 시 1% 적립</p>
				<p>[<strong>귀족</strong> 등급 고객님] 결제 시 2% 적립</p>
				<p>[<strong>왕족</strong> 등급 고객님] 결제 시 4% 적립</p>
              </div>
           </div>
        		   
        	<!-- 장바구니 구매하기 -->
        	
        	<div class="product-buy-footer">
	        	<form id="cart" method="get" action=""> 
	        		<input type="hidden" name="productId" value="${detailproduct.productId}"> <!-- productId value을 알기위한 -->
	        		<input type="hidden" name="userId" value="${login.userId}">	<!-- 로그인 처리시 자스가 먼저 실행되므로 userID 파악을 위한 -->
		        	<button class="product-cart-btn" onclick="addCartBtn()" type="button"> 장바구니 담기 </button> 
		            <button class="product-buy-btn" onclick="addCartAndPay()" type="button"><span> 바로구매 </span></button>
		       
			        <!-- 장바구니 수량 버튼 -->
					<div class="input-group mb-3" style="max-width: 120px;">
				        <div class="input-group-prepend">
							<input class="btn btn-outline-primary js-btn-plus" type="button" onclick='count("minus")' value='-'/>
						</div>
					 		<input name="result" type="text" id="productCount" class="form-control tSext-center" value="1" min="0">
				        <div class="input-group-prepend">
							<input class="btn btn-outline-primary js-btn-minus" type="button" onclick='count("plus")' value='+'/>
					 	</div> 
					</div>
				</form>  
			</div>  
       		<div class="product-description">
            	<ul>
                	<li>색상계열: 화이트계열</li>
                  	<li>구성: 워머+캔들 세트</li>
                  	<li>쿠팡상품번호: 7058245313 - 17492361940</li>
                </ul>
            </div>
		</div>
    </div>    
        
        <!-- 상품 필수 정보 -->
        
        <div class="essential"> 
        
        <!-- 메뉴바 -->  
        
	        <div class="menu_tab">
		       <a href="#subType_image">상품상세</a>	       
		       <a href="#sdp-review_title">상품평(${totalReviewNum})</a>
		       <a href="#prod-inquiry-list__title">상품문의</a>
			   <a href="#product-delivery-return-policy-title">배송/교환/반품 안내</a>
	        </div>
	        
	       
        </div>
        
        
        <!-- 상품 소개 이미지 -->
        
        <div class="subType_image">
        	<c:if test="${productDetailPicture.productImage != null }"> 
		       <img src="data:${productDetailPicture.pattachtype};base64, ${base64Img}" width="900"/>
			</c:if>
        </div>
  
       <!-- 상품평 -->
       
    	<div class="sdp-review">
		   <div class="sdp-review_title" id="sdp-review_title"> 
		    	<h4 class="sdp-review_prd-name">상품평</h4> 
		    	<div class="sdp-review_guide-btn">상품평 운영원칙</div>
		  
		    </div>	
		  	<div class="sdp-review_caution">동일한 상품에 대해 작성된 상품으로 판매자는 다를 수 있습니다.</div>
			    <div class="sdp-review_rating">
			     	<div class="sdp-review_count"><h3>총 ${totalReviewNum} 개의 리뷰가 있습니다.</h3></div>	    	
			    	<div class="sdp-review_info-detail">자세히 보기 </div>
			    </div>
			    
	   	</div>
	    	
	    	<!-- 상품평 검색 메뉴바 -->
	    <div class="sdp-review">
	    	<section class= "sdp-review_article-menubar">
	    		<div class= "sdp-review__article__order">
	    			<button class="sdp-review_best">베스트순</button>
	    			<div class="sdp-review-sortbar">|</div>
	    			<button class= "sdp-review_new">최신순</button>
	    			<input class="sdp-review_search" placeholder="상품평을 검색해 보세요." maxlength="30">
	    		</div>
	    	</section>
	    <c:forEach var="review" items="${productreviews}">	<!-- 여기에 고객의 사진이 들어간다. -->
		    <article class="sdp-review__article__list js_reviewArticleReviewList">
		        <div class="sdp-review__article__list__info">          
		            <div class="sdp-review__article__list__info__profile">     
		            	<img class="js_reviewArticleCrop js_reviewUserProfileImage" src="//img1a.coupangcdn.com/image/productreview/web/pdp/profile/img-profile-empty.png" data-member-id="3644655" style="width: 100%; height: auto; margin-top: 0px; opacity: 1;">
		            </div> 
		            <div class="sdp-review__article__list__info__user">
		                <span class="sdp-review__article__list__info__user__name js_reviewUserProfileImage"><h2>${review.reviewId}</h2>&nbsp;</span> <!-- 고객의 이름 -->
		            </div>            
		            <div class="sdp-review__article__list__info__product-info">
		                    <div class="rate">
				                    <c:if test="${review.ratingScore==1}"><span style="width: 20%"></span></c:if> 
						 			<c:if test="${review.ratingScore==2}"><span style="width: 40%"></span></c:if> 
						 			<c:if test="${review.ratingScore==3}"><span style="width: 60%"></span></c:if> 
						 			<c:if test="${review.ratingScore==4}"><span style="width: 80%"></span></c:if> 
						 			<c:if test="${review.ratingScore==5}"><span style="width: 100%"></span></c:if>
		                	</div>
		                <div class="sdp-review__article__list__info__product-info__reg-date">
		                	<fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd"></fmt:formatDate>
		                </div>
		            </div>        
		                <div class="sdp-review__article__list__info__product-info__seller_name">
		                    	제조사: ${detailproduct.productMaker}
		                </div>
		            <div class="sdp-review__article__list__info__product-info__name">양키캔들 홈 인스퍼레이션 자캔들 L, 아일랜드 망고 코코넛, 1개</div>
		        </div>   
		            <div class="sdp-review__article__list__attachment js_reviewArticleListGalleryContainer">             
		                        <div class="sdp-review__article__list__attachment__list">
		                        </div>                 
		               </div>    
		            <div class="sdp-review__article__list__headline">                                
		            </div>       
		            <div class="sdp-review__article__list__review js_reviewArticleContentContainer">
		                <div class="sdp-review__article__list__review__content js_reviewArticleContent">
		                ${review.reviewContent}                    
		                </div>
		            </div>
		        <div class="sdp-review__article__list__help js_reviewArticleHelpfulContainer" data-review-id="487908706" data-count="0">                
		                <button class="sdp-review__article__list__help__report-btn js_reviewArticleReviewReportBtn" data-review-id="487908706">신고하기</button>      
		            <div class="sdp-review__clear"></div>  
		        </div>
	    </article>  
    </c:forEach>
    <table>
		 <tr>
		   <td colspan="4" class="text-center">
			    <div>
			        <a class="btn btn-outline-primary btn-sm" href="productDetail?productId=${detailproduct.productId}&pageNo=1">처음</a>
			        <c:if test="${pager.groupNo > 1}">
			            <a class="btn btn-outline-info btn-sm" href="productDetail?productId=${detailproduct.productId}&pageNo=${pager.startPageNo - 1}">이전</a>
			        </c:if>
			
			        <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
			            <c:if test="${pager.pageNo != i}">
			                <a class="btn btn-outline-success btn-sm" href="productDetail?productId=${detailproduct.productId}&pageNo=${i}">${i}</a>
			            </c:if>
			            <c:if test="${pager.pageNo == i}">
			                <a class="btn btn-danger btn-sm" href="productDetail?productId=${detailproduct.productId}&pageNo=${i}">${i}</a>
			            </c:if>
			        </c:forEach>
			
			        <c:if test="${pager.groupNo < pager.totalGroupNo}">
			            <a class="btn btn-outline-info btn-sm" href="productDetail?productId=${detailproduct.productId}&pageNo=${pager.endPageNo + 1}">다음</a>
			        </c:if>
			        <a class="btn btn-outline-primary btn-sm" href="productDetail?productId=${detailproduct.productId}&pageNo=${pager.totalPageNo}">맨끝</a>
			    </div>
			</td>
		</tr>
	</table>
	 	</div>	   		    
	    	<!-- 상품문의 주의란 -->
	    	
	    <div class="prod-inquiry-list">
	        	<div class="clearFix">
	            	<h4 class="prod-inquiry-list__title" id="prod-inquiry-list__title">상품문의</h4>
	            	<a class="prod-inquiry-list__write-btn" href="https://login.coupang.com/login/login.pang?rtnUrl=https%3A%2F%2Fwww.coupang.com%2Fnp%2Fpost%2Flogin%3Fr%3Dhttps%253A%252F%252Fwww.coupang.com%252Fvp%252Fproducts%252F7058245313%253FitemId%253D17492363374%2526vendorItemId%253D84334978398%2526sourceType%253Dsrp_product_ads%2526clickEventId%253Dbe06e564-043d-437e-bb6a-de109533728e%2526korePlacement%253D15%2526koreSubPlacement%253D1%2526q%253D%2525EC%2525BA%252594%2525EB%252593%2525A4%2525EB%2525B0%2525B1%2525ED%252599%252594%2525EC%2525A0%252590%252B%2525EC%25258A%2525A4%2525ED%252580%252598%2525EC%252596%2525B4%252B%2525ED%252581%2525AC%2525EB%2525A6%2525AC%2525EC%25258A%2525A4%2525ED%252583%252588%252B%2525EB%2525A3%2525A8%2525EC%25258B%25259C%2525EB%252593%25259C%252B%2525EC%2525BA%252594%2525EB%252593%2525A4%2525EC%25259B%25258C%2525EB%2525A8%2525B8%252B%2525EB%2525A1%25259C%2525EC%2525A6%252588%2525EA%2525B3%2525A8%2525EB%252593%25259C%2525ED%252599%252594%2525EC%25259D%2525B4%2525ED%25258A%2525B8%252B%2525EC%252586%25258C%2525EC%25259D%2525B4%252B%2525EC%2525BA%252594%2525EB%252593%2525A4%252B280g%2525EC%252584%2525B8%2525ED%25258A%2525B8%2526itemsCount%253D36%2526searchId%253Dcc37c5f5f01e4dbd8920e58de2c8c56e%2526rank%253D0%2526isAddedCart%253D">문의하기</a>
	        	</div>
	
	        <div class="prod-inquiry-list__emphasis">
	            <ul>
	                <li>구매한 상품의 <em>취소/반품은 마이쿠팡 구매내역에서 신청</em> 가능합니다.</li>
	                <li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
	                <li><em>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기</em>를 이용해주세요.</li>
	                <li><em>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</em></li>
	                <li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
	            </ul>
	            <br><hr><br>
	        </div>
	
		<!-- 상품문의 -->
		
        <div class="prod-inquiry-list__container">
			<div class="prod-inquiry-items">
				<div class="prod-inquiry-item">
					<em class="prod-inquiry-item__label">질문</em>
					<div class="prod-inquiry-item__wrap">
						<div class="prod-inquiry-item__time">2022/11/24 07:33:50</div>
						<div class="prod-inquiry-item__selected-option">베이&nbsp;&nbsp;쿠팡 </div>
						<div class="prod-inquiry-item__content">할로겐 전구 몇와트 인가요? 전구 나가서 사야되는데요 어떤 걸로 사야할지..</div>
						<hr><br>
					</div>							    
					<div class="prod-inquiry-item__reply">
						<em class="prod-inquiry-item__reply__label">답변</em>
						<div class="prod-inquiry-item__reply__wrap">
							<strong class="prod-inquiry-item__reply__author">[COUPANG]</strong>
							<div class="prod-inquiry-item__reply__content">캔들백화점 불빛높이조절 루시드 캔들워머 로즈골드화이트+소이캔들 280g세트, 베이 상품은 할로겐 전구 35W~50W 전구 이용해주시면 되는 점 상품 페이지를 통해 설명 드리고 있는 점 참고하여  이용 부탁드립니다.</div>
							<div class="prod-inquiry-item__reply__time">2023/02/02 13:05:34</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 신고하기 -->
					
		<div class="prod-report">
	    	<p class="prod-report__text">판매 부적격 상품 또는 허위과장광고 및 지식재산권을 침해하는 상품의 경우 신고하여 주시기 바랍니다.</p>
	        <button class="prod-report__button" id="productReport">신고하기</button>
	    </div>
    		</div>
    		
    	   <br>
    	   
    	   <!--배송 교환 반품 안내-->
    	   
            <div class="product-etc">
               <h5 class="product-delivery-return-policy-title" id="product-delivery-return-policy-title">배송정보</h5>
               <table class="product-delivery-policy-table">
                  <tbody> 
                     <tr>
                        <th>배송방법</th>
                        <td>순차배송</td>
                        <th rowspan="2">배송비</th>
                        <td rowspan="2">"무료배송"<br>- 로켓배송 상품 중 19,800원 이상 구매 시 무료배송<br>- 도서산간 지역 추가비용 없음</td>
                     </tr>
                     <tr>
                        <th>묶음배송 여부</th>
                        <td>가능</td>
                     </tr>
                     <tr>
                        <th>배송기간</th>
                        <td colspan="3">
                           <ul>
                              <li>
                                 쿠팡친구 배송 지역 : 주문 및 결제 완료 후, 1-2일 이내 도착
                              </li>
                              <li>
                                 쿠팡친구 미배송 지역 : 주문 및 결제 완료 후, 2-3일 이내 도착
                              </li>
                              <p>
                                 - 도서 산간 지역 등은 하루가 더 소요될 수 있습니다. 곧 고객님께도 쿠팡친구가 찾아갈 수 있도록 노력하겠습니다
                              </p>
                              <li>
                                 천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해 부탁드립니다.
                              </li>
                           </ul>   
                        </td>
                     </tr>
                  </tbody>
               </table>
             </div>
             
              <!--교환/반품 안내-->
              
            <h5 class="product-delivery-return-policy-title">교환/반품 안내</h5>
               <ul>
                  <li>
                     교환/반품에 관한 일반적인 사항은 판매자가 제시사항보다 관계법령이 우선합니다.<br>
                     다만, 판매자의 제시사항이 관계법령보다 소비자에게 유리한 경우에는 판매자 제시사항이 적용됩니다.
                  </li>
               </ul>   
               <table class="product-delivery-policy-table">
                  <tbody>
                     <tr>   
                        <th>교환/반품 비용</th>
                        <td>"ㆍ와우멤버십 회원: 무료로 반품/교환 가능"<br>
                           "ㆍ와우멤버십 회원 아닌 경우:"<br>
                           "1) [총 주문금액] - [반품 상품금액] = 19,800원 미만인 경우 반품비 5,000원"<br>
                           "2) [총 주문금액] - [반품 상품금액] = 19,800원 이상인 경우 반품비 2,500원"<br>
                        </td>
                     </tr>
                     <tr>
                        <th>교환/반품 신청 기준일</th>
                        <p>ㆍ단순변심에 의한 로켓배송 상품의 교환/반품은 제품 수령 후 30일 이내까지, 교환/반품 제한사항에 해당하지 않는 경우에만 가능 (교환/반품 비용 고객부담)</p>
                        <p>ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 가능</p>
                     </tr>
                  </tbody>
               </table>
               
              <!--교환/반품 제한 사항-->
              
            <h5 class="product-delivery-return-policy-title">교환/반품 제한사항</h5>
            <ul class="product-delivery-return-policy_limit-list">
               <li>주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
               <li>상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한 포장 개봉의 경우는 예외)</li>
               <li>고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
               <li>세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
               <li>모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로 요청하는 경우</li>
               <li>제조사의 사정 (신모델 출시 등) 및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우</li>
            </ul>
            <p>※ 각 상품별로 아래와 같은 사유로 취소/반품이 제한될 수 있습니다.</p>
            <table class="product-delivery-policy-table">
               <tbody>
                  <tr>
                     <th>의류/잡화/수입명품</th>
                     <td><p>ㆍ상품의 택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된 경우</p></td>
                  </tr>
                  <tr>
                     <th>계절상품/식품/화장품</th>
                     <td><p>ㆍ상품의 택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된 경우</p></td>
                  </tr>
                  <tr>
                     <th>전기/가전/설치상품</th>
                     <td><p>ㆍ설치 또는 사용하여 재판매가 어려운 경우</p><br>
                        <p>ㆍ상품의 시리얼 넘버 유출로 내장된 소프트웨어의 가치가 감소한 경우 (내비게이션, OS시리얼이 적힌 PMP</p>
                        <p>ㆍ홀로그램 등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우 (노트북, 데스크탑 PC 등)</p>
                        <br>   
                     </td>
                  </tr>
                  <tr>
                     <th>자동차용품</th>
                     <td><p>ㆍ상품을 개봉하여 장착한 이후 단순변심인 경우</p></td>
                  </tr>
                  <tr>
                     <th>CD/DVD/GAME/BOOK</th>
                     <td><p>ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우</p></td>
                  </tr>
               </tbody>
            </table>
            
            <!--판매자 정보-->
            
            <div class="prod-delivey-item_table product-seller">
               <p>판매자정보</p>
               <table class="product-delivery-policy-table">
                  <tbody>
                     <tr>
                        <th>판매자</th>
                        <td>쿠팡 1577-7011</td>
                     </tr>
                  </tbody>
               </table>
               <p>미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우 본인 또는 법정대리인이 취소할 수 있습니다.</p>
            </div>
            
        <!-- 고르고 골랐어요 -->
		</div>    
			<%@ include file="/WEB-INF/views/footer/footer.jsp" %> 
	</body>
</html>
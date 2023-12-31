<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="/html_css_javascript/favicon.ico" type="image/x-icon">
		<title>Insert title here</title>
		
		<!--부트스트랩을 사용하기 위한 외부 라이브러리 가져오기-->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> 
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
		<script src="resources/js/cart.js"></script>
	</head>
		<!-- External CSS -->
		<link rel = "stylesheet" href ="resources/css/cart.css"/>
		
	<body>
		<div class="wrap">
			<section class="contents-cart">
				<section class="cart-title">
					<h1 class="sr-only">장바구니</h1>
				</section>
			<div class="cartContent">
        		<table class="cartTable">
            		<tbody id="cartTable-sku">
		            	<tr>
		            		<td colspan="5" class="cart-bundle-title"> <!-- 틀이 어그러지는 것을 방지 -->
		        			</td>
		            	</tr>
		            	
		            	<!-- 상품정보 -->
			           	<c:forEach var="CartList" items="${cartList}" varStatus="d">
				           	<c:forEach var="ProductList" items="${CartList.productInfo}" varStatus="a">
			           			<c:if test="${a.index == d.index}">
			           				<c:forEach var="ImageList" items="${CartList.productImages}" varStatus="b">
		           						<c:if test="${a.index == b.index}">
		           							<c:forEach var="QuantityList" items="${CartList.quantity}" varStatus="c"> 
		           								<c:if test="${a.index == c.index}">	
									           		<tr class="cart-deal-item">		
										            	<td class="product-select-event">
										            		<input type="checkbox" class="dealSelectChk" name="cbox" value="${ProductList.productId}" onclick="sum()">
										            	</td>
										            	<td class="cart-deal-item_image">
									            			<c:if test="${ImageList.productImage != null }"> 
														       <img src="data:${ImageList.pattachtype};base64, ${ImageList.base64Image}"/>
															</c:if>
														</td>	
										            	<td class="product-box">
										            		<div class="product-name-part">
																${ProductList.productName}		           		
															</div>
										            		<div class="option-item-info">
															    <span class="arrive-date" style="display: inline-block;">
															        <span class="arrive-date-txt">내일</span>
															        <span class="arrive-date-day"></span>
															        <span class="arrive-date-date"></span>
															        <span class="arrive-date-time"></span>
															        <span class="promise-txt"> 도착 보장 </span>
															    </span>
															    <span class="delivery-condition">(밤 12시 전 주문 시)</span>
															</div>
															<div class="option-price-part">
																<span class="unit-cost">
																	<span class="unit-price-area">
																		<span class="unit-price">
																			<span class="sr-only">구매가격</span>
																			<span class="product-price">${ProductList.productPrice}</span>원
																		</span>
																	</span>
																	<input type="number" class="edt-qty" value="${QuantityList}" min="1" data-product-id="${ProductList.productId}" onchange="updateQty(this)">
																</span>	
															</div> 		
															<div class="badge-item option-benefit">
											             		<span class="promo-cash-benefit ">
											                		<i class="promo-cash-benefit__icon"></i>
											                		<em class="promo-cash-benefit__text">최대 <fmt:formatNumber value="${ProductList.productPrice * QuantityList *0.04}" pattern="#,###"/>원 적립</em>
										           		  		</span>
										   					</div>
														</td>
														<td class="unit-total-price">
										            		<div class="union-total-sale-price"><fmt:formatNumber value="${ProductList.productPrice * QuantityList}" pattern="#,###"/>원</div>									            		
										            		<!-- <img src="//img1a.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png" width="56" height="14" class="vendor-badge rocket" alt="로켓배송"> -->
									            		</td>
													</tr>	
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
						</c:forEach>
					
				
					
            	
            	<!-- <td class="delivery-fee">
            		<span class="delivery-fee_free" rowspan="1">무료</span>
            	</td> -->
            		<tr class="bundle-price-total">
            			<td colspan="5">
		                	<div class="rocket-tooltip" id="rocket-tooltip" style="display: block; right: 443px;">
		                    	<div class="rocket-info" id="rocket-info">
		                    		오픈기념
		                    	 <a class="link addRocketItem logging" href="//www.coupang.com/np/campaigns/82">
		                    	 	캔들 구매시
		                    	 </a>
		                    	 	 전 제품
		                    	 <em>무료배송</em> 
		                    	 	이벤트!
		                    	 </div>
		                	</div>
			                <span class="rocket-total-price-area">
								상품가격 
								<span class="total-product-price number">0</span>원
								<span class="coupon-area">
					                	<span class="symbol-plus">
					                		<span class="sr-only">더하기</span>
					                	</span>
										배송비 
										<span id="rocket-delivery-charge" class="delivery-charge">
											<strong>무료</strong>
										</span>
										<span class="symbol-equal">
											<span class="sr-only">결과는</span>
										</span>
											주문금액
					               		<span class="total-order-price number">0</span>원  
								</span>
			            	</span>
            			</td>
        			</tr>
            </tbody>
   		</table>
   		<div class="order-table-foot">
         	<span class="all-select-product">
				<label>
					<input type="checkbox" class="cboxAll" onchange="sum()"> <span>전체선택</span><span class="cart-count-bottom">( <em class="selected-num"></em>/<em class="all-num"></em>)</span>
				</label>
				<button class="selected-delete" onclick="deleteItemList()">삭제</button>
			<!-- <a href="javascript:void(0);" class="selected-soldout-delete logging" data-login="true" data-view-type="shoppingCart" data-event-name="deleteAllEosAndOosClick" data-log-label="cart-p-outDeleteAll" data-coulog-type="clickEvent">품절/판매종료상품 전체삭제</a> -->
			</span>
        </div>
        <div class="payment-reward-cash-area">
                <img class="payment-reward-cash-area__icon" src="//img1a.coupangcdn.com/image/cart/generalCart/ico_cash_m_2x.png">
                <h3 class="payment-reward-cash-area__title">적립금 혜택</h3>
              
                <span class="payment-reward-cash-area__desc">적립금 최대 4% 적립</span> 
        </div>
        <div class="cart-total-price">
            <div class="cart-total-price__inner">
                <div class="price-area">
                    <h2 class="sr-only" id="cart-total-price">
                       	 장바구니 총 주문금액 정보
                    </h2>
                    	총 상품가격
                    <em class="final-product-price">0</em>
                    	원
                    <span class="symbol-plus1"><span class="sr-only">더하기</span></span>
                    	총 배송비
                    <em class="final-delivery-charge">0</em>원
                    <span class="symbol-equal1"><span class="sr-only">결과는</span></span>
                   		 총 주문금액
                    <em class="final-order-price">
                      0원
                    </em>
                </div>

                <div id="ccidArea" class="ccid-area" style="display: none;">
                    <span class="ccid-amount">
                      	카드 즉시할인 예상금액 (<em id="ccidAmount">0</em>원 할인)
                    </span>
                    <span class="adjustment-price" id="adjustmentPrice">
                      <em>0</em>원
                    </span>
                </div>
            </div>
        </div>
		        <div class="order-buttons">
		            <a id="continueShoopingBtn" class="goShopping logging" href="productList">계속 쇼핑하기</a>
		            <button id="btnPay" class="goPayment narrow" onclick="buyCartList()">구매하기</button>
		            <div class="item-disabled" style="display: none;"></div>
		        </div>
		        <div class="cart-no-item d-none">
		     		<div class="empty-cart"><img src="/skkcandle/resources/images/녹초2.png" alt="장바구니가 비어있습니다"></div>
		        </div>
		        <div class="continue-shopping d-none">
                <a href="productList"><span class="sr-only">쇼핑하러 가기</span></a>
            	</div>
			</div>
			</section>			
		</div>
	</body>
</html>
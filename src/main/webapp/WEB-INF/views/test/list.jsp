<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width-device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon" />
		<title>쿠팡! - 캔들</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginForm.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test/header.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test/list_nav.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test/list_navbody.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test/list_paging.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test/list_additionalitems.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test/list_footer.css">
		
		<style>
		*{
			margin:0 auto;
			padding:0;
		}
		header{
			width:1340px;
		}
		#mainspace{
			width:1320px;
		}
		footer{
			height:372.33px;
			border:0px solid gray;	
		}
		
		
		</style>
	</head>
	<%@ include file="header.jsp" %>
	<div style="max-width:1320px; margin:0 auto; border:0px solid red;">
		
		<div id="mainspace">
			<div id="navbody">
				<div class="nav">
					<h4 style="padding:20px 00 ;">필터</h4>
					<div>
						<input type="checkbox" id="rocketfilter"><span class="service-filter-rocket_all"> <label for="rocketfilter"><img src="//image9.coupangcdn.com/image/badges/falcon/v1/web/rocket-all@2x.png" height="16" alt="rocket_all"></label> </span>
						<div id="check_rocket" style="height:74px;margin:6px -20px;padding: 13px 40px;box-sizing: border-box;background-color: #fafafa;">
							<input type="checkbox" id="onlyrocketbaesong"> <label for="onlyrocketbaesong"><span class="service-filter-rocket"> <img src="//image10.coupangcdn.com/image/badges/falcon/v1/web/txt_rocket@2x.png" width="auto" height="12" alt="ROCKET">  </span>만 보기</label><br>
							<input type="checkbox" id="onlyrocketjicgu"><label for="onlyrocketjicgu"> <span class="service-filter-coupang_global"> <img src="//image10.coupangcdn.com/image/badges/falcon/v1/web/txt_jikgu@2x.png" width="auto" height="12" alt="COUPANG_GLOBAL">  </span>만 보기</label>
						</div>
						<input type="checkbox" id="jungibaesong"> <label for="jungibaesong"><span class="service-filter-subscribable"></span></label> <br>
						<input type="checkbox" id="cebinew"><label for="cebinew"><span class="service-filter-top_brand"> <img src="//image6.coupangcdn.com/image/badges/top_brand/c-avenue.svg" height="16" alt="TOP_BRAND"> </span></label><br>
						<input type="checkbox" id="muryubaesong"><label for="muryubaesong"> 무료배송</label> 
					</div>
					
					<div class="category">
						<h4>카테고리</h4><br>
						<a href="#" class="more_look" style="font-weight: bold;">전체</a><br>
						<a href="#" class="noneblack">홈인테리어</a><br>
						<a href="#" class="noneblack">로켓직구</a><br>
						<a href="#" class="noneblack">결혼준비</a><br>
						<a href="#" class="noneblack">생활용품</a><br>
						<a href="#" class="noneblack">문구/오피스</a><br>
						<a href="#" class="more_look">+ 더보기</a>
					</div>
					
					<div class="item_brand">
						<h4>브랜드</h4><br>
						<input type="checkbox" id="rmie"> 
						<label for="rmie" >르미에</label><br>
						<input type="checkbox" id="cocodor"> 
						<label for="cocodor">코코도르</label><br>
						<input type="checkbox" id="comat"> 
						<label for="comat">코멧</label><br>
						<input type="checkbox" id="yankicandle">
						<label for="yankicandle"> 양키캔들</label><br>
						<input type="checkbox" id="zerocandel">
						<label for="zerocandel"> 제로캔들</label><br>
						<input type="checkbox" id="bukegarni">
						<label for="bukegarni"> 부케가르니</label><br>
						<a href="#" class="more_look">+ 더보기</a>
					</div>
					
					<div class="item_condition">
						<h4>상품 상태</h4><br>
						<input type="checkbox" id="newitem">
						<label for="newitem"> 새 상품</label><br>
						<input type="checkbox" id="boxdamaged">
						<label for="boxdamaged"> 박스 훼손</label><br>
						<input type="checkbox" id="repackaged">
						<label for="repackaged"> 재포장</label><br>
						<input type="checkbox" id="refund">
						<label for="refund"> 반품</label> <br>
						<input type="checkbox" id="used">
						<label for="used"> 중고</label><br>
						<a href="#" class="more_look">+ 더보기</a>
					</div>
					
					<div class="item_scent">
						<h4>향</h4><br>
						<input type="checkbox" id="noscent1">
						<label for="noscent"> 무향</label><br>
						<input type="checkbox" id="muskscent">
						<label for="nuskscent"> 머스크향</label><br>
						<input type="checkbox" id="babypowder">
						<label for="babypowder"> 베이비파우더향</label><br>
						<input type="checkbox" id="sourbutter">
						<label for="sourbutter"> 시어버터향</label><br>
						<input type="checkbox" id="fruitscent">
						<label for="fruitscent"> 과일향</label><br>
						<input type="checkbox" id="flowerscent">
						<label for="flowerscent"> 꽃향</label><br>
						<a href="#" class="more_look">+ 더보기</a>
					</div>
					
					<div class="item_color">
						<h4>색상</h4><br>
						<input type="checkbox" id="black">
						<label for="black"> 블랙</label><br>
						<input type="checkbox" id="navy">
						<label for="navy"> 네이비</label><br>
						<input type="checkbox" id="gray">
						<label for="gray"> 그레이</label><br>
						<input type="checkbox" id="silver">
						<label for="silver"> 실버</label><br>
						<input type="checkbox" id="red">
						<label for="red"> 레드</label><br>
						<input type="checkbox" id="orange">
						<label for="orange"> 오렌지</label><br>
						<a href="#" class="more_look">+ 더보기</a>
					</div>
					
					<div class="item_size">
						<h4>캔들사이즈</h4><br>
						<input type="checkbox" id="large">
						<label for="large"> 라지(450g 이상)</label><br>
						<input type="checkbox" id="medium">
						<label for="medium"> 미디움(250~450g)</label><br>
						<input type="checkbox" id="small">
						<label for="small">스몰(250g 이하)</label> 
					</div>
					
					<div class="composition">
						<h4>구성</h4><br>
						<input type="checkbox" id="warmercandleset">
						<label for="warmercandleset"> 워머+캔들 세트</label><br>
						<input type="checkbox" id="candelset">
						<label for="candelset"> 캔들 세트</label><br>
						<input type="checkbox" id="candlesingle">
						<label for="candlesingle"> 캔들 단품</label><br>
						<input type="checkbox" id="warmersingle">
						<label for="warmersingle"> 워머 단품</label>
					</div>
					
					<div class="item_kind">
						<h4>캔들종류</h4><br>
						<input type="checkbox" id="forcar">
						<label for="forcar"> 차량용</label><br>
						<input type="checkbox" id="jacandle">
						<label for="jacandle"> 자캔들</label><br>
						<input type="checkbox" id="votive">
						<label for="votive"> 양초 (보티브)</label><br>
						<input type="checkbox" id="tealight">
						<label for="tealight"> 티라이트</label>
					</div>
					
					<div class="item_single">
						<h4>낱개상품 여부</h4><br>
						<input type="checkbox" id="singleitem">
						<label for="singleitem"> 낱개상품</label><br>
					</div>
					
					<div class="item_weight">
						<h4>개당 중량</h4><br>
						<input type="checkbox" id="50g">
						<label for="50g"> 50g 이하</label><br>
						<input type="checkbox" id="100g">
						<label for="100g"> 50~100g</label><br>
						<input type="checkbox" id="150g">
						<label for="150g"> 100~150g</label><br>
						<input type="checkbox" id="200g">
						<label for="200g"> 150~200g</label><br>
						<input type="checkbox" id="250g">
						<label for="250g"> 200~250g</label><br>
						<input type="checkbox" id="300g">
						<label for="300g"> 250~300g</label><br>
						<a href="#" class="more_look">+ 더보기</a>
					</div>
					
					<div class="item_cap">
						<h4>뚜껑 유무</h4><br>
						<input type="checkbox" id="yescap">
						<label for="yescap"> 뚜껑 있음</label><br>
						<input type="checkbox" id="nocap">
						<label for="nocap"> 뚜껑 없음</label><br>
					</div>
					
					<div class="item_wick">
						<h4>심지 종류</h4><br>
						<input type="checkbox" id="cottonwick">
						<label for="cottonwick"> 코튼심지</label><br>
						<input type="checkbox" id="woodwick">
						<label for="woodwick"> 우드심지</label><br>
					</div>
					
					<div class="item_form">
						<h4>형태</h4><br>
						<input type="checkbox" id="normal">
						<label for="normal"> 일반</label><br>
						<input type="checkbox"id="number">
						<label for="number"> 숫자</label><br>
						<input type="checkbox" id="alphabet">
						<label for="alphabet"> 알파벳</label><br>
						<input type="checkbox" id="guitar">
						<label for="guitar"> 기타</label><br>
					</div>
					
					<div class="item_duratime">
						<h4>최대사용시간</h4><br>
						<input type="checkbox" id="5hour">
						<label for="5hour"> 5시간 이하</label><br>
						<input type="checkbox" id="10hour">
						<label for="10hour">5시간 이상 ~ 10시간 이하</label> <br>
						<input type="checkbox" id="15hour">
						<label for="15hour">10시간 이상 ~ 15시간 이하</label> <br>
						<input type="checkbox" id="30hour">
						<label for="30hour"> 15시간 이상 ~ 30시간 이하</label><br>
						<input type="checkbox" id="50hour">
						<label for="50hour"> 30시간 이상 ~ 50시간 이하</label><br>
						<input type="checkbox" id="100hour">
						<label for="100hour"> 50시간 이상 ~ 100시간 이하</label><br>
						<a href="#" class="more_look">+ 더보기</a>
					</div>
					
					<div class="item_theme">
						<h4>스타일/테마</h4><br>
						<input type="checkbox" id="morden">
						<label for="morden">모던/심플</label> <br>
						<input type="checkbox" id="europe">
						<label for="europe"> 북유럽</label><br>
						<input type="checkbox" id="kids">
						<label for="kids">키즈/캐릭터</label> <br>
						<input type="checkbox" id="natural">
						<label for="natural"> 내추럴</label><br>
						<input type="checkbox" id="romantic">
						<label for="romantic"> 로맨틱</label><br>
						<input type="checkbox" id="classic">
						<label for="classic">클래식/엔틱</label> <br>
						<a href="#" class="more_look">+ 더보기</a>
					</div>
					
					<div class="item_material">
						<h4>소재</h4><br>
						<input type="checkbox" id="paper">
						<label for="paper"> 종이</label><br>
						<input type="checkbox" id="wood">
						<label for="wood"> 원목/우드</label><br>
						<input type="checkbox" id="iron">
						<label for="iron"> 철재/스테인리스</label><br>
						<input type="checkbox" id="plastic">
						<label for="plastic"> 플라스틱</label><br>
						<input type="checkbox" id="latan">
						<label for="latan"> 라탄</label><br>
						<input type="checkbox" id="ackril">
						<label for="ackril"> 아크릴</label><br>
					</div>
					
					<div class="item_target">
						<h4>사용대상</h4><br>
						<input type="checkbox" id="forman">
						<label for="forman"> 남성용</label><br>
						<input type="checkbox" id="forwoman">
						<label for="woman">여성용</label> <br>
						<input type="checkbox" id="forunisex">
						<label for="forunisex">남녀공용</label> <br>
						<input type="checkbox" id="forkids">
						<label for="forkids">아동/유아용</label> <br>
					</div>
					
					<div class="scent_yesno">
						<h4>향 유무</h4><br>
						<input type="checkbox" id="nosmell">
						<label for="nosmell"> 무향</label><br>
						<input type="checkbox" id="yessmell">
						<label for="yessmell"> 유향</label><br>
					</div>
					
					<div class="star_rate">
						<h4>별점</h4><br>
						<a href="#" class="noneblack"><h4 style="color:#0073e9;">별점 전체</h4></a><br>
						<a href="#" class="noneblack"><span class="rating04"></span> 4점 이상</a><br>
						<a href="#" class="noneblack"><span class="rating03"></span> 3점 이상</a><br>
						<a href="#" class="noneblack"><span class="rating02"></span> 2점 이상</a><br>
						<a href="#" class="noneblack"><span class="rating01"></span> 1점 이상</a><br>
					</div>
					
					<div class="price">
						<h4>가격</h4><br>
						<a href="#" class="noneblack"><h4 style="color:#0073e9;">가격 전체</h4></a><br>
						<a href="#" class="noneblack"> 2만원 이하</a><br>
						<a href="#" class="noneblack"> 2만원~4만원</a><br>
						<a href="#" class="noneblack"> 4만원~6만원</a><br>
						<a href="#" class="noneblack"> 6만원~8만원</a><br>
						<a href="#" class="noneblack"> 8만원 이상</a><br>
						<input type="text" style="width:36px;height:19.33px;border: 1px solid #eee;">~
						<input type="text" style="width:36px;height:19.33px;border: 1px solid #eee;">원 <button id="navsearchbutton">검색</button>
					</div>
					
				</div>
				<div id="mainbody">
					<div id="searchresult"><strong>'캔들'</strong>에 대한 검색결과</div>
					<div id="relative_search">연관검색어 : 
						<a href="#">양키캔들 </a>
						<a href="#">소이캔들 </a>
						<a href="#">향초 </a>
						<a href="#">캔들 </a>
						<a href="#">초 </a>
						<a href="#">캔들 워머 </a>
						<a href="#">티라이트 </a>
						<a href="#">캔들워머 </a>
						<a href="#">양초 </a>
						<a href="#">일반양초 </a>
					</div>
					
					<div class="coupang_ranking">
						<div id="coupang_ranking_way"><img id="coupang_ranking_icon">쿠팡 랭킹순
							<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
						</div>
						<div>낮은 가격순</div>
						<div>높은 가격순</div>
						<div>판매량순</div>
						<div>최신순</div>
						<div style="float:right; border:1px solid green; font-weight: bold;">36개씩 보기</div>
					</div>
					<div id="items">
						<div class="item_row">
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">르미에 라지자 캔들 640g</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56302)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content"><img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 최대 758원 적립</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/336080386415927-85c72db2-1108-4031-8eeb-451e60c71a9c.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">양키캔들 라지자, 미드썸머스 나잇, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate"></span>
										<span class="base-price"></span>
										<div>
											<span class="total_price">16,000원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 257원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56305)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 800원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"><img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"></div>
								<div class="item_name">르미에 라지자 캔들 630g, 블랙 체리, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">5%</span>
										<span class="base-price">25,800</span>
										<div>
											<span class="total_price">24,290원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(21682)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,215원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4680835422592899-fe46536f-914d-4d68-bfb3-f55a6b1c652f.jpg" class="item_img">
								<div class="item_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
								<div class="item_name">코코도르 라지자 캔들, 코튼파우더, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 271원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(4219)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
						</div>
						<div class="item_row">
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/7d8e/b09ca7b1c93797c5d79933ae6576036196141c8e58c637f8fc0f917ea95b.jpg" class="item_img">
								<div class="item_badge">무료배송</div>
								<div class="item_name">갯썸레스트 더 네이처 대용량 소이캔들, 1개, 화이트머스크 750ml</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">21%</span>
										<span class="base-price">32,000</span>
										<div>
											<span class="total_price">25,280원</span>
											<!-- <img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png"> -->
										</div>
										<div class="unit_price">(10g당 337원)</div>
									</div>
									<div class="delivery">6/24(토) 도착 예정</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(85)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/5984026902557244-057d9dff-171c-4a2d-9176-999565b08397.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">코코도르 라지자 캔들, 윈터쟈스민, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 271원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(4219)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"><img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"></div>
								<div class="item_name">양키캔들 라지자, 핑크샌드, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">7%</span>
										<span class="base-price">16,440</span>
										<div>
											<span class="total_price">15,150원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 243원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56305)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 758원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/40nj20fz/57a94537749b46a18c7c7c9f9abe044f.jpg" class="item_img">
								<div class="item_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
								<div class="item_name">양키캔들 홈 이스퍼레이션 자캔들, 프레쉬허브 앤 레몬제스트, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">60%</span>
										<span class="base-price">39.000</span>
										<div>
											<span class="total_price">15,400원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 286원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(182)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 770원 적립
										</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
						</div>						
						<div class="item_row">
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">르미에 라지자 캔들 630g</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56302)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content"><img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 최대 758원 적립</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/336080386415927-85c72db2-1108-4031-8eeb-451e60c71a9c.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">양키캔들 라지자, 미드썸머스 나잇, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate"></span>
										<span class="base-price"></span>
										<div>
											<span class="total_price">16,000원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 257원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56305)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 800원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"><img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"></div>
								<div class="item_name">르미에 라지자 캔들 630g, 블랙 체리, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">5%</span>
										<span class="base-price">25,800</span>
										<div>
											<span class="total_price">24,290원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(21682)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,215원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4680835422592899-fe46536f-914d-4d68-bfb3-f55a6b1c652f.jpg" class="item_img">
								<div class="item_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
								<div class="item_name">코코도르 라지자 캔들, 코튼파우더, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 271원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(4219)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
						</div>
						<div class="item_bestseller">
							<div class="bestsellertop">
								<img class="bestseller_badgeimg" src="bestseller.png">
								<div class="bestseller_otherbuy">최근 다른 고객이 많이 구매한 상품</div>
							</div>
							<div class="bestsellerbottom">
								<div>
									<img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/706144336009499-6ffd09c3-f6b1-4d06-8fa3-f0b9f51b15b1.jpg" class="bestseller_img">
									<div class="bestseller_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
									<div class="bestseller_name">에인디 리얼유칼립투스 에선셜 캔들, 레몬 + 유칼립투스, 1개</div>
									<div class="price_wrap">
										<div class="price">
											<span class="discount_rate"></span>
											<span class="base-price"></span>
											<div>
												<span class="total_price">25,130원</span>
												<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
											</div>
											<div class="unit_price">(10g당 546원)</div>
										</div>
										<div class="delivery">내일(목) 도착 보장</div>
									</div>
									<div class="item_otherinfo">
										<img  class="rate"  src="starrate.png">
										<span class="rating_count">(277)</span>
									</div>
									<div class="reward_money">
										<div class="reward_money_content">
											<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
											최대 1,256원 적립
										</div>
									</div>
								</div>
								<div>
									<img src="https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/gsnuy51u/a873437a63a94b5a9d2c0eff7fd873ed.jpg" class="bestseller_img">
									<div class="bestseller_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
									<div class="bestseller_name">르미에 특대 필라 캔들 600g x 2p + 유리받침 세트, 1세트, 아카시아</div>
									<div class="price_wrap">
										<div class="price">
											<span class="discount_rate"></span>
											<span class="base-price"></span>
											<div>
												<span class="total_price">17,800원</span>
												<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
											</div>
											<div class="unit_price">(10g당 297원)</div>
										</div>
										<div class="delivery">내일(목) 도착 보장</div>
									</div>
									<div class="item_otherinfo">
										<img  class="rate"  src="starrate.png">
										<span class="rating_count">(469)</span>
									</div>
									<div class="reward_money">
										<div class="reward_money_content">
											<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
											최대 890원 적립
										</div>
									</div>
								</div>
								<div>
									<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2016/09/07/17/4/0212c190-e573-4039-998e-a2a0c79f24ee.jpg" class="bestseller_img">
									<div class="bestseller_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
									<div class="bestseller_name">스파스 디너캔들, 미색(아이보리), 14개입</div>
									<div class="price_wrap">
										<div class="price">
											<span class="discount_rate">14%</span>
											<span class="base-price">16,150</span>
											<div>
												<span class="total_price">13,740원</span>
												<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
											</div>
											<div class="unit_price"></div>
										</div>
										<div class="delivery">내일(목) 도착 보장</div>
									</div>
									<div class="item_otherinfo">
										<img  class="rate"  src="starrate.png">
										<span class="rating_count">(343)</span>
									</div>
									<div class="reward_money">
										<div class="reward_money_content">
											<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
											최대 687원 적립
										</div>
									</div>
								</div>
								<div>
									<img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/1222287955296287-fe9b2d86-97ce-454e-9c9b-9e84f71f41d7.JPG" class="bestseller_img">
									<div class="bestseller_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
									<div class="bestseller_name">코멧 캔들 라지자, 블랙체리 510g, 1개입</div>
									<div class="price_wrap">
										<div class="price">
											<span class="discount_rate">22%</span>
											<span class="base-price">11,420</span>
											<div>
												<span class="total_price">8,890원</span>
												<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
											</div>
											<div class="unit_price">(10g 당 174원)</div>
										</div>
										<div class="delivery">내일(목) 도착 보장</div>
									</div>
									<div class="item_otherinfo">
										<img  class="rate"  src="starrate.png">
										<span class="rating_count">(7231)</span>
									</div>
									<div class="reward_money">
										<div class="reward_money_content">
											<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
											최대 445원 적립
										</div>
									</div>
								</div>
								<div>
									<img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/07/08/12/9/1fcf3c40-00d8-4ccc-be89-7dcda03eacd4.jpg" class="bestseller_img">
									<div class="bestseller_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
									<div class="bestseller_name">르미에 필라캔들 특대, 05키친케어 음식냄새제거, 1개</div>
									<div class="price_wrap">
										<div class="price">
											<span class="discount_rate">5%</span>
											<span class="base-price">8,900</span>
											<div>
												<span class="total_price">8,410원</span>
												<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
											</div>
											<div class="unit_price">(10g 당 140원)</div>
										</div>
										<div class="delivery">내일(목) 도착 보장</div>
									</div>
									<div class="item_otherinfo">
										<img  class="rate"  src="starrate.png">
										<span class="rating_count">(3899)</span>
									</div>
									<div class="reward_money">
										<div class="reward_money_content">
											<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
											최대 420원 적립
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item_row">
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/7d8e/b09ca7b1c93797c5d79933ae6576036196141c8e58c637f8fc0f917ea95b.jpg" class="item_img">
								<div class="item_badge">무료배송</div>
								<div class="item_name">갯썸레스트 더 네이처 대용량 소이캔들, 1개, 화이트머스크 750ml</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">21%</span>
										<span class="base-price">32,000</span>
										<div>
											<span class="total_price">25,280원</span>
											<!-- <img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png"> -->
										</div>
										<div class="unit_price">(10g당 337원)</div>
									</div>
									<div class="delivery">6/24(토) 도착 예정</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(85)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/5984026902557244-057d9dff-171c-4a2d-9176-999565b08397.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">코코도르 라지자 캔들, 윈터쟈스민, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 271원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(4219)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"><img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"></div>
								<div class="item_name">양키캔들 라지자, 핑크샌드, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">7%</span>
										<span class="base-price">16,440</span>
										<div>
											<span class="total_price">15,150원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 243원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56305)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 758원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/40nj20fz/57a94537749b46a18c7c7c9f9abe044f.jpg" class="item_img">
								<div class="item_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
								<div class="item_name">양키캔들 홈 이스퍼레이션 자캔들, 프레쉬허브 앤 레몬제스트, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">60%</span>
										<span class="base-price">39.000</span>
										<div>
											<span class="total_price">15,400원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 286원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(182)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 770원 적립
										</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
						</div>
						<div class="item_row">
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">르미에 라지자 캔들 630g</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56302)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content"><img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 최대 758원 적립</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/336080386415927-85c72db2-1108-4031-8eeb-451e60c71a9c.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">양키캔들 라지자, 미드썸머스 나잇, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate"></span>
										<span class="base-price"></span>
										<div>
											<span class="total_price">16,000원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 257원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56305)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 800원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"><img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"></div>
								<div class="item_name">르미에 라지자 캔들 630g, 블랙 체리, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">5%</span>
										<span class="base-price">25,800</span>
										<div>
											<span class="total_price">24,290원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(21682)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,215원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4680835422592899-fe46536f-914d-4d68-bfb3-f55a6b1c652f.jpg" class="item_img">
								<div class="item_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
								<div class="item_name">코코도르 라지자 캔들, 코튼파우더, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 271원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(4219)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
						</div>
						<div class="item_row">
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/7d8e/b09ca7b1c93797c5d79933ae6576036196141c8e58c637f8fc0f917ea95b.jpg" class="item_img">
								<div class="item_badge">무료배송</div>
								<div class="item_name">갯썸레스트 더 네이처 대용량 소이캔들, 1개, 화이트머스크 750ml</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">21%</span>
										<span class="base-price">32,000</span>
										<div>
											<span class="total_price">25,280원</span>
											<!-- <img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png"> -->
										</div>
										<div class="unit_price">(10g당 337원)</div>
									</div>
									<div class="delivery">6/24(토) 도착 예정</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(85)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/5984026902557244-057d9dff-171c-4a2d-9176-999565b08397.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">코코도르 라지자 캔들, 윈터쟈스민, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 271원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(4219)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"><img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"></div>
								<div class="item_name">양키캔들 라지자, 핑크샌드, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">7%</span>
										<span class="base-price">16,440</span>
										<div>
											<span class="total_price">15,150원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 243원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56305)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 758원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/40nj20fz/57a94537749b46a18c7c7c9f9abe044f.jpg" class="item_img">
								<div class="item_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
								<div class="item_name">양키캔들 홈 이스퍼레이션 자캔들, 프레쉬허브 앤 레몬제스트, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">60%</span>
										<span class="base-price">39.000</span>
										<div>
											<span class="total_price">15,400원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 286원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(182)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 770원 적립
										</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
						</div>
						<div class="item_row">
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">르미에 라지자 캔들 630g</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56302)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content"><img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 최대 758원 적립</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/336080386415927-85c72db2-1108-4031-8eeb-451e60c71a9c.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">양키캔들 라지자, 미드썸머스 나잇, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate"></span>
										<span class="base-price"></span>
										<div>
											<span class="total_price">16,000원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 257원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56305)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 800원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"><img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"></div>
								<div class="item_name">르미에 라지자 캔들 630g, 블랙 체리, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">5%</span>
										<span class="base-price">25,800</span>
										<div>
											<span class="total_price">24,290원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(21682)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,215원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4680835422592899-fe46536f-914d-4d68-bfb3-f55a6b1c652f.jpg" class="item_img">
								<div class="item_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
								<div class="item_name">코코도르 라지자 캔들, 코튼파우더, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 271원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(4219)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
						</div>
						<div class="item_row">
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/7d8e/b09ca7b1c93797c5d79933ae6576036196141c8e58c637f8fc0f917ea95b.jpg" class="item_img">
								<div class="item_badge">무료배송</div>
								<div class="item_name">갯썸레스트 더 네이처 대용량 소이캔들, 1개, 화이트머스크 750ml</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">21%</span>
										<span class="base-price">32,000</span>
										<div>
											<span class="total_price">25,280원</span>
											<!-- <img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png"> -->
										</div>
										<div class="unit_price">(10g당 337원)</div>
									</div>
									<div class="delivery">6/24(토) 도착 예정</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(85)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/5984026902557244-057d9dff-171c-4a2d-9176-999565b08397.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">코코도르 라지자 캔들, 윈터쟈스민, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 271원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(4219)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"><img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"></div>
								<div class="item_name">양키캔들 라지자, 핑크샌드, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">7%</span>
										<span class="base-price">16,440</span>
										<div>
											<span class="total_price">15,150원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 243원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56305)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 758원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/40nj20fz/57a94537749b46a18c7c7c9f9abe044f.jpg" class="item_img">
								<div class="item_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
								<div class="item_name">양키캔들 홈 이스퍼레이션 자캔들, 프레쉬허브 앤 레몬제스트, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">60%</span>
										<span class="base-price">39.000</span>
										<div>
											<span class="total_price">15,400원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 286원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(182)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 770원 적립
										</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
						</div>
						<div class="item_row">
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">르미에 라지자 캔들 630g</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56302)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content"><img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 최대 758원 적립</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/336080386415927-85c72db2-1108-4031-8eeb-451e60c71a9c.jpg" class="item_img">
								<div class="item_badge"></div>
								<div class="item_name">양키캔들 라지자, 미드썸머스 나잇, 1개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate"></span>
										<span class="base-price"></span>
										<div>
											<span class="total_price">16,000원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 257원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(56305)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 800원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="item_img">
								<div class="item_badge"><img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"></div>
								<div class="item_name">르미에 라지자 캔들 630g, 블랙 체리, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">5%</span>
										<span class="base-price">25,800</span>
										<div>
											<span class="total_price">24,290원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 193원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(21682)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,215원 적립
									</div>
								</div>
								<div class="ad">AD
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
							<div>
								<span class="item_rank">랭킹</span>
								<img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4680835422592899-fe46536f-914d-4d68-bfb3-f55a6b1c652f.jpg" class="item_img">
								<div class="item_badge"><!-- <img class="coupang_recommand" src="https://image8.coupangcdn.com/image/badges/cou_pick/web/coupick@2x.png"> --></div>
								<div class="item_name">코코도르 라지자 캔들, 코튼파우더, 2개</div>
								<div class="price_wrap">
									<div class="price">
										<span class="discount_rate">3%</span>
										<span class="base-price">30,900</span>
										<div>
											<span class="total_price">29,800원</span>
											<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
										</div>
										<div class="unit_price">(10g당 271원)</div>
									</div>
									<div class="delivery">내일(목) 도착 보장</div>
								</div>
								<div class="item_otherinfo">
									<img  class="rate"  src="starrate.png">
									<span class="rating_count">(4219)</span>
								</div>
								<div class="reward_money">
									<div class="reward_money_content">
										<img class="reward_money_img" src="https://image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"> 
										최대 1,415원 적립
									</div>
								</div>
								<div class="ad">AD
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="paging">
				<div id="satisfy_search">
					<div id="satisfy_box">
						<div>현재결과에 만족하셨나요?</div>
						<div id="satisfy_imgs">
							<a href="#" id="thumbup"></a>
							<a href="#" id="thumbdown"></a>
						</div>
					</div>
				</div>
				<div id="paging_number">
					<a href="#" id="left_arrow"><img src="left_arrow.png"></a>
					<a href="#" id="nowpage">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">6</a>
					<a href="#">7</a>
					<a href="#">8</a>
					<a href="#">9 </a>
					... 27
					<a href="#" id="right_arrow"><img src="right_arrow.png"></a>
				</div>
			</div>
			<div id="otherbuyerlookitem_more">
				<div id="otherbuyerlookitem">
					<div id="otherbuyerlookitem_text">이 상품을 검색한 다른 분들이 함께 본 상품</div>
					<div id="otherbuyerlookitem_imgs">
						<div class="otherbuyerlookitem_list">
							<img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/02/19/0/9/538b3098-a9ec-4696-9ace-f529c5e69bcd.jpg" class="otherbuyerlookitem_img">
							<div class="otherbuyerlookitem_name">르미에 라지자 캔들 630g</div>
							<div class="otherbuyerlookitem_price_wrap">
								<div class="price">
									<div>
										<span class="otherbuyerlookitem_price">29,800원</span>
										<span class="unit_price">(10g당 193원)</span>
									</div>
										<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
								</div>
							</div>
							<div class="item_otherinfo">
								<img  class="rate"  src="starrate.png">
								<span class="rating_count">(56302)</span>
							</div>
						</div>
						<div class="otherbuyerlookitem_list">
							<img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4680835422592899-fe46536f-914d-4d68-bfb3-f55a6b1c652f.jpg" class="otherbuyerlookitem_img">
							<div class="otherbuyerlookitem_name">코코도르 라지자 캔들, 코튼파우더, 2개</div>
							<div class="otherbuyerlookitem_price_wrap">
								<div class="price">
									<div>
										<span class="otherbuyerlookitem_price">29,800원</span>
										<span class="unit_price">(10g당 271원)</span>
									</div>
										<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
								</div>
							</div>
							<div class="item_otherinfo">
								<img  class="rate"  src="starrate.png">
								<span class="rating_count">(4219)</span>
							</div>
						</div>
						<div class="otherbuyerlookitem_list">
							<img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/7d8e/b09ca7b1c93797c5d79933ae6576036196141c8e58c637f8fc0f917ea95b.jpg" class="otherbuyerlookitem_img">
							<div class="otherbuyerlookitem_name">갯썸레스트 더 네이처 대용량 소이캔들, 1개, 화이트머스크 750ml</div>
							<div class="otherbuyerlookitem_price_wrap">
								<div class="price">
									<div>
										<span class="otherbuyerlookitem_price">25,280원</span>
										<span class="unit_price">(10g당 337원)</span>
									</div>
										<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
								</div>
							</div>
							<div class="item_otherinfo">
								<img  class="rate"  src="starrate.png">
								<span class="rating_count">(85)</span>
							</div>
						</div>
						<div class="otherbuyerlookitem_list">
							<img src="https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/40nj20fz/57a94537749b46a18c7c7c9f9abe044f.jpg" class="otherbuyerlookitem_img">
							<div class="otherbuyerlookitem_name">양키캔들 홈 이스퍼레이션 자캔들, 프레쉬허브 앤 레몬제스트, 1개</div>
							<div class="otherbuyerlookitem_price_wrap">
								<div class="price">
									<div>
										<span class="otherbuyerlookitem_price">15,400원</span>
										<span class="unit_price">(10g당 286원)</span>
									</div>
										<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
								</div>
							</div>
							<div class="item_otherinfo">
								<img  class="rate"  src="starrate.png">
								<span class="rating_count">(182)</span>
							</div>
						</div>
						<div class="otherbuyerlookitem_list">
							<img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4680835422592899-fe46536f-914d-4d68-bfb3-f55a6b1c652f.jpg" class="otherbuyerlookitem_img">
							<div class="otherbuyerlookitem_name">코코도르 라지자 캔들, 코튼파우더, 2개</div>
							<div class="otherbuyerlookitem_price_wrap">
								<div class="price">
									<div>
										<span class="otherbuyerlookitem_price">29,800원</span>
										<span class="unit_price">(10g당 271원)</span>
									</div>
										<img class="item_rocket_deliver" src="https://image6.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png">
								</div>
							</div>
							<div class="item_otherinfo">
								<img  class="rate"  src="starrate.png">
								<span class="rating_count">(4219)</span>
							</div>
						</div>
					</div>
				</div>
				<img id="otherbuyerlookitem_arrow" src="moreitems_arrow.png">
			</div>
			<div id="looktogetheritem_more">
				<div id="looktogetheritem">
					<div id="looktogetheritem_text">같이 보면 좋은 상품<span>광고<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" class="ad-badge-svg"><g fill="none" fill-rule="evenodd" opacity=".3"><path fill="#000" fill-opacity="0" d="M0 12L12 12 12 0 0 0z" transform="translate(-1537 -743) translate(1537 743)"></path><path fill="#111" fill-rule="nonzero" d="M6 11.5c3.038 0 5.5-2.462 5.5-5.5S9.038.5 6 .5.5 2.962.5 6s2.462 5.5 5.5 5.5zm0 .5c-3.314 0-6-2.686-6-6s2.686-6 6-6 6 2.686 6 6-2.686 6-6 6zm.5-7v3.667L7.5 9h-3l1-.333V5.4l-1-.4h2zm-.625-2c.345 0 .625.28.625.625s-.28.625-.625.625-.625-.28-.625-.625S5.53 3 5.875 3z" transform="translate(-1537 -743) translate(1537 743)"></path></g></svg></span></div>
					<div id="looktogetheritem_imgs">
						<div class="looktogetheritem_info" >
							<img class="looktogetheritem_img" src="https://thumbnail6.coupangcdn.com/thumbnails/remote/300x300/image/vendor_inventory/6673/34dd01aeb99eceb5f9adbbffea39ee85650e23002e17efccdfeba2d3f3e0.jpg">
							<div class="looktogetheritem_deliver">무료배송</div>
							<img class="looktogetheritem_rate"  src="starrate.png">
							<div class="looktogetheritem_cnt">(3)</div>
						</div>
						<div class="looktogetheritem_info" >
							<img class="looktogetheritem_img" src="https://thumbnail9.coupangcdn.com/thumbnails/remote/300x300/image/vendor_inventory/bcce/d23742d64a694380d5ad8c0b6e93e708cd2de1def1d4f7522331faeb2beb.jpg">
							<div class="looktogetheritem_deliver"></div>
							<!-- <img class="looktogetheritem_rate"  src="starrate.png">
							<div class="looktogetheritem_cnt">(3)</div> -->
						</div>
						<div class="looktogetheritem_info" >
							<img class="looktogetheritem_img" src="https://thumbnail6.coupangcdn.com/thumbnails/remote/300x300/image/vendor_inventory/51a4/a81d3556e2149c54f48c7bfd5ff0544ce650a9e7d73e7a928cadc9106447.jpg">
							<div class="looktogetheritem_deliver"></div>
							<img class="looktogetheritem_rate"  src="starrate.png">
							<div class="looktogetheritem_cnt">(1)</div>
						</div>
						<div class="looktogetheritem_info" >
							<img class="looktogetheritem_img" src="https://thumbnail8.coupangcdn.com/thumbnails/remote/300x300/image/vendor_inventory/images/2015/11/06/14/5/cda2a3b4-3445-48e1-93ad-9df60e332d72.jpg">
							<div class="looktogetheritem_deliver">무료배송</div>
							<img class="looktogetheritem_rate"  src="starrate.png">
							<div class="looktogetheritem_cnt">(73)</div>
						</div>
					</div>
				</div>
				<img id="looktogetheritem_arrow" src="moreitems_arrow2.png">
			</div>
		</div>
	</div>
	<div id="footer_blackpart"></div>
	<footer>
		<div>
			<div id="footertopline">
				<ul id="footglobal">
					<li><a href="#">회사소개</a></li>
					<li><a href="#">Investor Relations</a></li>
					<li><a href="#">인재채용</a></li>
					<li><a href="#">입점/제휴문의</a></li>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">고객의 소리</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보 처리방침</a></li>
					<li><a href="#">쿠팡페이 이용약관</a></li>
					<li><a href="#">쿠팡페이 개인정보처리방침</a></li>
					<li><a href="#">신뢰관리센터</a></li>
					<li><a href="#">제휴마케팅</a></li>
					<li><a href="#">광고안내</a></li>
					<li><a href="#">global</a>
						<ul id="dropdown-footglobal">
							<li><a href="#">coupang</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div id="footermidline">
			<div style="border:0px solid red;">
				<a href="/" title="COUPANG" id="fml_coupangimg">COUPANG</a>
			</div>
			
			<div id="fml_address">
			<pre >
  상호명 및 호스팅 서비스 제공 : 쿠팡(주)
  대표이사 : 강한승,박대준
  서울시 송파구 송파대로 570
  사업자 등록번호 : 120-88-00767
  통신판매업신고 : 2017-서울송파-0680
  <a href="#"> 사업자정보 확인 ></a>
  			</pre>
			</div>
			
			<div id="fml_tel">
				<div id="fml_tel1"><strong>365고객센터 </strong>| 전자금융거래분쟁처리담당</div>
				<div id="fml_tel2">1577-7011 (유료)</div>
				<div id="fml_tel3">서울시 송파구 송파대로 570 </div>
				<div id="fml_tel4">email : help@coupang.com</div>
			</div>
			<div id="fml_words">
				<div id="fml_words1">우리은행 채무지급보증 안내</div>
				<div id="fml_words2">당사는 고객님이 현금 결제한 금액에 대해
					우리은행과 채무지급보증 계약을 체결하여
					안전거래를 보장하고 있습니다.
				</div>
				<a href="#" id="fml_words3">서비스 가입사실 확인 ></a>
			</div>
		</div>
		
		<div class="certification-list" style="">
        </div>
		
		<div id="footerbottomline">
			<div id="footerbottomline_left">
				<pre>
사이버몰 내 판매되는 상품 중에는 쿠팡에 등록한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다. 
마켓플레이스(오픈마켓) 상품의 경우 쿠팡은 통신판매중개자이며 통신판매의 당사자가 아닙니다.
쿠팡은 마켓플레이스(오픈마켓) 상품, 거래정보 및 거래 등에 대하여 책임을 지지 않습니다.
쿠팡은 소비자 보호와 안전거래를 위해 신뢰관리센터(CM112@coupang.com)를 운영하고 있으며, 관련 분쟁이 발생할 경우 별도의 분쟁 처리절차에 의거분쟁이 처리됩니다. 
Copyright © Coupang Corp. 2010-2022 All Rights Reserved.
				</pre>
			</div>
			<div id="footerbottomline_right">
				<a href="https://www.facebook.com/Coupang.korea" target="_blank" class="facebook" title="쿠팡 페이스북">쿠팡 페이스북</a>
				<a href="https://news.coupang.com/" target="_blank" class="blog" title="쿠팡 뉴스룸">쿠팡 뉴스룸</a>
				<a href="https://www.instagram.com/coupang" target="_blank" class="instagram" title="쿠팡 인스타그램">쿠팡 인스타그램</a>
			</div>
		</div>	
	</footer>
	
</html>
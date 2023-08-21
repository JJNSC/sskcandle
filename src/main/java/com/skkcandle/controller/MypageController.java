package com.skkcandle.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.skkcandle.dto.BuyList;
import com.skkcandle.dto.Cart;
import com.skkcandle.dto.Order;
import com.skkcandle.dto.OrderDetail;
import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Product;
import com.skkcandle.dto.ProductImages;
import com.skkcandle.dto.Review;
import com.skkcandle.dto.User;
import com.skkcandle.dto.Wish;
import com.skkcandle.dto.WishList;
import com.skkcandle.service.CartService;
import com.skkcandle.service.OrderService;
import com.skkcandle.service.ProductImagesService;
import com.skkcandle.service.ProductService;
import com.skkcandle.service.ReviewService;
import com.skkcandle.service.UserService;
import com.skkcandle.service.UserService.WithdrawResult;
import com.skkcandle.service.WishService;

import lombok.extern.slf4j.Slf4j;
/**
 * 마이페이지 관련 기능 처리 컨트롤러 
 * 
 * 결제 목록 조회, 결제 상품 검색, 결제상품 리뷰작성, 리뷰 목록 조회, 리뷰 수정, 리뷰 삭제,
 * 찜 목록 조회, 찜 상품 장바구니 담기, 찜 상품 찜 목록에서 삭제 ,회원 정보 수정, 회원탈퇴 기능 제공
 * @author 김종진
 *
 */
@Slf4j
@Controller
public class MypageController {
	
	/**
	 * 의존성 주입
	 */
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private WishService wishService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductImagesService productImageService;

	/**
	 * 마이페이지로 들어오는 요청들을 처리하는 메소드.
	 * 
	 * @param shoppingPageNo	결제목록의 페이징을 위한 페이지 번호 
	 * @param reviewPageNo		리뷰목록의 페이징을 위한 페이지 번호 
	 * @param model				subpage, 유저정보, 이미지정보, 에러메세지, 페이저정보, 결제목록, 찜목록, 리뷰 목록 등을 담는 모델 객체
	 * @param errMsg			특정 에러 발생시 모델에 담기는 에러 메세지
	 * @param subpage			마이페이지의 세부 페이지종류
	 * @param searchWord		구매했던 상품 검색을 위한 검색 키워드
	 * @param session			로그인중인 회원정보, 페이징시 현재 페이지의 정보를 얻기위한 세션 객체
	 * @return					'mypage/mypage' 마이페이지로 이동 
	 */
	@RequestMapping("/mypage")
	public String mypage(@RequestParam(name="shoppingPageNo", defaultValue="1")String shoppingPageNo, String reviewPageNo, Model model ,String errMsg,
						@RequestParam(name="subpage", defaultValue="myshoppinglist") String subpage,
						@RequestParam(name="searchWord", required=false) String searchWord, 
						HttpSession session) {
		model.addAttribute("subpage", subpage);
		User user = (User) session.getAttribute("login");
		model.addAttribute("userinfo", user);
		if(user.getUserImageData()!=null) {
			String base64Img = Base64.getEncoder().encodeToString(user.getUserImageData());
			model.addAttribute("base64Img", base64Img);
		}
		
		//내정보 확인/수정 페이지
		if(subpage.equals("myinfocheck")) {
			model.addAttribute("errMsg", errMsg);
			
		//내 구매 리스트 페이지	
		}else if(subpage.equals("myshoppinglist")) {
			// 브라우저에서 pageNo가 넘어오지 않았을 경우
			if (shoppingPageNo == null) {
				// 세션에 저장되어 있는지 확인
				shoppingPageNo = (String) session.getAttribute("shoppingPageNo");
				if (shoppingPageNo == null) {
					// 저장되어 있지 않다면 1로 초기화
					shoppingPageNo = "1";
				}
			}
			// 문자열로 정수를 변환
			int intpageNo = Integer.parseInt(shoppingPageNo);
			// 세션에 pageNo를 저장
			session.setAttribute("shoppingPageNo", String.valueOf(intpageNo));
			int userId = user.getUserId();
			//페이징
			//총 페이지수 
			//구매리스트에 검색단어 추가시 
			int totalBoardNum =0;
			if(searchWord !=null) {
				Order order = new Order();
				order.setUserId(userId);
				order.setProductName(searchWord);
				totalBoardNum = orderService.getOrderCountBySearchword(order);
			}else {
				totalBoardNum = orderService.getOrderCount(userId);
			}
			Pager pager = new Pager(3, 5, totalBoardNum, intpageNo);
			
			//구매 리스트 가져오기전에 pager에 userId 세팅하기 
			pager.setUserId(userId);
			List<BuyList> orderList = new ArrayList<>();
			if(searchWord !=null) {
				//구매 리스트에서 검색단어 추가시 
				pager.setSearchWord(searchWord);
				orderList = orderService.getBuyListBySearchword(pager);
			}else {
				orderList = orderService.getBuyList(pager);
			}
			//만약 총 게시물이 한페이지안에서 해결가능한 갯수라면 페이징을 실행시키지 않는다.
			if(totalBoardNum <= 5) {
				model.addAttribute("noPaging", 1);
			}
			model.addAttribute("shoppingPager", pager);
			model.addAttribute("orderList", orderList);

			//내 리뷰 리스트	
		}else if(subpage.equals("myreviewlist")) {
			// 브라우저에서 pageNo가 넘어오지 않았을 경우
			if (reviewPageNo == null) {
				// 세션에 저장되어 있는지 확인
				reviewPageNo = (String) session.getAttribute("reviewPageNo");
				if (reviewPageNo == null) {
					// 저장되어 있지 않다면 1로 초기화
					reviewPageNo = "1";
				}
			}
			// 문자열로 정수를 변환
			int intpageNo = Integer.parseInt(reviewPageNo);
			// 세션에 pageNo를 저장
			session.setAttribute("reviewPageNo", String.valueOf(intpageNo));
			int userId = user.getUserId();
			//paging
			int totalBoardNum = reviewService.reviewNum(userId);
			Pager pager = new Pager(10, 5, totalBoardNum, intpageNo);
			pager.setUserId(userId);
			List<Review> reviewList = reviewService.reviewPaging(pager);
			List<Product> productList = new ArrayList<>();
			for(Review review : reviewList) {
				int productId = review.getProductId();
				Product product = productService.detailProduct(productId);
				productList.add(product);
			}
			if(totalBoardNum <= 10) {
				model.addAttribute("noPaging", 1);
			}
			model.addAttribute("reviewPager", pager);
			model.addAttribute("myreview", reviewList);
			model.addAttribute("productList", productList);
		
		//내 찜 목록
		}else if(subpage.equals("mywishlist")) {
			user = (User) session.getAttribute("login");
			int userId = user.getUserId();
			List<WishList> wishList = wishService.getWishList(userId);
			model.addAttribute("wishLists", wishList);
		
		//회원 탈퇴 
		}else if(subpage.equals("withdraw")) {
			model.addAttribute("errMsg", errMsg);
		}
		return "mypage/mypage";
	}
	
	/**
	 * 회원정보 수정폼에서 요청받은 데이터로 세션에 있는 회원의 정보를 수정하는 메소드 
	 * 
	 * @param user			회원이 입력한 수정될 데이터 
	 * @param session		현재 로그인이 되어있는 유저의 정보가 담긴 세션 객체
	 * @return				'redirect:/mypage' (마이페이지)로 이동 
	 * @throws IOException	이미지 파일이 발견되지 않았을때를 대비한 IOException 선언
	 */
	//이미지 업로드 테스트 -> 회원 정보수정
	@PostMapping("/updateMyInfo")
	public String imageTest(User user, HttpSession session) throws IOException {
		//이미지 저장
		MultipartFile mf = user.getBattach(); 
		//새로운 이미지가 있으면 업데이트
		if(mf.getBytes().length != 0 ) {
			user.setUserAttachType(mf.getContentType());
			user.setUserImageData(mf.getBytes());
			userService.updateUserImage(user);
		}
		//비밀번호 수정 O
		if(!user.getUserPassword().equals("")) {
			PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			user.setUserPassword(pwEncoder.encode(user.getUserPassword()));
			userService.updateUserInfo(user);
		// 비밀번호 수정 X
		}else if(user.getUserPassword().equals("")) {
			userService.updateUserInfoNoPW(user);
		}
		//db정보 받아오기
		User dbUser = userService.getUserInfoById(user.getUserId());
		session.setAttribute("login", dbUser);
		return "redirect:/mypage";
	}
	
	/**
	 * 회원정보수정 전에 회원의 이메일,비밀번호 2차인증하는 메소드 
	 * 
	 * @param user		회원이 입력한 이메일, 비밀번호를 받아오는 user객체
	 * @param session	현재 로그인된 회원의 정보를 받아오는 세션 객체
	 * @param model		에러메세지, 성공시 회원정보 수정 폼으로 가도록 subpage를 담는 모델 객체
	 * @return			'redirect:/mypage'(마이페이지)로 이동
	 */
	@PostMapping("/myInfoCheck")
	public String myInfoCheck(User user, HttpSession session, Model model) {
		User sessionUser = (User) session.getAttribute("login");
		String errMsg ="";
		String subpage="";
		WithdrawResult result = userService.withdraw(sessionUser, user);
		if(result == WithdrawResult.FAIL_EMAIL_WRONG) {
			errMsg="이메일 주소를 잘못 입력하였습니다.";
			subpage="myinfocheck";
		}else if(result == WithdrawResult.FAIL_PASSWORD_WRONG) {
			errMsg="비밀번호를 잘못 입력하였습니다.";
			subpage="myinfocheck";
		}else if(result == WithdrawResult.SUCCESS) {
			subpage="myinfo";
		}
		model.addAttribute("errMsg", errMsg);
		model.addAttribute("subpage", subpage);
		return "redirect:/mypage";
	}
	
	/**
	 * 찜리스트에서 장바구니 추가 버튼 클릭시 장바구니에 해당상품 추가 되는 메소드 
	 * 
	 * 이미 상품이 있을 시 상품 개수가 1 증가 
	 * 상품이 없을 시 해당 상품이 장바구니 추가 
	 * @param productId		추가되는 상품의 productId
	 * @param session		로그인 되어있는 회원의 정보를 받아오는 session 객체 
	 */
	//찜리스트에서 장바구니 추가 버튼 누를시 작동
	@PostMapping("/wishToCart")
	@ResponseBody
	public void wishToCart(@RequestParam("productId") int productId, HttpSession session) {
		User user = (User) session.getAttribute("login");
		int userId = user.getUserId();
		Cart cart = new Cart();
		cart.setProductId(productId);
		cart.setUserId(userId);
		cart.setCount(1);
		//이미 담겨있는지 없는지 확인
		int recognize = cartService.countCart(cart);
		// 없으면 넣고 
		if(recognize == 0 ) {
			cartService.insertCart(cart);
		// 있으면 업뎃
		}else if(recognize ==1 ) {
			cartService.updateCart(cart);
		}
	}
	
	/**
	 * 찜 목록 삭제 메소드 
	 * 
	 * @param productId		삭제할 상품의 productId
	 * @param session		로그인 되어있는 회원의 정보를 받아오는 session 객체 
	 */
	//찜리스트에서 찜목록 삭제 버튼 누를시 작동
	@PostMapping("/deleteWish")
	@ResponseBody
	public void deleteWish(@RequestParam("productId") int productId, HttpSession session) {
		User user = (User) session.getAttribute("login");
		int userId = user.getUserId();
		Wish wish = new Wish();
		wish.setProductId(productId);
		wish.setUserId(userId);
		wishService.remove(wish);
	}
	
	/**
	 * 리뷰 작성또는 수정하기 요청을 처리하는 메소드
	 * 
	 * 리뷰 작성하기 버튼 클릭시 리뷰 작성할 상품의 정보를 모델에 담아서 리뷰 작성 폼으로 이동 
	 * 리뷰 수정하기 버튼 클릭시 리뷰 수정할 상품의 정보와 기존에 작성한 리뷰 내용을 모델에 담아서 리뷰 작성폼으로 이동 
	 * @param productId		리뷰 작성할 상품의 productId
	 * @param orderId		같은 상품도 2번주문하면 2번 작성할수 있으므로 주문했던 내용을 받아오는 orderId
	 * @param reviewId		리뷰 수정하기 버튼 클릭시 어떤 리뷰를 수정할지 알려주는 reviewId
	 * @param session		로그인 되어있는 회원의 정보를 받아오는 session 객체 
	 * @param model			리뷰 작성할 상품의 정보와 리뷰 수정시 기존에 작성한 리뷰 내용을 담는 모델 객체
	 * @return				'reviewForm'(리뷰 작성페이지) 로 이동
	 */
	//리뷰작성하기 버튼 클릭시 리뷰폼으로 보내기
	//혹은 리뷰에서 수정하기 버튼 클릭시 리뷰폼으로 보내기
	@RequestMapping("/reviewForm")
	public String reviewForm(@RequestParam(name="productId", defaultValue="0") int productId,
							 @RequestParam(name="orderId", defaultValue="0")int orderId , 
							 @RequestParam(name="reviewId", defaultValue="0")int reviewId, HttpSession session, Model model) {
		Product product = new Product();
		//리뷰 작성하기로 들어왔을경우
		if(reviewId == 0) {
			model.addAttribute("orderId", orderId);
			product = productService.detailProduct(productId);
		}
		//리뷰 수정하기로 들어왔을 경우
		else {
			Review review = reviewService.getReviewInfo(reviewId);
			productId = review.getProductId();
			product = productService.detailProduct(productId);
			model.addAttribute("review", review);
		}
		ProductImages productImage = productImageService.thumbnailImage(productId);
		String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImage());
		productImage.setBase64Image(base64Img);
		model.addAttribute("productImage", productImage);
		model.addAttribute("product", product);
		//리뷰아이디를 통해 만약 리뷰아이디가 0이면 작성하기 버튼, 0이 아니면 수정하기 버튼
		model.addAttribute("reviewId", reviewId);
		return "reviewForm";
	}
	/**
	 * 리뷰 작성 또는 수정한 데이터를 처리하는 메소드
	 * 
	 * 리뷰 작성 시 새로운 리뷰를 db 에 저장 후 해당 상품의 상태를 리뷰작성하기 에서 리뷰 작성 완료 로 수정 
	 * 리뷰 수정 시 기존의 리뷰 내용을 수정한 리뷰 내용으로 업데이트 
	 * @param productId		리뷰 작성,수정 할 상품의 productId
	 * @param orderId		리뷰작성하기 에서 리뷰 작성 완료 로 수정 하는 상품을 특정하기 위한 orderId
	 * @param userId		작성자의 userId
	 * @param reviewTitle	리뷰 제목 
	 * @param ratingScore	리뷰 별점
	 * @param reviewContent	리뷰 내용
	 * @param reviewId		리뷰 고유번호
	 * @return				'redirect:/mypage?subpage=myreviewlist'(마이페이지 중 리뷰 목록) 으로 이동 
	 */
	//리뷰 작성버튼 클릭시 db에 저장하고 orderDetail의 해당 상품과 해당 유저의 열의 review를 2로 바꿔야한다.
	//그리고 리뷰 리스트로 보내자
	@Transactional
	@PostMapping("submitReview")
	public String submitReview(@RequestParam int productId, 
					@RequestParam(name="orderId", defaultValue="0") int orderId,	
					@RequestParam int userId,
					@RequestParam String reviewTitle,
					@RequestParam(name="ratingScore", defaultValue="5") int ratingScore,
					@RequestParam String reviewContent, 
					@RequestParam int reviewId) {
		Review review= new Review();
		review.setProductId(productId);
		review.setRatingScore(ratingScore);
		review.setReviewContent(reviewContent);
		review.setReviewTitle(reviewTitle);
		review.setUserId(userId);
		
		//리뷰를 처음으로 작성시
		if(reviewId==0) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderId(orderId);
			orderDetail.setProductId(productId);
			orderDetail.setUserId(userId);
			
			reviewService.insertReview(review);
			orderService.reviewedOrder(orderDetail);
		}
		//리뷰를 수정할시 
		else {
			review.setReviewId(reviewId);
			reviewService.updateReview(review);
		}
		return "redirect:/mypage?subpage=myreviewlist";
	}
	
	/**
	 * 리뷰 삭제 메소드
	 * 
	 * @param reviewId	삭제할 리뷰의 reviewId
	 */
	@PostMapping("/deleteReview")
	@ResponseBody
	public void deleteReview(@RequestParam int reviewId) {
		reviewService.deleteReview(reviewId);
	}
	
}















package com.skkcandle.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skkcandle.dto.Cart;
import com.skkcandle.dto.Order;
import com.skkcandle.dto.OrderDetail;
import com.skkcandle.dto.Product;
import com.skkcandle.dto.ProductImages;
import com.skkcandle.dto.User;
import com.skkcandle.service.CartService;
import com.skkcandle.service.OrderService;
import com.skkcandle.service.ProductService;
import com.skkcandle.service.UserService;

import lombok.extern.slf4j.Slf4j;
/**
 * 결제 페이지 관련 기능 처리 컨트롤러 
 * 
 * 결제페이지 이동, 결제 기능 제공
 * @author 김종진
 *
 */
@Slf4j
@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	Date today;
	/**
	 * 의존성 주입
	 */
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 결제페이지로 이동 메소드 
	 * 
	 * 장바구니에서 이동시 장바구니에서 productId를 매개변수로 받아서 해당상품들의 정보를 DB의 장바구니 테이블에서 요청
	 * 제품 상세 페이지에서 이동시 장바구니에 해당 상품을 추가 혹은 업데이트 이후 해당 상품의 정보를 DB의 장바구니 테이블에서 요청
	 * 회원 정보는 session 객체로부터 요청 후 model 객체에 담아 리턴한다. 
	 * @param session		로그인한 회원의 정보를 받아오는 세션 객체
	 * @param model			상품의 정보, 회원의 정보를 담는 model 객체 
	 * @param buyCartList	장바구니에서 받아오는 상품들의 productId 배열을 담은 객체 
	 * @param productId		제품 상세페이지에서 요청받은 해당 상품의 productId
	 * @return				'/payment/payment' (결제페이지) 로 이동
	 */
	@RequestMapping("")
	public String main(HttpSession session, Model model, @RequestParam(name="buyCartList",defaultValue="") List<Integer> buyCartList,@RequestParam(name="productId",defaultValue="0" ) int productId) { // 장바구니 or 상품상세페이지 끝나면 일로 상품정보+상품갯수 정보가 와야함
		//로그인 한 사람의 정보 
		User sessionUser = (User) session.getAttribute("login"); //추후에 login 이름으로 User 형식으로 세션에 setAttribute할거임(로그인할때)
		int userId = sessionUser.getUserId();
		
		//만약 장바구니에서 왔을경우
		if(buyCartList.size() != 0) {
			ArrayList<Integer> quantityList = new ArrayList<>();
			List<Product> productInfoList =  new ArrayList<>();
			// session의 userId 와 buyCartList의 productId 를 통해 Cart에서는 상품개수 , Product에서는 상품이름, 가격을 가져온다.
			for(Integer ProductID : buyCartList) {
				Cart cart = new Cart();
				cart.setUserId(userId);
				//Cart 에서 상품 개수 가져와서 리스트로 만들자.
				cart.setProductId(ProductID);
				int quantity = cartService.getQuantity(cart);
				quantityList.add(quantity);
				
				//Product에서는 상품이름,가격을 가져온다.
				Product product = new Product();
				product = productService.detailProduct(ProductID);
				productInfoList.add(product);
			}
			//사용자의 구매리스트
			model.addAttribute("productinfo", productInfoList);
			model.addAttribute("productQuantity", quantityList);
		}
		//제품 상세에서 왔을경우
		else {
			ArrayList<Integer> quantityList = new ArrayList<>();
			List<Product> productInfoList =  new ArrayList<>();
			//상품 정보 받아오기
			Product product = new Product();
			product = productService.detailProduct(productId);
			productInfoList.add(product);
			//상품 개수 받아오기
			Cart cart = new Cart();
			cart.setUserId(userId);
			cart.setProductId(productId);
			int quantity = cartService.getQuantity(cart);
			quantityList.add(quantity);
			
			//사용자의 구매리스트
			model.addAttribute("productinfo", productInfoList);
			model.addAttribute("productQuantity", quantityList);
		}
		model.addAttribute("userinfo", sessionUser);
		return "/payment/payment";
	}
	/**
	 * 결제 완료 요청 처리하는 메소드 
	 * 
	 * 결제 완료시 유저의 정보, 상품의 정보, 결제 정보를 매개변수로 받아와서 db에 저장
	 * 결제 완료된 상품을 장바구니에서 제거
	 * 사용한 적립금 차감, 결제 금액과 회원에 등급에 따른 적립금 차등 지급
	 * @param session			로그인한 회원의 정보를 받아오는 세션 객체
	 * @param userPostcode		배송지 우편번호
	 * @param userRoadAddress	배송지 도로명 
	 * @param userDetailAddress	배송지 상세 주소 
	 * @param usedPoint			사용된 적립금
	 * @param productList		구매한 상품들의 productId
	 * @param quantityList		구매한 상품들의 갯수
	 * @param accountTransfer	결제 방식1. 계좌이체
	 * @param creditCard		결제 방식2. 신용카드
	 * @param phone				결제 방식3. 휴대폰 결제
	 * @param withoutBankbook	결제 방식4. 무통장 입금
	 * @return					'redirect:/' (메인페이지) 로 이동
	 */
	//TRANSACTION NEEDED
	//여기 나중에  트랜젝션 해야한다. (주문이 성공해야 결재리스트에 올리고 , 장바구니에서 삭제가 되야함.)
	@Transactional
	@RequestMapping("/payComplete")
	public String payComplete(HttpSession session,
			@RequestParam int userPostcode,
			@RequestParam String userRoadAddress,
			@RequestParam String userDetailAddress,
			@RequestParam int usedPoint,
            @RequestParam List<Integer> productList,
            @RequestParam List<Integer> quantityList,
            @RequestParam String accountTransfer,
            @RequestParam String creditCard,
            @RequestParam String phone,
            @RequestParam String withoutBankbook) {
		
		User sessionUser = (User) session.getAttribute("login");
		int userId = sessionUser.getUserId();
		
		if(accountTransfer.equals("undefined")) {
			accountTransfer ="";
		}
		if(creditCard.equals("undefined")) {
			creditCard ="";
		}
		if(phone.equals("undefined")) {
			phone ="";
		}
		if(withoutBankbook.equals("undefined")) {
			withoutBankbook ="";
		}
		
		//insertBuyList 로 orderinfo에 정보를 넣고 orderId를 받아온다.
		Order order = new Order();
		order.setUserId(userId);
		order.setShippingPostcode(userPostcode);
		order.setShippingRoadAddress(userRoadAddress);
		order.setShippingDetailAddress(userDetailAddress);
		order.setAccountTransfer(accountTransfer);
		order.setCreditCard(creditCard);
		order.setPhone(phone);
		order.setWithoutBankbook(withoutBankbook);
		int orderId = orderService.insertBuyList(order);
		
		//포인트를 위해 total 결제금액을 저장할 공간을 주자 
		int totalPrice = 0;
		
		//orderId, productId, quantity 를 orderDetail에 세팅해준다. 
		//동시에 해당 userId와 productId를 이용해서 장바구니에서 해당 열을 삭제한다.
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setUserId(userId);
		orderDetail.setOrderId(orderId);
		for (int i = 0; i < productList.size(); i++) {
            int productId = productList.get(i);
            int quantity = quantityList.get(i);
            orderDetail.setProductId(productId);
            orderDetail.setQuantity(quantity);

            orderService.insertOrderDetail(orderDetail);
            
            //장바구니에서 해당 userId, productId 를 이용해서 삭제한다.
            Cart deleteCart = new Cart();
            deleteCart.setUserId(userId);
            deleteCart.setProductId(productId);
            cartService.deleteCart(deleteCart);
            
            Product thisProduct = new Product();
            thisProduct = productService.detailProduct(productId);
            int thisPrice = thisProduct.getProductPrice();
            totalPrice += thisPrice * quantity;
        }

		//받아온 사용한 적립금은 음수이므로 양수로 변환
		usedPoint = usedPoint*(-1);

		int addPoint =0;
		String grade = sessionUser.getUserGrade();
		//회원의 등급에 따라서 포인트를 차등 지급을한다.
		if(grade.equals("평민")) {
			addPoint = ((totalPrice-usedPoint)/100);
		}else if(grade.equals("귀족")) {
			addPoint = ((totalPrice-usedPoint)/50);
		}else if(grade.equals("왕족")) {
			addPoint = ((totalPrice-usedPoint)/25);
		}
		
		//사용한 만큼의 적립금을 차감 하고 동시에 적립금을 더해주자
		int beforeUserPoint = sessionUser.getUserPoint();
		int newUserPoint = beforeUserPoint-usedPoint+addPoint;
		User user = new User();
		user.setUserId(userId);
		user.setUserPoint(newUserPoint);
		userService.changeUserPoint(user);
		
		user = userService.getUserInfoById(userId);
		session.removeAttribute("login");
		session.setAttribute("login", user);
		
		return "redirect:/";
	}
	
	
	
}














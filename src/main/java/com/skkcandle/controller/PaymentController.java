package com.skkcandle.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
 * 
 * @author 김종진
 *
 */
@Slf4j
@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	Date today;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("")
	public String main(HttpSession session, Model model, @RequestParam(name="buyCartList",defaultValue="") List<Integer> buyCartList,@RequestParam(name="productId",defaultValue="0" ) int productId) { // 장바구니 or 상품상세페이지 끝나면 일로 상품정보+상품갯수 정보가 와야함
		log.info("일단 시작");
		//로그인 한 사람의 정보 
		User sessionUser = (User) session.getAttribute("login"); //추후에 login 이름으로 User 형식으로 세션에 setAttribute할거임(로그인할때)
		int userId = sessionUser.getUserId();
		
		//만약 장바구니에서 왔을경우
		if(buyCartList.size() != 0) {
			log.info("buyCartList : " +buyCartList);
			
			ArrayList<Integer> quantityList = new ArrayList<>();
			List<Product> productInfoList =  new ArrayList<>();
			// session의 userId 와 buyCartList의 productId 를 통해 Cart에서는 상품개수 , Product에서는 상품이름, 가격을 가져온다.
			for(Integer ProductID : buyCartList) {
				Cart cart = new Cart();
				cart.setUserId(userId);
				//Cart 에서 상품 개수 가져와서 리스트로 만들자.
				cart.setProductId(ProductID);
				log.info("상품 id : "+ ProductID);
				log.info("cart : "+ cart);
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
	//TRANSACTION NEEDED
	//여기 나중에  트랜젝션 해야한다. (주문이 성공해야 결재리스트에 올리고 , 장바구니에서 삭제가 되야함.)
	@RequestMapping("/payComplete")
	public String payComplete(HttpSession session, Model model, 
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
		
		log.info("결제 실행");
		log.info("productList : "+productList);
		log.info("quantityList : "+quantityList);
		
		User sessionUser = (User) session.getAttribute("login");
		int userId = sessionUser.getUserId();
		
		log.info("accountTransfer : " +accountTransfer);
		log.info("creditCard : " +creditCard);
		log.info("phone : " +phone);
		log.info("withoutBankbook : " +withoutBankbook);
		log.info("usedPoint : " +usedPoint);
		
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
		
		
		log.info("accountTransfer : " +accountTransfer);
		log.info("creditCard : " +creditCard);
		log.info("phone : " +phone);
		log.info("withoutBankbook : " +withoutBankbook);
		
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
		log.info("여기까진 괜춘0");
		
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
            log.info("여기까진 괜춘1");
            orderDetail.setProductId(productId);
            orderDetail.setQuantity(quantity);

            orderService.insertOrderDetail(orderDetail);
            log.info("여기까진 괜춘2");
            
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
		log.info("totalPrice : " +totalPrice);

		//받아온 사용한 적립금은 음수이므로 양수로 변환
		usedPoint = usedPoint*(-1);

		int addPoint =0;
		String grade = sessionUser.getUserGrade();
		log.info("grade : " +grade);
		//회원의 등급에 따라서 포인트를 차등 지급을한다.
		if(grade.equals("평민")) {
			addPoint = ((totalPrice-usedPoint)/100);
		}else if(grade.equals("귀족")) {
			addPoint = ((totalPrice-usedPoint)/50);
		}else if(grade.equals("왕족")) {
			addPoint = ((totalPrice-usedPoint)/25);
		}
		
		log.info("addPoint : " +addPoint);
		
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














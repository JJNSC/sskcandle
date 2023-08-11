package com.skkcandle.controller;

import java.util.List;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skkcandle.dto.Cart;
import com.skkcandle.dto.User;
import com.skkcandle.service.CartService;
import com.skkcandle.service.ProductService;
import com.skkcandle.service.UserService;
import com.skkcandle.service.UserService.LoginResult;

import lombok.extern.slf4j.Slf4j;


/**
 * Cart 관련 기능 처리 컨트롤러
 * 
 * 제품 장바구니에 담기,삭제,수량 수정 기능 제공
 * @author 조성진
 */


@Slf4j
@Controller
public class CartController {
	
	/**
	 * 의존성 주입
	 */
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
		
	/**
	 * 장바구니에 담은 후 '예'를 눌렀을시 장바구니 페이지로 가는 메소드
	 * 
	 * @param session 세션 객체 로그인한 유저의 정보
	 * @param model 모델 객체
	 * @param result 장바구니에 담을 제품의 수량
	 * @param productId 장바구니에 담을 제품의 정보
	 * @return CartController
	 */
	 @GetMapping("/cartList") 
	 public String addCart(HttpSession session, Model model, int result, int productId) {
		 User user = (User) session.getAttribute("login");
		 int userId = user.getUserId();	
		 /*
		 log.info("유저 번호" + userId);
		 log.info("제품 번호" + productId);
		 log.info("수량값" + result);
		 */
		 Cart cart = new Cart(); 
		 cart.setCount(result); //새로 장바구니에 추가한 수량값
		 cart.setProductId(productId);
		 cart.setUserId(userId);
		 
		 /*log.info("cart 내용물" + cart); */		 
		 int stockCart = cartService.countCart(cart);
		 
		 /*log.info("카트안의 수량" + stockCart);*/		 
		 if(stockCart == 1) {		 	
	 	 	cartService.updateCart(cart);
		 } else if(stockCart == 0) {
			 cartService.insertCart(cart);	 
		 }
		 return "redirect:/getCartList";  
	 }
	 
	 /**
	  * 장바구니에 담은 후 alert 에서 '아니오'를 눌렀을시 제품페이지로 돌아가는 메소드
	  * 
	  * @param cart cart 테이블에 담길 제품의 정보들(userId, productId, count(수량))
	  * @param session 로그인 정보
	  * @param result 수량 정보
	  * @param model 모델 객체
	  * @return prodcutDetail controller
	  */
	 
	 @GetMapping("/reProduct") 
	 public String reProduct(HttpSession session, int result, Model model, int productId) {
		 User user = (User) session.getAttribute("login");
		 int userId = user.getUserId();	
		 /*
		 log.info("유저 번호" + userId);
		 log.info("제품 번호" + productId);
		 log.info("수량값" + result);
		 */
		 Cart cart = new Cart(); 
		 cart.setCount(result); //새로 장바구니에 추가한 수량값
		 cart.setProductId(productId);
		 cart.setUserId(userId);
		 
		 /*log.info("cart 내용물" + cart); */		 
		 int stockCart = cartService.countCart(cart);
		 
		 /*log.info("카트안의 수량" + stockCart);*/		 
		 if(stockCart == 1) {		 	
	 	 	cartService.updateCart(cart);
		 } else if(stockCart == 0) {
			 cartService.insertCart(cart);	 
		 }
		 return "redirect:/productDetail";
	 }
	 
	 /**
	  * 장바구니 페이지를 보여주는 메소드
	  *  
	  * @param session 로그인 정보
	  * @param model
	  * @return cart.jsp
	  */
	 
	 @GetMapping("/getCartList")
	 public String getCartList(HttpSession session, Model model) {
		 
		 /*log.info("getCartList 실행되나?");*/		 
		 User user = (User) session.getAttribute("login");   
		 int userId = user.getUserId();	
		 
		 /*log.info("유저 번호" + userId);*/		 
		 
		 List<Cart> cartList = cartService.getCartList(userId);
		 model.addAttribute("cartList", cartList);
		 
		 /*log.info("user의 카트리스트" + cartList);*/		 
		 return "/cart/cart";
	 }
	 
	 @GetMapping("/delteList")
	 public String deleteCheckedCart(HttpSession session, Model model, @RequestParam List<Integer> checkedProductId) {
		 User user = (User) session.getAttribute("login");   
		 int userId = user.getUserId();
		 
		 log.info("userId" + userId);
		 log.info("지워질 productId들" + checkedProductId);
		 
		 int checkedProductCount = checkedProductId.size();
		 
		 
		 for(int i=0; i<checkedProductCount; i++) {
			 cartService.deleteCart(userId, checkedProductId);
		 }
		 
		 return "/redirect:/getCartList";
	 }
}


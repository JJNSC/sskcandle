package com.skkcandle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skkcandle.dto.Cart;
import com.skkcandle.dto.User;
import com.skkcandle.service.CartService;
import com.skkcandle.service.ProductService;
import com.skkcandle.service.UserService;
import com.skkcandle.service.UserService.LoginResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	
	
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
		
	 @GetMapping("/cartList") 
	 public String addCart(HttpSession session, HttpServletRequest request, Model model, int result, int productId) {
		 
		 User user = (User) session.getAttribute("login");
		 	   
		 int userId = user.getUserId();	
		 
		 log.info("유저 번호" + userId);
		 log.info("제품 번호" + productId);
		 log.info("수량값" + result);
		 
		 Cart cart = new Cart();
		 
		 cart.setCount(result); //새로 장바구니에 추가한 수량값
		 cart.setProductId(productId);
		 cart.setUserId(userId);
		 
		 log.info("cart 내용물" + cart);
		 
		 int stockCart = cartService.countCart(cart);
		 
		 log.info("카트안의 수량" + stockCart);
		 
		 if(stockCart == 1) {
			 	
	 	 	cartService.updateCart(cart);
			 	
		 } else if(stockCart == 0) {
				
			 cartService.insertCart(cart);	 
		 }

		 return "redirect:/getCartList"; //나중에 장바구니 가는 컨트롤러 만들면 그 맵핑주소값을 적자 
	 }
	 
	 @GetMapping("/reProduct") 
	   public String reProduct(Cart cart, HttpSession session, HttpServletRequest request, int result, Model model) {
		 log.info("되냥!?");
		 User user = (User) session.getAttribute("login");
		 int userId = user.getUserId(); 
		 
		 cart.setUserId(userId);
		 int productId = 1;
		 
		 log.info("취소한 유저 번호" + userId);
		 log.info("취소한 제품 번호" + productId);
		 log.info("취소한 이것도 안되나 보자" + result);
		 
		 cart.setCount(result);
		 cart.setProductId(productId);
		 cart.setUserId(userId);
		 
		 
		 log.info("취소한 cart 내용물" + cart);
		 
		 cartService.insertCart(cart);
	   
		 return "redirect:/productDetail";
	 }
	 
	 @GetMapping("/getCartList")
	 public String getCartList(HttpSession session, HttpServletRequest request, Model model) {
		 
		 log.info("getCartList 실행되나?");
		 User user = (User) session.getAttribute("login");
	 	    
		 int userId = user.getUserId();	
		 
		 log.info("유저 번호" + userId);
		 
		 
		 List<Cart> cartList = cartService.getCartList(userId);
		 model.addAttribute("cartList", cartList);
		 
		 log.info("user의 카트리스트" + cartList);
		 
		 return "/cart/cart";
	 }
}


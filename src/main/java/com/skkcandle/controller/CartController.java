package com.skkcandle.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skkcandle.dto.Cart;
import com.skkcandle.dto.User;
import com.skkcandle.service.CartService;
import com.skkcandle.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	
	
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	
	 @GetMapping("/cartList") 
	   public String addCart(Cart cart, HttpSession session, HttpServletRequest request, int result) {
		 log.info("되냥!?");
		 User user = (User) session.getAttribute("login");
		 	    
		 //int userId = user.getUserId(); :나중에 로그인시 userId 셋팅
 		 
		 int userId = 1;
		 int productId = 1;
		 
		 log.info("유저 번호" + userId);
		 log.info("제품 번호" + productId);
		 log.info("이것도 안되나 보자" + result);
		 
		 cart.setCount(result);
		 cart.setProductId(productId);
		 cart.setUserId(userId);
		 
		 log.info("cart 내용물" + cart);
		 
		 cartService.insertCart(cart);
	   
			 return "redirect:/productDetail";//나중에 장바구니 가는 컨트롤러 만들면 그 맵핑주소값을 적자 
	 }
	 
	 @GetMapping("/reProduct") 
	   public String reProduct(Cart cart, HttpSession session, HttpServletRequest request, int result) {
		 log.info("되냥!?");
		 User user = (User) session.getAttribute("login");
		 	    
		 //int userId = user.getUserId(); :나중에 로그인시 userId 셋팅
		 
		 int userId = 1;
		 int productId = 1;
		 String count = request.getParameter("result");
		 
		 log.info("유저 번호" + userId);
		 log.info("제품 번호" + productId);
		 log.info("제품 수량값" + count);
		 log.info("이것도 안되나 보자" + result);
		 
		 cart.setProductId(productId);
		 cart.setUserId(userId);
		 
	   
			 return "redirect:/productDetail";
	 }
}


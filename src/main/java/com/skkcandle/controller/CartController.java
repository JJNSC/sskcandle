package com.skkcandle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skkcandle.dto.Cart;
import com.skkcandle.dto.User;
import com.skkcandle.service.CartService;
import com.skkcandle.service.UserService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	
	 @PostMapping("/cartList") //post 방식의 writeBoard userWish 가 1이면 db에 값이 있음 없으면 o
	   public String addCart(Cart cart, HttpSession session) {
		 
		 User user = (User) session.getAttribute("login");
		 	    
		 //int userId = user.getUserId(); :나중에 로그인시 userId 셋팅
 		 
		 int userId = 1;
		 int productId = 1;
		 
		 cart.setProductId(productId);
		 cart.setUserId(userId);
		 
	   
			 return "/productDetail/detailView";
	 }
}


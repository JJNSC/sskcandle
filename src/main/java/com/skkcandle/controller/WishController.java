package com.skkcandle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.skkcandle.dto.Cart;
import com.skkcandle.dto.User;
import com.skkcandle.dto.Wish;
import com.skkcandle.service.UserService;
import com.skkcandle.service.WishService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 조성진
 * 
 * 찜기능
 *
 */

@Controller
@Slf4j
public class WishController {
	/**
	 * 의존성 주입
	 */
	@Autowired
	private WishService wishService;
	@Autowired
	private UserService userService;
	
	/**
	 * 
	 * @param session 로그인 정보
	 * @param productId 상품 정보
	 * @return rediect로 제품 상세 페이지로 가게 한다.
	 */
	@GetMapping("/updateWish")  
	public String clickWish(HttpSession session, int productId) {	 
		User user = (User) session.getAttribute("login");		 	    
		int userId = user.getUserId();		 

		 /*log.info("userid" + userId);
		 log.info("productId" + productId);*/
				 
		Wish wish = new Wish();

		wish.setProductId(productId);
		wish.setUserId(userId);
					
		int wishNo =  wishService.selectWish(wish);
			
		if (wishNo == 0) { //카운팅한 wish테이블의 정보가 0 이라면 insert
			wishService.add(wish);
		} else { //카운팅한 wish 테이블의 정보가 1이라면 delete
			wishService.remove(wish);
		}	   
		return "redirect:/productDetail";
	}
	
}

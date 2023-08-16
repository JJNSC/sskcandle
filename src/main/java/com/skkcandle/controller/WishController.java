package com.skkcandle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	/*@GetMapping("/updateWish")  
	@ResponseBody
	public int clickWish(HttpSession session, int productId) {	 
		User user = (User) session.getAttribute("login");		 	    
		int userId = user.getUserId();		 

		log.info("userid" + userId);
		log.info("productId" + productId);
				 
		Wish wish = new Wish();

		wish.setProductId(productId);
		wish.setUserId(userId);
		
		int wishNo =  wishService.selectWish(wish);
			
		int result ;
		if (wishNo == 0) { //카운팅한 wish테이블의 정보가 0 이라면 insert
			wishService.add(wish);
			result = 1;
		} else { //카운팅한 wish 테이블의 정보가 1이라면 delete
			wishService.remove(wish);
			result = 0;
		}	   
		log.info("result : "+ result);
		return result;
	}*/
	@ResponseBody
	@PostMapping("/changeWish")  
	public String changeWish(HttpSession session, int productId) {	 
		User user = (User) session.getAttribute("login");		 	    
		int userId = user.getUserId();		 

		log.info("userid" + userId);
		log.info("productId" + productId);
				 
		Wish wish = new Wish();

		wish.setProductId(productId);
		wish.setUserId(userId);
		
		int wishNo =  wishService.selectWish(wish);
			
		String result;
		if (wishNo == 0) { //카운팅한 wish테이블의 정보가 0 이라면 insert
			wishService.add(wish);
			result = "add success";
		} else { //카운팅한 wish 테이블의 정보가 1이라면 delete
			wishService.remove(wish);
			result = null;
		}	   
		log.info("result : "+ result);
		return result;
	}
	/*
	@GetMapping("/selectWish")
	public String selectWish(HttpSession session, int productId, Model model) {
	    User user = (User) session.getAttribute("login");		 	    
	    int userId = user.getUserId();
	    
	    Wish wish = new Wish();
	    wish.setProductId(productId);
	    wish.setUserId(userId);

	    int wishNo = wishService.selectWish(wish);
	    
	    model.addAttribute("isWished", wishNo == 1);

	    log.info("userId" + userId);
	    log.info("찜한 상품 번호" + productId);
	    log.info("상품 찜 여부" + wishNo);
	    
	    return "/productDetail/detailView";
	}*/
}

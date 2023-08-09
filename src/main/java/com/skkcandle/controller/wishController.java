package com.skkcandle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.skkcandle.dto.User;
import com.skkcandle.dto.Wish;
import com.skkcandle.service.UserService;
import com.skkcandle.service.WishService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class wishController {
	
	@Autowired
	private WishService wishService;
	
	@Autowired
	private UserService userService;
	
	 @GetMapping("/updateWish") //post 방식의 writeBoard userWish 가 1이면 db에 값이 있음 없으면 o
	   public String addWish(Wish wish, HttpSession session) {
		 
		 User user = (User) session.getAttribute("login");
		 	    
/*		 int userId = user.getUserId();
 * 
*/		 
		 int userId = 1;
		 int productId = 1;
		 
		 wish.setProductId(productId);
		 wish.setUserId(userId);
					
			int wishNo =  wishService.selectWish(wish);
			
			 if (wishNo == 0) { //카운팅한 wish테이블의 정보가 0 이라면 insert
				 	wishService.add(wish);
			    } else { //카운팅한 wish 테이블의 정보가 1이라면 delete
			    	wishService.remove(wish);
			    }
	   
			 return "/productDetail/detailView";
	 }
}

	     

	      
	
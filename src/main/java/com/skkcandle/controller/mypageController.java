package com.skkcandle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skkcandle.dto.Review;
import com.skkcandle.dto.User;
import com.skkcandle.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class mypageController {
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("/mypage")
	public String mypage(@RequestParam(name="subpage", defaultValue="myinfo") String subpage, Model model , HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		log.info("subpage : " + subpage);
		model.addAttribute("subpage", subpage);
		
		//내정보 확인/수정 페이지
		if(subpage.equals("myinfo")) {
			User user = (User) session.getAttribute("login");
			model.addAttribute("userinfo", user);
			
		}else if(subpage.equals("myshoppinglist")) {
			
			
		}else if(subpage.equals("myreviewlist")) {
			User user = (User) session.getAttribute("login");
			int userID = user.getUserId();
			List<Review> reviewList = reviewService.selectReviewByUserId(userID);
			model.addAttribute("myreview", reviewList);
		}
		
		return "mypage/mypage";
	}
}

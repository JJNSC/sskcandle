package com.skkcandle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.skkcandle.dto.Review;
import com.skkcandle.dto.User;
import com.skkcandle.service.ReviewService;
import com.skkcandle.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class mypageController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private UserService userService;

	@RequestMapping("/mypage")
	public String mypage(@RequestParam(name="subpage", defaultValue="myinfo") String subpage, Model model , HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		log.info("subpage : " + subpage);
		model.addAttribute("subpage", subpage);
		
		User user = (User) session.getAttribute("login");
		model.addAttribute("userinfo", user);
		
		//내정보 확인/수정 페이지
		if(subpage.equals("myinfo")) {
			
			
		}else if(subpage.equals("myshoppinglist")) {
			
			
		}else if(subpage.equals("myreviewlist")) {
			user = (User) session.getAttribute("login");
			int userID = user.getUserId();
			List<Review> reviewList = reviewService.selectReviewByUserId(userID);
			model.addAttribute("myreview", reviewList);
		}
		
		return "mypage/mypage";
	}
	
	//이미지 업로드 테스트 
	@PostMapping("/imageTest")
	public String imageTest(User user, HttpSession session) throws IOException {
		log.info("battach : "+ user.getBattach() );
		MultipartFile mf = user.getBattach(); 
		User me = (User) session.getAttribute("login");
		
		me.setUserAttachType(mf.getContentType());
		me.setUserImageData(mf.getBytes());
		
		userService.updateUserImage(me);
		
		return "redirect:/mypage";
	}
}

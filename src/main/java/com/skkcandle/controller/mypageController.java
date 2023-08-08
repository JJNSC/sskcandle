package com.skkcandle.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import com.skkcandle.service.UserService.LoginResult;

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
		
		if(user.getUserImageData()!=null) {
			String base64Img = Base64.getEncoder().encodeToString(user.getUserImageData());
			model.addAttribute("base64Img", base64Img);
		}
		
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
	
	//이미지 업로드 테스트 -> 회원 정보수정
	@PostMapping("/updateMyInfo")
	public String imageTest(User user, HttpSession session) throws IOException {
		//이미지 저장
		log.info("battach : "+ user.getBattach() );
		MultipartFile mf = user.getBattach(); 
		log.info("길이 : "+mf.getBytes().length);
		
		//새로운 이미지가 있으면 업데이트
		if(mf.getBytes().length != 0 ) {
			user.setUserAttachType(mf.getContentType());
			user.setUserImageData(mf.getBytes());
			userService.updateUserImage(user);
		}
		log.info("내가 입력한 비밀번호 : "+user.getUserPassword());
		//비밀번호 수정 O
		if(!user.getUserPassword().equals("")) {
			PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			user.setUserPassword(pwEncoder.encode(user.getUserPassword()));
			userService.updateUserInfo(user);
		// 비밀번호 수정 X
		}else if(user.getUserPassword().equals("")) {
			userService.updateUserInfoNoPW(user);
		}
		
		//db정보 받아오기
		User dbUser = userService.getUserInfoById(user.getUserId());
		session.setAttribute("login", dbUser);
		
		
		return "redirect:/mypage";
	}
	
	@RequestMapping("/userInfoCheck")
	public String userInfoCheck() {
		
		return "userInfoCheck";
	}
}















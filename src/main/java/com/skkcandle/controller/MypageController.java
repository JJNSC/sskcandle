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

import com.skkcandle.dto.BuyList;
import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Review;
import com.skkcandle.dto.User;
import com.skkcandle.dto.WishList;
import com.skkcandle.service.OrderService;
import com.skkcandle.service.ReviewService;
import com.skkcandle.service.UserService;
import com.skkcandle.service.UserService.WithdrawResult;
import com.skkcandle.service.WishService;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 김종진
 *
 */
@Slf4j
@Controller
public class MypageController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private WishService wishService;

	@RequestMapping("/mypage")
	public String mypage(String shoppingPageNo, @RequestParam(name="subpage", defaultValue="myshoppinglist") String subpage, Model model ,String errMsg,
						HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		log.info("subpage : " + subpage);
		model.addAttribute("subpage", subpage);
		
		User user = (User) session.getAttribute("login");
		model.addAttribute("userinfo", user);
		
		if(user.getUserImageData()!=null) {
			String base64Img = Base64.getEncoder().encodeToString(user.getUserImageData());
			model.addAttribute("base64Img", base64Img);
		}
		
		//내정보 확인/수정 페이지
		if(subpage.equals("myinfocheck")) {
			model.addAttribute("errMsg", errMsg);
			
		//내 구매 리스트 페이지	
		}else if(subpage.equals("myshoppinglist")) {
			log.info("shoppingPageNo : "+shoppingPageNo );
			// 브라우저에서 pageNo가 넘어오지 않았을 경우
			if (shoppingPageNo == null) {
				// 세션에 저장되어 있는지 확인
				shoppingPageNo = (String) session.getAttribute("pageNo");
				if (shoppingPageNo == null) {
					// 저장되어 있지 않다면 1로 초기화
					shoppingPageNo = "1";
				}
			}
			// 문자열로 정수를 변환
			int intpageNo = Integer.parseInt(shoppingPageNo);
			// 세션에 pageNo를 저장
			session.setAttribute("pageNo", String.valueOf(shoppingPageNo));
			
			int userId = user.getUserId();

			//페이징
			int totalBoardNum = orderService.getOrderCount(userId);
			Pager pager = new Pager(3, 5, totalBoardNum, intpageNo);
			
			//구매 리스트 가져오기전에 pager에 userId 세팅하기 
			pager.setUserId(userId);
			
			List<BuyList> orderList = orderService.getBuyList(pager);
			
			model.addAttribute("pager", pager);
			model.addAttribute("orderList", orderList);
			
		//내 리뷰 리스트	
		}else if(subpage.equals("myreviewlist")) {
			user = (User) session.getAttribute("login");
			int userId = user.getUserId();
			List<Review> reviewList = reviewService.selectReviewByUserId(userId);
			model.addAttribute("myreview", reviewList);
		
		//내 찜 목록
		}else if(subpage.equals("mywishlist")) {
			user = (User) session.getAttribute("login");
			int userId = user.getUserId();
			List<WishList> wishList = wishService.getWishList(userId);
			model.addAttribute("wishLists", wishList);
		
		//회원 탈퇴 
		}else if(subpage.equals("withdraw")) {
			log.info(errMsg);
			model.addAttribute("errMsg", errMsg);
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
	
	@PostMapping("/myInfoCheck")
	public String myInfoCheck(User user, HttpSession session, Model model) {
		
		User sessionUser = (User) session.getAttribute("login");
		
		String errMsg ="";
		String subpage="";
		WithdrawResult result = userService.withdraw(sessionUser, user);
		log.info("결과 : " + result);
		if(result == WithdrawResult.FAIL_EMAIL_WRONG) {
			errMsg="이메일 주소를 잘못 입력하였습니다.";
			subpage="myinfocheck";
		}else if(result == WithdrawResult.FAIL_PASSWORD_WRONG) {
			errMsg="비밀번호를 잘못 입력하였습니다.";
			subpage="myinfocheck";
		}else if(result == WithdrawResult.SUCCESS) {
			subpage="myinfo";
		}
		
		model.addAttribute("errMsg", errMsg);
		model.addAttribute("subpage", subpage);
		return "redirect:/mypage";
		
	}
}















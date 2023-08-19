package com.skkcandle.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.ProductReview;
import com.skkcandle.dto.Review;
import com.skkcandle.dto.User;
import com.skkcandle.service.ReviewService;
import com.skkcandle.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ReviewController {
	
	 @Autowired
	 private ReviewService reviewService;
	 @Autowired
	 private UserService userService;
	 
//	 @ResponseBody
	 @GetMapping("/getReviewList")
	 public List<ProductReview> getReview(int productId, int page) {
	     int totalReviewNum = reviewService.getReviewNum(productId);
	     Pager pager = new Pager(5, 5, totalReviewNum, page);
	     pager.setProductId(productId);

	     List<Review> reviewList = reviewService.getListReviewNew(pager);
	     List<ProductReview> productReviewList = new ArrayList<>();

	     for (Review oneReview : reviewList) {
	         ProductReview productReview = new ProductReview(); // 각 리뷰 정보를 저장할 객체 생성

	         int writerId = oneReview.getUserId();
	         User userInfo = userService.getUserInfoById(writerId);

	         if (userInfo != null && userInfo.getUserImageData() != null) {
	             String base64Img = Base64.getEncoder().encodeToString(userInfo.getUserImageData());
	             userInfo.setBase64Image(base64Img);
	         }

	         productReview.setUserName(userInfo.getUserName());
	         productReview.setBase64Image(userInfo.getBase64Image());
	         productReview.setReviewTitle(oneReview.getReviewTitle());
	         productReview.setReviewDate(oneReview.getReviewDate());
	         productReview.setRatingScore(oneReview.getRatingScore());
	         productReview.setReviewContent(oneReview.getReviewContent());

	         productReviewList.add(productReview); // 생성한 객체를 리스트에 추가
	     }

	     return productReviewList;
	 }
}







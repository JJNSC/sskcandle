package com.skkcandle.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Product;
import com.skkcandle.dto.ProductImages;
import com.skkcandle.dto.Review;
import com.skkcandle.dto.User;
import com.skkcandle.dto.Wish;
import com.skkcandle.service.ProductImagesService;
import com.skkcandle.service.ProductService;
import com.skkcandle.service.ReviewService;
import com.skkcandle.service.UserService;
import com.skkcandle.service.WishService;

import lombok.extern.slf4j.Slf4j;


/**
 * 
 * 제품 상세 페이지 기능
 * 리뷰,이미지 등등 여러 요소들을 가져온다
 *@author 조성진
 */
@Slf4j
@Controller
public class ProductController {
	
	/**
	 * 의존성 주입
	 */
    @Autowired
    private ProductService ProductService;
    @Autowired
    private ReviewService ReviewService;
    @Autowired
    private ProductImagesService ProductImagesService;
    @Autowired
    private WishService WishService;
    @Autowired
    private UserService userService;
	   
	@RequestMapping("/productDetail")
	public String detailProduct(String pageNo, HttpSession session, Model model, int productId) {

		Product product = ProductService.detailProduct(productId);
		model.addAttribute("detailproduct", product);
		
		List<Review> review = ReviewService.selectReview(productId);
		model.addAttribute("productreviews", review);
			
		int reviewNum = ReviewService.getReviewNum(productId);
		model.addAttribute("totalReviewNum", reviewNum);
		
		ProductImages productDetail = ProductImagesService.detailImage(productId); //상품 대표이미지
		model.addAttribute("productDetailPicture", productDetail);
	
		if(productDetail.getProductImage() !=null) {
			String base64Img = Base64.getEncoder().encodeToString(productDetail.getProductImage());
			model.addAttribute("base64Img", base64Img);
		}
		
		ProductImages productThumbnail = ProductImagesService.thumbnailImage(productId); //상품 상세이미지
		model.addAttribute("productThumbnailPicture", productThumbnail);

		if(productThumbnail.getProductImage() !=null) {
			String base64Img = Base64.getEncoder().encodeToString(productThumbnail.getProductImage());
			model.addAttribute("base64Thb", base64Img);
		}  
		
		//브라우저에서 pageNo가 넘어오지않은 경우 
	      if(pageNo == null) {
	         //세선에 저장되어있는지 확인
	         pageNo = (String) session.getAttribute("pageNo");
	         if(pageNo == null) {
	            //저장되어 있지않다면 "1" 로 초기화
	            pageNo = "1";
	         }
	      }
	      //문자열을 정수로 변환
	      int intPageNo = Integer.parseInt(pageNo);
	      //세션에 pageNo를 저장
	      session.setAttribute("pageNo", String.valueOf(pageNo));
	      
	      //int totalRows = boardDao.count();//전체 게시물 수
	      int totalReviewNum = ReviewService.getReviewNum(productId);
	      Pager pager = new Pager(5,5,totalReviewNum,intPageNo);
	      pager.setProductId(productId);
	       
	      model.addAttribute("pager", pager);
	      
	      // 찜 상태 확인 및 넘겨주기
	      User user = (User) session.getAttribute("login");
	      int userId;
	      if (user != null) {
	          userId = user.getUserId();
	      } else {
	          userId = 0;
	      }

	      Wish wish = new Wish();
	      wish.setProductId(productId);
	      wish.setUserId(userId);

	      int wishNo = WishService.selectWish(wish);
	      boolean isWished = wishNo == 1;

	      model.addAttribute("isWished", isWished);
	      
	      //리뷰 불러오기
	      List<Review> reviewList = ReviewService.getListReviewNew(pager); //해당 상품에 대한 리뷰리스트
	      session.setAttribute("reviewOrderBy", "new");
	      
	      List<User> userList = new ArrayList<>();
	      
	      for(Review oneReview : reviewList) {
	    	  int writerId = oneReview.getUserId();
	    	  User userInfo = userService.getUserInfoById(writerId);
	    	  
	    	  if (userInfo != null && userInfo.getUserImageData() != null) {
	    	  String base64Img = Base64.getEncoder().encodeToString(userInfo.getUserImageData());	    	  
	    	  userInfo.setBase64Image(base64Img);
	    	  } 
	    	  userList.add(userInfo);
	      }
	      
	      model.addAttribute("userList", userList);
	      model.addAttribute("reviewList", reviewList);
	  
		return "/productDetail/detailView";
	}	
}


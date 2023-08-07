package com.skkcandle.controller;

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
import com.skkcandle.service.ProductImagesService;
import com.skkcandle.service.ProductService;
import com.skkcandle.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/productDetail")
public class productController {
	
    @Autowired
    private ProductService ProductService;
    @Autowired
    private ReviewService ReviewService;
    @Autowired
    private ProductImagesService ProductImagesService;
	   
	@RequestMapping("/productDetail")
	public String detailProduct(String pageNo, Model model, HttpSession session) {
		int productId = 1;
		log.info("제품번호" + productId);
		Product product = ProductService.detailProduct(productId);
		model.addAttribute("detailproduct", product);
		
		List<Review> review = ReviewService.selectReview(productId);
		model.addAttribute("productreviews", review);
			
		int reviewNum = ReviewService.getTotalReviewNum(productId);
		model.addAttribute("totalReviewNum", reviewNum);
		
		ProductImages productDetail = ProductImagesService.detailImage(productId);
		model.addAttribute("productDetailPicture", productDetail);

		if(productDetail.getProductImage() !=null) {
			String base64Img = Base64.getEncoder().encodeToString(productDetail.getProductImage());
			model.addAttribute("base64Img", base64Img);
		}
		
		ProductImages productThumbnail = ProductImagesService.thumbnailImage(productId);
		model.addAttribute("productThumbnailPicture", productThumbnail);

		if(productThumbnail.getProductImage() !=null) {
			String base64Img = Base64.getEncoder().encodeToString(productThumbnail.getProductImage());
			model.addAttribute("base64Thb", base64Img);
		}
	      
		return "/productDetail/detailView";
		
	}
	
/*	@RequestMapping("/productDetail")
	public String prodcutReview(Model model) {
		int productId = 1;
		List<Review> review = ReviewService.selectReview(productId);
		model.addAttribute("productviews", review);
		
		return "/productDetail/detailView";
	}*/

	
	/*
	
	   @GetMapping("/detailProduct")
	   public String detailProduct(int bno, Model model) {
	      Ch13Board board = boardService.getBoard(bno); //서비스를 거친후 리턴 값을 board에다 담아준다
	      model.addAttribute("board", board); //jsp에 뿌려주기 위해서 model 객체에 담는다.
	      
	      if(board.getBattachdata() != null) { //보드에 모든 값들이 들어가 있다.
	    	  //0과 1로 구성된 바이너리 데이터를 base64 문자열로 변환
	    	  String base64Img = Base64.getEncoder().encodeToString(board.getBattachdata());
	    	  model.addAttribute("base64Img", base64Img);
	    	  
	      }
	      
	      return "ch13/detailBoard";
	   }*/

	
}


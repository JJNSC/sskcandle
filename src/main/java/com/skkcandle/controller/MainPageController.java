package com.skkcandle.controller;

import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skkcandle.dto.MainPage;
import com.skkcandle.dto.ProductList;
import com.skkcandle.service.MainPageService;
import com.skkcandle.service.ProductListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainPageController {
	
	@Resource
	private ProductListService productListService;
	
	@Resource
	private MainPageService mainPageService;
	
	/**
	 * '/mainPage' 경로로 들어오는 요청을 처리
	 * @return mainPage.jsp 페이지로 이동
	 */
	
	@RequestMapping("/")
	public String index(Model model) {
		String searchWord=null;
		List<ProductList> productList = productListService.getProductList(searchWord);
		List<MainPage> reviewSortProductList = mainPageService.getProductListByReviewCount();
		
		for (ProductList product : productList) {
            byte[] imageBytes = product.getProductImage();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            product.setBase64Image(base64Image);
        }
		
		for (MainPage reviewSortProduct : reviewSortProductList) {
            byte[] imageBytes = reviewSortProduct.getProductImage();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            reviewSortProduct.setBase64Image(base64Image);
        }
		
		model.addAttribute("product", productList);
		model.addAttribute("reviewSortProduct", reviewSortProductList);
		return "index";
	}
	
	
	
}

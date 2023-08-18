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

@Controller
public class HomeController {
	
	@Resource
	private ProductListService productListService;

	@Resource
	private MainPageService mainPageService;
	
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
	
	@RequestMapping("/500")
	public String exception500() {
		throw new RuntimeException();
	}
	
	@RequestMapping("/header")
	public String header() {
		return "header";
	}
	
	@RequestMapping("/newHeader")
	public String newHeader() {
		return "newHeader";
	}
	
}

package com.skkcandle.controller;

import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skkcandle.dto.ProductList;
import com.skkcandle.service.ProductListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainPageController {
	
	/*@Resource
	private ProductListService productListService;
	
	*//**
	 * '/mainPage' 경로로 들어오는 요청을 처리
	 * @return mainPage.jsp 페이지로 이동
	 *//*
	@RequestMapping("/mainPage")
	public String productListPage(Model model) {
		List<ProductList> productList = productListService.getProductList();
		
		for (ProductList product : productList) {
            byte[] imageBytes = product.getProductImage();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            product.setBase64Image(base64Image);
        }
		
		model.addAttribute("product", productList);
		return "mainPage/mainPage";
	}*/
	
	
	
	
}

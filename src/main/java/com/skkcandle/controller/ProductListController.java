package com.skkcandle.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skkcandle.dto.ProductList;
import com.skkcandle.service.ProductListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductListController {
	
	@Resource
	private ProductListService productListService;
	
	/**
	 * '/productListPage' 경로로 들어오는 요청을 처리
	 * @return productListPage.jsp 페이지로 이동
	 */
	@RequestMapping("/productList")
	public String productListPage(Model model,
								@RequestParam(name="searchWord", required=false) String searchWord) {
		log.info("searchWord : " + searchWord);
		List<ProductList> productList = new ArrayList<>();
		if(searchWord.equals(null)) {
			productList = productListService.getProductList();
		}else {
			productList = productListService.getProductListBySearchWord(searchWord);
		}
		
		for (ProductList product : productList) {
            byte[] imageBytes = product.getProductImage();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            product.setBase64Image(base64Image);
        }
		
		model.addAttribute("product", productList);
		return "productList/productList";
	}
	
	
	
	
}
	
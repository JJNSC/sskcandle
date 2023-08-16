package com.skkcandle.controller;

import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skkcandle.dto.ProductList;
import com.skkcandle.service.ProductListService;

@Controller
public class HomeController {
	
	@Resource
	private ProductListService productListService;

	@RequestMapping("/")
	public String index(Model model) {
		List<ProductList> productList = productListService.getProductList();
		
		for (ProductList product : productList) {
            byte[] imageBytes = product.getProductImage();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            product.setBase64Image(base64Image);
        }
		
		model.addAttribute("product", productList);
		return "index";
	}
	
	@RequestMapping("/500")
	public String exception500() {
		throw new RuntimeException();
	}
	
	/*@RequestMapping("/502")
	public String exception502() {
		throw new BadGatewayException();
	}*/
	
	@RequestMapping("/header")
	public String header() {
		return "header";
	}
	
	@RequestMapping("/newHeader")
	public String newHeader() {
		return "newHeader";
	}
	
	
}

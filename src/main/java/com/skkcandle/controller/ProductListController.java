package com.skkcandle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductListController {
	/**
	 * '/productListPage' 경로로 들어오는 요청을 처리
	 * @return productListPage.jsp 페이지로 이동
	 */
	@RequestMapping("/productList")
	public String productListPage() {
		return "productList/productList";
	}
	
	
}

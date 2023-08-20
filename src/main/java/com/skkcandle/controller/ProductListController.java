package com.skkcandle.controller;

import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skkcandle.dto.Pager;
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
	public String productListPage(Model model,HttpSession session ,
								@RequestParam(name="pageNo", required=false)String pageNo, 
								@RequestParam(name="searchWord", required=false) String searchWord) {
		if (pageNo == null) {
			// 세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("productListPageNo");
			if (pageNo == null) {
				// 저장되어 있지 않다면 1로 초기화
				pageNo = "1";
			}
		}
		log.info("pageNo : "+pageNo);
		int intpageNo = Integer.parseInt(pageNo);
		session.setAttribute("productListPageNo", String.valueOf(intpageNo));
		
		int totalBoardNum = productListService.getTotalProductNumber();
		log.info("총 상품개수 : "+ totalBoardNum);
		Pager pager = new Pager(12, 5, totalBoardNum, intpageNo);
		//페이저에 검색어 세팅
		pager.setSearchWord(searchWord);
		log.info("searchWord : "+ searchWord);
		
		List<ProductList> productList = productListService.selectByProductIdPager(pager);
		log.info("여긴 되나: ");
		
		for (ProductList product : productList) {
            byte[] imageBytes = product.getProductImage();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            product.setBase64Image(base64Image);
        }
		if(totalBoardNum <= 12) {
			model.addAttribute("noPaging", 1);
		}
		
		model.addAttribute("pager", pager);
		model.addAttribute("product", productList);
		return "productList/productList";
	}
	
	
	
	
}
	
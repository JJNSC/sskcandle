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
/**
 * 상품 목록 페이지 관련 기능 처리 컨트롤러
 * 
 * 상품 목록 조회, 검색어를 통한 검색기능 제공
 * @author 김상규 김종진
 *
 */
@Controller
@Slf4j
public class ProductListController {
	/**
	 * 의존성 주입
	 */
	@Resource
	private ProductListService productListService;

	/**
	 * '/productListPage' 경로로 들어오는 요청을 처리
	 * 
	 * searchWord(검색어) 가 없을 경우 모든 상품들을 페이징 처리하여 해당 페이지의 상품들을 화면에 출력 
	 * searchWord(검색어) 가 있을 경우 해당 검색어가 포함된 상품 또는 회사의 상품들을 페이징 처리하여 화면에 출력	
	 * @param model			페이져 정보, 상품 정보를 담는 model 객체 
	 * @param session		페이지 번호를 받아오기 위한 session 객체 
	 * @param pageNo		페이징을 위한 현재 페이지
	 * @param searchWord	검색어
	 * @return				productListPage.jsp 페이지로 이동
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
		int intpageNo = Integer.parseInt(pageNo);
		session.setAttribute("productListPageNo", String.valueOf(intpageNo));
		
		int totalBoardNum = productListService.getTotalProductNumber();
		Pager pager = new Pager(12, 5, totalBoardNum, intpageNo);
		//페이저에 검색어 세팅
		pager.setSearchWord(searchWord);
		
		List<ProductList> productList = productListService.selectByProductIdPager(pager);
		
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
	
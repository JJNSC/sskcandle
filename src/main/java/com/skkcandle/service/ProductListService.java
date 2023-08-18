package com.skkcandle.service;

import java.util.List;

import com.skkcandle.dto.ProductList;

public interface ProductListService {
	public List<ProductList> getProductList();
	public List<ProductList> getProductListBySearchWord(String searchWord);
	public List<ProductList> getProductListByReviewCount();	

}

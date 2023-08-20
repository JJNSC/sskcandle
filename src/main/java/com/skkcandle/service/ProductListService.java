package com.skkcandle.service;

import java.util.List;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.ProductList;

public interface ProductListService {
	public List<ProductList> getProductList(String searchWord);
	public List<ProductList> selectByProductIdPager(Pager pager);
	public List<ProductList> getProductListByReviewCount();	
	public int getTotalProductNumber();
}

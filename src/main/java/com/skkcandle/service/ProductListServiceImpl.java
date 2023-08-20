package com.skkcandle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.ProductListDao;
import com.skkcandle.dto.Pager;
import com.skkcandle.dto.ProductList;

@Service
public class ProductListServiceImpl implements ProductListService {
	
	@Autowired
    private ProductListDao productListDao;
	
	@Override
	public List<ProductList> getProductList(String searchWord) {
		List<ProductList> productList = productListDao.selectByProductId(searchWord);
		return productList;
	}

	@Override
	public List<ProductList> getProductListByReviewCount() {
		List<ProductList> productList = productListDao.getProductListByReviewCount();
		return productList;
	}

	@Override
	public int getTotalProductNumber() {
		int totalNumber = productListDao.getTotalProductNumber();
		return totalNumber;
	}

	@Override
	public List<ProductList> selectByProductIdPager(Pager pager) {
		List<ProductList> productList = productListDao.selectByProductIdPager(pager);
		return productList;
	}

}

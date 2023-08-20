package com.skkcandle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.ProductList;

@Mapper
public interface ProductListDao {
	public List<ProductList> selectByProductId(String searchWord);
	public List<ProductList> selectByProductIdPager(Pager pager);
	public List<ProductList> getProductListByReviewCount();	
	public int getTotalProductNumber();
}

package com.skkcandle.dao;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.ProductList;

@Mapper
public interface ProductListDao {
	public ProductList selectByProductId(int productId);
}

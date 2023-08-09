package com.skkcandle.dao;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.Product;

@Mapper
public interface ProductDao {
	
	public Product selectDetailProduct(int productId);	

}

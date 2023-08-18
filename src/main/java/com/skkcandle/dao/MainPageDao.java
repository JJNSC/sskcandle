package com.skkcandle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.MainPage;
import com.skkcandle.dto.ProductList;

@Mapper
public interface MainPageDao {
	public List<MainPage> getProductListByReviewCount();	
}

package com.skkcandle.dao;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.ProductImages;

@Mapper
public interface productImagesDao {

	public ProductImages selectDetailPicture(int productId);
	
}

package com.skkcandle.dao;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.ProductImages;

@Mapper
public interface ProductImagesDao {

	public ProductImages selectDetailPicture(int productId);
	public ProductImages selectThumbnailPicture(int productId);
	
}

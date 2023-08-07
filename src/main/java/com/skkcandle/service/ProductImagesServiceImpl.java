package com.skkcandle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.productImagesDao;
import com.skkcandle.dto.ProductImages;

@Service
public class ProductImagesServiceImpl implements ProductImagesService {

	@Autowired
	private productImagesDao productImagesDao;
	
	@Override
	public ProductImages detailImage(int productId) {
		ProductImages detailImage = productImagesDao.selectDetailPicture(productId);
		return detailImage;
	}

}

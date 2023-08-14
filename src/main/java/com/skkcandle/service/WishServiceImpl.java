package com.skkcandle.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.ProductDao;
import com.skkcandle.dao.ProductImagesDao;
import com.skkcandle.dao.WishDao;
import com.skkcandle.dto.Product;
import com.skkcandle.dto.ProductImages;
import com.skkcandle.dto.Wish;
import com.skkcandle.dto.WishList;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 조성진 김종진
 *
 */
@Slf4j
@Service
public class WishServiceImpl implements WishService {
	@Autowired
	private WishDao wishDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductImagesDao productImagesDao;
		
	@Override
	public void remove(Wish wish) {
	  wishDao.delete(wish); //int를 반환해야 하므로 return값에서 mapper의 메소드를 호출한다.
	}

	@Override
	public void add(Wish wish) {
		wishDao.insert(wish);
	}

	@Override
	public int selectWish(Wish wish) {
		 int userWish = wishDao.selectWish(wish);
		return userWish;
	}

	@Override
	public List<WishList> getWishList(int userId) {
		ArrayList<Integer> productNos = wishDao.getWishNo(userId);
		log.info("내가 찜한 상품아이디들 : "+productNos);
		//찜목록의 상품정보, 이미지들이 들어갈 공간
		List<WishList> wishLists =new ArrayList<>();
		for(Integer productId : productNos) {
			log.info("찜한 상품아이디 : "+productNos);
			WishList wishList = new WishList();
			//상품 아이디로 여기서 이미지인코딩해서 넣고 , 상품정보들 넣자 
			Product product = productDao.selectDetailProduct(productId);
			wishList.setProduct(product);
			ProductImages productImage =productImagesDao.selectThumbnailPicture(productId);
			if (productImage != null && productImage.getProductImage() != null) {
	            String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImage());
	            productImage.setBase64Image(base64Img);
	            wishList.setProductImages(productImage);
	        }
			wishLists.add(wishList);
		}
		return wishLists;
	}	
}

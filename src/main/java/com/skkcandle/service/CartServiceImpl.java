package com.skkcandle.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.CartDao;
import com.skkcandle.dao.ProductDao;
import com.skkcandle.dao.ProductImagesDao;
import com.skkcandle.dto.Cart;
import com.skkcandle.dto.CartList;
import com.skkcandle.dto.Product;
import com.skkcandle.dto.ProductImages;

import lombok.extern.slf4j.Slf4j;


/**
 * 
 * @author 조성진, 김종진
 * 
 *insertCart cart에 productId,userId,count를 insert
 *getCartList  cart담긴 데이터를 보여줌
 *updateCart cart 제품 수량 변경
 *countCart cart에 같은 productId 의 상품이 담겨있는지 파악
 */

@Slf4j
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao CartDao;
	@Autowired
	private ProductDao ProductDao;
	@Autowired
	private ProductImagesDao productImagesDao;
	
	@Override
	public void insertCart(Cart cart) {
		CartDao.insert(cart);
	}

	@Override
	public List<CartList> getCartList(int userId) { // userId로 누구의 카트인지 파악		
		
		List<CartList> cartList = new ArrayList<>(); //
		CartList cartListItem = new CartList(); // 한번에 담길 제품의 정보들

	
		ArrayList<Integer> productIdList = new ArrayList<>();
		productIdList = CartDao.getListCart(userId);
		
		List<ProductImages> ProductImages = new ArrayList<>(); //상품의 이미지
		List<Product> ProductInfo = new ArrayList<>(); //상품의 정보들
		ArrayList<Integer> Quantity = new ArrayList<>(); //상품의 수량
		
		for(Integer productId : productIdList) {
						
			Product product = ProductDao.selectDetailProduct(productId);
			ProductInfo.add(product); //prodcutInfo 에 product 정보들이 들어간다
			/*
			ProductImages image = productImagesDao.selectThumbnailPicture(productId);
			ProdcutImages.add(image); //productImages 에 image 가 들어간다
*/			
			Cart cart = new Cart();
			cart.setProductId(productId);
			cart.setUserId(userId); //cart 에 userId 와 productId 가 들어간다
			
			Integer quantity = CartDao.selectCount(cart);
			Quantity.add(quantity);		
			
			ProductImages productImage =productImagesDao.selectThumbnailPicture(productId);
			if (productImage != null && productImage.getProductImage() != null) {
	            String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImage());
	            productImage.setBase64Image(base64Img);
	            ProductImages.add(productImage);
	        }
			
			cartListItem.setCart(cart);
			cartListItem.setProductImages(ProductImages);
			cartListItem.setProductInfo(ProductInfo);
			cartListItem.setQuantity(Quantity);
	        
			cartList.add(cartListItem);
		}
		
	  return cartList;
	}

	@Override
	public void updateCart(Cart cart) {
		int beforeCount = CartDao.selectCount(cart); //기존의 해당 상품의 갯수
		int addCount = cart.getCount(); //추가할 상품의 갯수
		int afterCount = beforeCount + addCount; //기존 상품 + 추가 상품의 갯수
		
		cart.setCount(afterCount); //cart의 count에 새 값을 주입
		
		CartDao.updateCart(cart);
	}

	@Override
	public int countCart(Cart cart) {	
		int stockCart = CartDao.countCart(cart); //cart 에 같은 상품이 있는지 (있으면 1, 없으면 0 return)
		return stockCart;
	}


	@Override
	public void deleteCart(Cart cart) {
		CartDao.delete(cart);		
	}

	@Override
	public int getQuantity(Cart cart) {
		int quantity = CartDao.selectCount(cart);
		return quantity;
	}
}
	


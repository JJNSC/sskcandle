package com.skkcandle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.CartDao;
import com.skkcandle.dto.Cart;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao CartDao;

	@Override
	public void insertCart(Cart cart) {
		
		log.info("cart 정보" + cart);
		
		CartDao.insert(cart);
	}

	@Override
	public List<Cart> getCartList(int userId) {
		
		List<Cart> cartList = CartDao.listCart(userId);
		
		return cartList;
	}

	@Override
	public void updateCart(Cart cart) {
		int beforeCount = CartDao.selectCount(cart); //기존의 해당 상품의 갯수
		int addCount = cart.getCount();
		int afterCount = beforeCount + addCount;
		
		cart.setCount(afterCount);
		
		CartDao.updateCart(cart);
	}

	@Override
	public int countCart(Cart cart) {
		
		int stockCart = CartDao.countCart(cart);
		
		return stockCart;
	}
}
	


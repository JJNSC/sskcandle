package com.skkcandle.service;

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
}
	


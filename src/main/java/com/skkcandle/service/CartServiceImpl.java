package com.skkcandle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.CartDao;
import com.skkcandle.dto.Cart;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;

	@Override
	public void insertCart(Cart cart) {
		cartDao.insert(cart);
	}
}
	


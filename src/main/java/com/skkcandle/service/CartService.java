package com.skkcandle.service;

import java.util.List;

import com.skkcandle.dto.Cart;
import com.skkcandle.dto.CartList;

public interface CartService {
	public void insertCart(Cart cart);
	public List<CartList> getCartList(int userId);
	public void updateCart(Cart cart);
	public int countCart(Cart cart);
	public void deleteCart(Cart cart);
	public int getQuantity(Cart cart);
}

package com.skkcandle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.CartDao;
import com.skkcandle.dto.Cart;

import lombok.extern.slf4j.Slf4j;


/**
 * 
 * @author 조성진
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

	@Override
	public void insertCart(Cart cart) {
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
	public void deleteCart(int userId, List<Integer> checkedProductId) {
		CartDao.delete(userId, checkedProductId);		
	}
}
	


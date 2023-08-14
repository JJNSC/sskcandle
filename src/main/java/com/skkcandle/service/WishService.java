package com.skkcandle.service;

import java.util.List;

import com.skkcandle.dto.Wish;
import com.skkcandle.dto.WishList;
/**
 * 
 * @author 조성진 김종진
 *
 */
public interface WishService {
	public void remove(Wish wish);
	public void add(Wish wish);
	public int selectWish(Wish wish);
	public List<WishList> getWishList(int userId);
}

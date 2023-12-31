package com.skkcandle.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.Wish;

@Mapper
public interface WishDao {
	public void insert(Wish wish);
	public void delete(Wish wish);
	public int selectWish(Wish wish);
	public ArrayList<Integer> getWishNo(int userId);
}

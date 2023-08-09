package com.skkcandle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Review;

@Mapper
public interface ReviewDao {
	public List<Review> selectReview(int productId);
	public List<Review> selectReviewByUserId(int userId);
	public int count(int productId);
	public List<Review> selectByPage(Pager pager);
	public int countReview(int productId);
}


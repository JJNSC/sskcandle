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
	public void insertReview(Review review);
	public void deleteReview(int reviewId);
	public Review getReviewInfo(int reviewId);
	public void updateReview(Review review);
}



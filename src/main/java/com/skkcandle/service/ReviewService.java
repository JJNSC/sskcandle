package com.skkcandle.service;

import java.util.List;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Review;

public interface ReviewService {
	//public void writeReview(Review review); selectReview 로 인한 주석처리
 	public List<Review> selectReview(int productId);
 	public List<Review> selectReviewByUserId(int userId);
 	public int getTotalReviewNum(int productId);
	public List<Review> getList(Pager pager);
	public int getReviewNum(int productId);
	public void insertReview(Review review);
	public void deleteReview(int reviewId);
	public Review getReviewInfo(int reviewId);
	public void updateReview(Review review);
	public List<Review> reviewPaging(Pager pager);
	public int reviewNum(int userId);
	public List<Review> getReviewList(Pager pager);
	public List<Review> getListReviewByRating(Pager pager);
	public List<Review> getListReviewNew(Pager pager);
}

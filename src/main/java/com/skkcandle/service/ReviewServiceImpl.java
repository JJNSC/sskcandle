package com.skkcandle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.ReviewDao;
import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Review;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao reviewDao;

	/*@Override
	public void writeReview(Review review) {
		log.info("review: " + review);
		
		reviewDao.selectReview(review);
	}*/

	@Override
	public List<Review> selectReview(int productId) {
		List<Review> productReview = reviewDao.selectReview(productId);			
		return productReview;
	}

	@Override
	public List<Review> selectReviewByUserId(int userId) {
		List<Review> myProductReview = reviewDao.selectReviewByUserId(userId);		
		return myProductReview;
	}

	@Override
	public int getTotalReviewNum(int productId) {
	   int totalReviewNum = reviewDao.count(productId);
	   return totalReviewNum;
	}

	@Override
	public List<Review> getList(Pager pager) {
      List<Review> boardList = reviewDao.selectByPage(pager);
      return boardList;
	}

	@Override
	public int getReviewNum(int productId) {
		int ReviewNum = reviewDao.countReview(productId);
		return ReviewNum;
	}

	@Override
	public void insertReview(Review review) {
		reviewDao.insertReview(review);
		
	}
}

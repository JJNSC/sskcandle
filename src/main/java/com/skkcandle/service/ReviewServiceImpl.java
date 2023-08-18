package com.skkcandle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.ReviewDao;
import com.skkcandle.dao.UserDao;
import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Review;
import com.skkcandle.dto.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao reviewDao;
	private UserDao userDao;

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

	@Override
	public void deleteReview(int reviewId) {
		reviewDao.deleteReview(reviewId);
		
	}

	@Override
	public Review getReviewInfo(int reviewId) {
		Review review = reviewDao.getReviewInfo(reviewId);
		return review;
	}

	@Override
	public void updateReview(Review review) {
		reviewDao.updateReview(review);
	}

	@Override
	public List<Review> reviewPaging(Pager pager) {
		List<Review> reviewList =  reviewDao.reviewPaging(pager);
		return reviewList;
	}

	@Override
	public int reviewNum(int userId) {
		int reviewNum = reviewDao.reviewNum(userId);
		return reviewNum;
	}

	@Override
	public List<Review> getReviewList(Pager pager) { //무슨 product의 review 인지 파악 , 
		
/*		log.info("페이저" + pager);
*/		
	   List<Review> reviewList = reviewDao.getListReview(pager); 

/*	   log.info("리뷰 리스트" + reviewList);
*/	   
	    return reviewList;
	}

	/*@Override
	public List<ReviewList> getReviewList(int productId) { //무슨 product의 review 인지 파악 , 
		
	    List<ReviewList> reviewList = new ArrayList<>();
	    ReviewList reviewListInfo = new ReviewList(); //여기에 review 에 띄울 정보들을 담아준다 (리뷰내용, 회원 이미지, 회원이름, 리뷰평점, 리뷰데이트...)

	    ArrayList<Integer> reviewIdList = new ArrayList<>(); //질문1) 해당 productId의 리뷰 수 만큼 for문을 돌려 줘야 하나?? 그러면 List 가 아니라 int로 받아야 하나? 
	    reviewIdList = reviewDao.getListReview(productId); //질문2) 근데 이건 productId로 리뷰의 리스트들을 주욱 받아오는것 (list 객체)

	    List<User> User = new ArrayList<>(); //회원들의 정보
	    List<Review> ReviewInfo = new ArrayList<>(); //리뷰 정보들
	    
	    for (Integer reviewId : reviewIdList) {
	    	
	    	List<Review> review = reviewDao.selectReview(productId);
	    	ReviewInfo.addAll(review); //review selectReview 가 List 타입으로 받아오므로 (addAll 사용)
	    
	    	User user = 
	    }
	        
	    	reviewListInfo.setReview(review);
	    	reviewListInfo.setUser(user);
	    }

	    return reviewList;*/
	}







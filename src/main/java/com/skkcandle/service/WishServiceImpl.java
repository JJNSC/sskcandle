package com.skkcandle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.WishDao;
import com.skkcandle.dto.Product;
import com.skkcandle.dto.ProductImages;
import com.skkcandle.dto.Wish;
import com.skkcandle.dto.WishList;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 조성진 김종진
 *
 */
@Slf4j
@Service
public class WishServiceImpl implements WishService {
	@Autowired
	   private WishDao wishDao;
		
	@Override
	public void remove(Wish wish) {
	  wishDao.delete(wish); //int를 반환해야 하므로 return값에서 mapper의 메소드를 호출한다.
	}

	@Override
	public void add(Wish wish) {
		wishDao.insert(wish);
	}

	@Override
	public int selectWish(Wish wish) {
		 int userWish = wishDao.selectWish(wish);
		return userWish;
	}

	@Override
	public List<WishList> getWishList(int userId) {
		ArrayList<Integer> productNos = wishDao.getWishNo(userId);
		
		//찜목록의 상품정보들
		List<Product> product =new ArrayList<>();
		//찜목록의 상품들의 이미지들
		List<ProductImages> productImg = new ArrayList<>();
		for(Integer productId : productNos) {
			//상품 아이디로 여기서 이미지인코딩해서 넣고 , 상품정보들 넣자 
		}
		
		return null;
	}	
}

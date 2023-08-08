package com.skkcandle.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.skkcandle.dao.wishDao;
import com.skkcandle.dto.Wish;

public class WishServiceImpl implements WishService {
	@Autowired
	   private wishDao wishDao;
	   
	
	@Override
	public void remove(Wish wish) {
	  wishDao.delete(wish); //int를 반환해야 하므로 return값에서 mapper의 메소드를 호출한다.
	}

	@Override
	public void add(Wish wish) {
		wishDao.insert(wish);
	}

	@Override
	public Wish selectWish(Wish wish) {
		Wish wishList = wishDao.selectWish(wish);
		return wishList ;
	}
}

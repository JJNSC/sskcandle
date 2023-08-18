package com.skkcandle.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.skkcandle.dao.MainPageDao;
import com.skkcandle.dto.MainPage;

@Service
public class MainPageServiceImpl implements MainPageService {
	
	@Resource
    private MainPageDao mainPageDao;
	
	@Override
	public List<MainPage> getProductListByReviewCount() {
		List<MainPage> productList = mainPageDao.getProductListByReviewCount();
		return productList;
	}
	
}

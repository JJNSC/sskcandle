package com.skkcandle.service;

import java.util.List;

import com.skkcandle.dto.MainPage;

public interface MainPageService {
	public List<MainPage> getProductListByReviewCount();
}

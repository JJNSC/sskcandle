package com.skkcandle.service;

import com.skkcandle.dto.Wish;

public interface WishService {
	public void remove(Wish wish);
	public void add(Wish wish);
	public Wish selectWish(Wish wish);
}

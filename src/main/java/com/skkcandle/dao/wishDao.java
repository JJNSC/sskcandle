package com.skkcandle.dao;

import com.skkcandle.dto.Wish;

public interface wishDao {
	public void insert(Wish wish);
	public void delete(Wish wish);
	public Wish selectWish(Wish wish);
}

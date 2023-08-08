package com.skkcandle.dao;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.User;

@Mapper
public interface userDao {
	public User select(String userEmail);
	public User selectById(int userId);
	public void insert(User user);
	public void updateImage(User user);
	public void updateUserInfo(User user);
	public void updateUserInfoNoPW(User user);
	public void delete(int userId);
}

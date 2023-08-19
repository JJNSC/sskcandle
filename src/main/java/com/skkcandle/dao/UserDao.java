package com.skkcandle.dao;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.User;

@Mapper
public interface UserDao {
	public User select(String userEmail);
	public int checkUserPhone(String userPhone);
	public User selectById(int userId);
	public void insert(User user);
	public void updateImage(User user);
	public void updateUserInfo(User user);
	public void updateUserInfoNoPW(User user);
	public void delete(int userId);
	public void changeUserPoint(User user);
	public int checkUserExistByNameAndPhone(User user);
	public String getEmailByNameAndPhone(User user);
	public int checkUserExistByEmailPhoneQnA(User user);
	public int getUserIdByCheckUserExistByEmailPhoneQnA(User user);
	public void updateUserPassword(User user);
}

package com.skkcandle.service;

import com.skkcandle.dto.User;

public interface UserService {
	public enum JoinResult{
		SUCCESS,
		FAIL_DUPLICATED_Email,
		FAIL_DUPLICATED_PHONE
	}
	
	public enum LoginResult{
		SUCCESS,
		FAIL_EMAIL_WRONG,
		FAIL_PASSWORD_WRONG
	}
	public enum WithdrawResult{
		SUCCESS,
		FAIL_EMAIL_WRONG,
		FAIL_PASSWORD_WRONG
	}
	
	public User getUserInfo(String userEmail);
	public User getUserInfoById(int userId);
	public JoinResult join(User user);
	public LoginResult login(User user);
	public WithdrawResult withdraw(User sessionUser, User inputUser);
	public void updateUserImage(User user);
	public void updateUserInfo(User user);
	public void updateUserInfoNoPW(User user);
	public void withdrawUser(int userId);
	public void changeUserPoint(User user);
	public int checkUserExistByNameAndPhone(User user);
	public String getEmailByNameAndPhone(User user);
}

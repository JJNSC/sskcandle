package com.skkcandle.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class User {
	private int userId;
	private String userName;
	private String userPassword;
	private String userEmail;
	private String userPhone;
	private String userAddress;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date userJoinDate;
	private Date userBirthDay;
	private String userGrade;
	private String userPoint;
	
	private MultipartFile battach;
	private String userAttachType;
	//방법2 : DB에 Blob 으로 저장
	//Mybatis에서 byte[] <- MyBatis -> Blob 이렇게 변환해준다.
	private byte[] userImageData;
}

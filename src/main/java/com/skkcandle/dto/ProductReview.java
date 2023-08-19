package com.skkcandle.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProductReview {
	private String userName;
	private String base64Image;
	private String reviewTitle;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reviewDate;
	private int ratingScore;
	private String reviewContent;
}
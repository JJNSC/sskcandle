package com.skkcandle.dto;

import lombok.Data;

@Data
public class MainPage {
	private String userName;
	private int productId;
	private String productName;
	private int productPrice;
	private byte[] productImage;
	private String base64Image;
	private String pattachType;
	private String pattachOname;
	private String reviewTitle;
	private String reviewContent;
	private int userId;
	private int reviewId;
}

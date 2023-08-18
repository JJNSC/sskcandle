package com.skkcandle.dto;

import lombok.Data;

@Data
public class ProductList {
	private int productId;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productMaker;
	private byte[] productImage;
	private String base64Image;
}

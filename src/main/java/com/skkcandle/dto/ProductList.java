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
	
	/*public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
	
	public String getBase64Image() {
        return base64Image;
    }*/
}

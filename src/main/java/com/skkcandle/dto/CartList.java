package com.skkcandle.dto;

import java.util.List;

import lombok.Data;

@Data
public class CartList {
	private Cart cart;
	private List<Integer> quantity;
	private List<Product> productInfo;
	private List<ProductImages> productImages;
}

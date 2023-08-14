package com.skkcandle.dto;

import java.util.List;

import lombok.Data;

@Data
public class WishList {
	private List<Product> product;
	private List<ProductImages> productImages;
}

package com.skkcandle.dto;

import java.util.List;

import lombok.Data;

@Data
public class BuyList {
	private Order order;
	private List<OrderDetail> orderDetail;
	private List<Product> product;
	private List<ProductImages> productImages;
}

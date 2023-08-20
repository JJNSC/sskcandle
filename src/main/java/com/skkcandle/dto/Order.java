package com.skkcandle.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Order {
	private int orderId;
	private int userId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderDate;
	private String orderStatus;
	private int shippingPostcode;
	private String shippingRoadAddress;
	private String shippingDetailAddress;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date arriveDate;
	private String accountTransfer;
	private String creditCard;
	private String phone;
	private String withoutBankbook;
	private String checked;
	//구매리스트에서 검색을 할때 필요한 상품 이름
	private String productName;
}

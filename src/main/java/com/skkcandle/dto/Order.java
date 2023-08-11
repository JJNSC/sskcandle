package com.skkcandle.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Order {
	private int orderId;
	private int userId;
	private Date orderDate;
	private String orderStatus;
	private String shippingAddress;
	private Date arriveDate;
	private String accountTransfer;
	private String creditCard;
	private String phone;
	private String withoutBankbook;
	private String checked;
}

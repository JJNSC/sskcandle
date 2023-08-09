package com.skkcandle.service;

import java.util.List;

import com.skkcandle.dto.OrderDetail;

public interface OrderService {
	public List<OrderDetail> selectOrderDetail(int userId);
}

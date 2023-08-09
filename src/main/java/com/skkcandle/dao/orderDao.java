package com.skkcandle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.OrderDetail;

@Mapper
public interface orderDao {
	public List<OrderDetail> selectOrdersByUserId(int userId);
}

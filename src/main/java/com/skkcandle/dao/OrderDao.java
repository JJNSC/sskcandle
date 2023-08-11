package com.skkcandle.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.Order;
import com.skkcandle.dto.OrderDetail;
/**
 * 
 * @author 김종진
 *
 */
@Mapper
public interface OrderDao {
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> selectOrdersByUserId(int userId);
	public void insertOrderInfo(Order order);
	public int getOrderId(int userId);
	public void changeCheck(int orderId);
	public void insertOrderDetail(OrderDetail orderDetail);
}

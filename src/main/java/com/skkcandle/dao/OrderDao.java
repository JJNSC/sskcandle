package com.skkcandle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.Order;
import com.skkcandle.dto.OrderDetail;
import com.skkcandle.dto.Pager;
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
	public void insertOrderInfo(Order order);
	public int getOrderId(int userId);
	public void changeCheck(int orderId);
	public void insertOrderDetail(OrderDetail orderDetail);
	public List<Order> getOrderInfo(Pager pager);
	public List<Order> getOrderInfoBySearchword(Pager pager);
	public List<OrderDetail> getOrderDetailByOrderId(int orderId);
	public int getOrderCount(int userId);
	public int getOrderCountBySearchword(Order order);
	public void reviewedOrder(OrderDetail orderDetail);
}

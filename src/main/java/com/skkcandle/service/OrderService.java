package com.skkcandle.service;

import java.util.List;
import java.util.Map;

import com.skkcandle.dto.BuyList;
import com.skkcandle.dto.Order;
import com.skkcandle.dto.OrderDetail;
import com.skkcandle.dto.Pager;
/**
 * 
 * @author 김종진
 *
 */
public interface OrderService {
	public List<Map<String, Object>> selectOrderDetail(int userId);
	public int insertBuyList(Order order);
	public void insertOrderDetail(OrderDetail orderDetail);
	public List<BuyList> getBuyList(Pager pager);
	public List<BuyList> getBuyListBySearchword(Pager pager);
	public int getOrderCount(int userId);
	public int getOrderCountBySearchword(Order order);
	public void reviewedOrder(OrderDetail orderDetail);
}

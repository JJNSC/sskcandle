package com.skkcandle.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.OrderDao;
import com.skkcandle.dto.Order;
import com.skkcandle.dto.OrderDetail;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 김종진
 *
 */
@Slf4j
@Service
public class OrderServiceImpl implements OrderService{ 

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public List<Map<String, Object>> selectOrderDetail(int userId) {
		List<Map<String, Object>> list =  orderDao.selectOrdersByUserId(userId);
		return list;
	}

	@Override
	public int insertBuyList(Order order) {
		log.info("여기까진 괜춘0-0");
		//orderinfo 에 데이터를 넣는다.
		orderDao.insertOrderInfo(order);
		log.info("여기까진 괜춘0-1");
		//orderinfo에서 1.userId를 통해서 check가 no인 컬럼의 orderId 를 가져오고 2.check를 yes로 바꾼다.
		int userId = order.getUserId();
		//1.
		int orderId =orderDao.getOrderId(userId);
		log.info("여기까진 괜춘0-2");
		//2.
		orderDao.changeCheck(orderId);
		log.info("여기까진 괜춘0-3");
		
		return orderId;
	}

	@Override
	public void insertOrderDetail(OrderDetail orderDetail) {
		log.info("여기까진 괜춘2-0");
		orderDao.insertOrderDetail(orderDetail);
	}

	


}

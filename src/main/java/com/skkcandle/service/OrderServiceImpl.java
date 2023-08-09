package com.skkcandle.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.OrderDao;
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

	


}

package com.skkcandle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.OrderDao;
import com.skkcandle.dto.OrderDetail;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService{ 

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public List<OrderDetail> selectOrderDetail(int userId) {
		List<OrderDetail> list =  orderDao.selectOrdersByUserId(userId);
		log.info("서비스 임플? : "+ list );
		return list;
	}
	


}

package com.skkcandle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.orderDao;
import com.skkcandle.dto.OrderDetail;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService{ 

	@Autowired
	private orderDao orderDao;
	
	@Override
	public List<OrderDetail> selectOrderDetail(int userId) {
		List<OrderDetail> list =  orderDao.selectOrdersByUserId(userId);
		int test1 =  orderDao.ordertest();
		List<OrderDetail> test2 =  orderDao.test();
		
		log.info("서비스 임플? : "+ list );
		log.info("서비스 임플2? : "+ test1 );
		log.info("서비스 임플3? : "+ test2 );
		return list;
	}

	


}

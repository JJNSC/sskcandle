package com.skkcandle.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.OrderDao;
import com.skkcandle.dao.ProductDao;
import com.skkcandle.dao.ProductImagesDao;
import com.skkcandle.dto.BuyList;
import com.skkcandle.dto.Order;
import com.skkcandle.dto.OrderDetail;
import com.skkcandle.dto.Product;
import com.skkcandle.dto.ProductImages;

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
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductImagesDao productImagesDao;
	
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

	//BuyList : 한번의 오더에 담긴 정보들
	@Override
	public List<BuyList> getBuyList(int userId) {
		BuyList oneOrder =null;
		//모든 오더들의 정보
		List<Order> orderinfo = orderDao.getOrderInfo(userId);
		int orderId;
		List<OrderDetail> orderDetail;
		int productId;
		List<Product> product = null;
		List<ProductImages> productImage =null;
		for(Order order : orderinfo) {
			//각각의 Order 객체의 orderId를 받아온다.
			orderId = order.getOrderId();
			log.info("orderId : "+orderId);
			//각각의 orderId를 통해서 orderDetail들의 정보를 가져온다.
			orderDetail = orderDao.getOrderDetailByOrderId(orderId);
			log.info("orderDetail : "+orderDetail);
			//각 orderDetail로부터 productId를 받아서 이것으로 상품명,가격, 이미지파일을 가져온다.
			for(OrderDetail oDetail : orderDetail) {
				productId = oDetail.getProductId();
				log.info("productId : "+productId);
				product.add(productDao.selectDetailProduct(productId));
				productImage.add(productImagesDao.selectThumbnailPicture(productId));
			}
			oneOrder.setOrder(order);
		}
		
		return null;
	}

	
	


}

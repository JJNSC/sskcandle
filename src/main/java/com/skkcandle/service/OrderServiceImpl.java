package com.skkcandle.service;

import java.util.ArrayList;
import java.util.Base64;
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
import com.skkcandle.dto.Pager;
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
	public List<BuyList> getBuyList(Pager pager) {
		List<BuyList> Orders =  new ArrayList<>();
		//모든 오더들의 정보
		List<Order> orderinfo = orderDao.getOrderInfo(pager);
		
		for(Order order : orderinfo) {
			BuyList oneOrder = new BuyList();
			//각각의 Order 객체의 orderId를 받아온다.
			int orderId = order.getOrderId();
			log.info("orderId : "+orderId);
			//각각의 orderId를 통해서 orderDetail들의 정보를 가져온다.
			List<ProductImages> ProductImages =  new ArrayList<>();
			List<Product> products = new ArrayList<>();
			List<OrderDetail> orderDetail = orderDao.getOrderDetailByOrderId(orderId);
			log.info("orderDetail : "+orderDetail);
			//각 orderDetail로부터 productId를 받아서 이것으로 상품명,가격, 이미지파일을 가져온다.
			for(OrderDetail oDetail : orderDetail) {
				int productId = oDetail.getProductId();
				log.info("productId : "+productId);
				Product product = productDao.selectDetailProduct(productId);
				log.info("product : "+product);
				products.add(product);
				
				ProductImages productImage =productImagesDao.selectThumbnailPicture(productId);
				if (productImage != null && productImage.getProductImage() != null) {
		            String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImage());
		            productImage.setBase64Image(base64Img);
		            ProductImages.add(productImage);
		        }
			}
			oneOrder.setOrder(order);
			oneOrder.setOrderDetail(orderDetail);
			oneOrder.setProduct(products);
			oneOrder.setProductImages(ProductImages);
			Orders.add(oneOrder);
		}
		
		return Orders;
	}

	//구매 내역 페이징을 위한 총 구매내역 수 가지고오기
	@Override
	public int getOrderCount(int userId) {
		int count = orderDao.getOrderCount(userId);
		return count;
	}
	//검색 단어를 통한 구매 내역 페이징을 위한 총 구매내역 수 가지고오기
	@Override
	public int getOrderCountBySearchword(Order order) {
		int count = orderDao.getOrderCountBySearchword(order);
		return count;
	}

	@Override
	public void reviewedOrder(OrderDetail orderDetail) {
		orderDao.reviewedOrder(orderDetail);
		
	}

	@Override
	public List<BuyList> getBuyListBySearchword(Pager pager) {
		List<BuyList> Orders =  new ArrayList<>();
		//모든 오더들의 정보
		List<Order> orderinfo = orderDao.getOrderInfoBySearchword(pager);
		
		for(Order order : orderinfo) {
			BuyList oneOrder = new BuyList();
			//각각의 Order 객체의 orderId를 받아온다.
			int orderId = order.getOrderId();
			log.info("orderId : "+orderId);
			//각각의 orderId를 통해서 orderDetail들의 정보를 가져온다.
			List<ProductImages> ProductImages =  new ArrayList<>();
			List<Product> products = new ArrayList<>();
			List<OrderDetail> orderDetail = orderDao.getOrderDetailByOrderId(orderId);
			log.info("orderDetail : "+orderDetail);
			//각 orderDetail로부터 productId를 받아서 이것으로 상품명,가격, 이미지파일을 가져온다.
			for(OrderDetail oDetail : orderDetail) {
				int productId = oDetail.getProductId();
				log.info("productId : "+productId);
				Product product = productDao.selectDetailProduct(productId);
				log.info("product : "+product);
				products.add(product);
				
				ProductImages productImage =productImagesDao.selectThumbnailPicture(productId);
				if (productImage != null && productImage.getProductImage() != null) {
		            String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImage());
		            productImage.setBase64Image(base64Img);
		            ProductImages.add(productImage);
		        }
			}
			oneOrder.setOrder(order);
			oneOrder.setOrderDetail(orderDetail);
			oneOrder.setProduct(products);
			oneOrder.setProductImages(ProductImages);
			Orders.add(oneOrder);
		}
		
		return Orders;
	}


	
	


}

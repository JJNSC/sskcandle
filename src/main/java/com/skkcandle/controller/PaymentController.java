package com.skkcandle.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skkcandle.dto.Order;
import com.skkcandle.dto.OrderDetail;
import com.skkcandle.dto.User;
import com.skkcandle.service.OrderService;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 김종진
 *
 */
@Slf4j
@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	Date today;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("")
	public String main(HttpSession session, Model model ) { // 장바구니 or 상품상세페이지 끝나면 일로 상품정보+상품갯수 정보가 와야함
		log.info("일단 시작");
		//로그인 한 사람의 정보 
		User sessionUser = (User) session.getAttribute("login"); //추후에 login 이름으로 User 형식으로 세션에 setAttribute할거임(로그인할때)
		
		//임시로 넣은 구매상품 데이터
		List<Map<String, Object>> orderlist = orderService.selectOrderDetail(sessionUser.getUserId());

		model.addAttribute("userinfo", sessionUser);
		//사용자의 구매리스트
		model.addAttribute("orderlist", orderlist);
		
		return "/payment/payment";
	}
	
	@RequestMapping("/payComplete")
	public String payComplete(HttpSession session, Model model, 
			@RequestParam String payAddress,
            @RequestParam List<Integer> productList,
            @RequestParam List<Integer> quantityList,
            @RequestParam String accountTransfer,
            @RequestParam String creditCard,
            @RequestParam String phone,
            @RequestParam String withoutBankbook) {
		log.info("결제 실행");
		log.info("productList : "+productList);
		log.info("quantityList : "+quantityList);
		
		User sessionUser = (User) session.getAttribute("login");
		int userId = sessionUser.getUserId();
		
		log.info("accountTransfer : " +accountTransfer);
		log.info("creditCard : " +creditCard);
		log.info("phone : " +phone);
		log.info("withoutBankbook : " +withoutBankbook);
		
		if(accountTransfer.equals("undefined")) {
			accountTransfer ="";
		}
		if(creditCard.equals("undefined")) {
			creditCard ="";
		}
		if(phone.equals("undefined")) {
			phone ="";
		}
		if(withoutBankbook.equals("undefined")) {
			withoutBankbook ="";
		}
		
		
		log.info("accountTransfer : " +accountTransfer);
		log.info("creditCard : " +creditCard);
		log.info("phone : " +phone);
		log.info("withoutBankbook : " +withoutBankbook);
		
		//insertBuyList 로 orderinfo에 정보를 넣고 orderId를 받아온다.
		Order order = new Order();
		order.setUserId(userId);
		order.setShippingAddress(payAddress);
		order.setAccountTransfer(accountTransfer);
		order.setCreditCard(creditCard);
		order.setPhone(phone);
		order.setWithoutBankbook(withoutBankbook);
		int orderId = orderService.insertBuyList(order);
		log.info("여기까진 괜춘0");
		
		//orderId, productId, quantity 를 orderDetail에 세팅해준다. 
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setUserId(userId);
		orderDetail.setOrderId(orderId);
		for (int i = 0; i < productList.size(); i++) {
            int productId = productList.get(i);
            int quantity = quantityList.get(i);
            log.info("여기까진 괜춘1");
            orderDetail.setProductId(productId);
            orderDetail.setQuantity(quantity);

            orderService.insertOrderDetail(orderDetail);
            log.info("여기까진 괜춘2");
        }
		
		return "redirect:/";
	}
	
	
	
}














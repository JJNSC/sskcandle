package com.skkcandle.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skkcandle.dto.OrderDetail;
import com.skkcandle.dto.User;
import com.skkcandle.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/payment")
public class paymentController {
	
	Date today;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("")
	public String main(HttpSession session, Model model ) { // 장바구니 or 상품상세페이지 끝나면 일로 상품정보+상품갯수 정보가 와야함
		log.info("일단 시작");
		//로그인 한 사람의 정보 
		User sessionUser = (User) session.getAttribute("login"); //추후에 login 이름으로 User 형식으로 세션에 setAttribute할거임(로그인할때)
		log.info("세션 정보 받아오고 : " +sessionUser);
		
		//임시로 넣은 구매상품 데이터
		List<OrderDetail> orderlist = orderService.selectOrderDetail(sessionUser.getUserId());
		log.info("임시로 넣은 구매상품 데이터 나와주고 : "+orderlist);

		model.addAttribute("userinfo", sessionUser);
		//사용자의 구매리스트
		model.addAttribute("orderlist", orderlist);
		
		return "/payment/payment";
	}
	
}

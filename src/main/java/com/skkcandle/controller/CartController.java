package com.skkcandle.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skkcandle.dto.Cart;
import com.skkcandle.dto.CartList;
import com.skkcandle.dto.User;
import com.skkcandle.service.CartService;
import com.skkcandle.service.UserService;

import lombok.extern.slf4j.Slf4j;


/**
 * Cart 관련 기능 처리 컨트롤러
 * 
 * 제품 장바구니에 담기,삭제,수량 수정 기능 제공
 * @author 조성진 김종진
 */


@Slf4j
@Controller
/*@RequestMapping("/cartList")
*/public class CartController {
	
	/**
	 * 의존성 주입
	 */
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
		
	/**
	 * 장바구니에 담은 후 '예'를 눌렀을시 장바구니 페이지로 가는 메소드
	 * 
	 * @param session 세션 객체 로그인한 유저의 정보
	 * @param model 모델 객체
	 * @param result 장바구니에 담을 제품의 수량
	 * @param productId 장바구니에 담을 제품의 정보
	 * @return CartController
	 */
	 @GetMapping("/cartList") 
	 public String addCart(HttpSession session, Model model, int result, int productId) {
		 User user = (User) session.getAttribute("login");
		 int userId = user.getUserId();	
		 /*
		 log.info("유저 번호" + userId);
		 log.info("제품 번호" + productId);
		 log.info("수량값" + result);
		 */
		 Cart cart = new Cart(); 
		 cart.setCount(result); //새로 장바구니에 추가한 수량값
		 cart.setProductId(productId);
		 cart.setUserId(userId);
		 
		 /*log.info("cart 내용물" + cart); */		 
		 int stockCart = cartService.countCart(cart);
		 
		 /*log.info("카트안의 수량" + stockCart);*/		 
		 if(stockCart == 1) {		 	
	 	 	cartService.updateCart(cart);
		 } else if(stockCart == 0) {
			 cartService.insertCart(cart);	 
		 }
		 return "redirect:/getCartList";  
	 }
	 
	 /**
	  * 장바구니에 담은 후 alert 에서 '아니오'를 눌렀을시 제품페이지로 돌아가는 메소드
	  * 
	  * @param cart cart 테이블에 담길 제품의 정보들(userId, productId, count(수량))
	  * @param session 로그인 정보
	  * @param result 수량 정보
	  * @param model 모델 객체
	  * @return prodcutDetail controller
	  */
	 
	 @GetMapping("/reProduct") 
	 public String reProduct(HttpSession session, int result, Model model, int productId) {
		 User user = (User) session.getAttribute("login");
		 int userId = user.getUserId();	
		 /*
		 log.info("유저 번호" + userId);
		 log.info("제품 번호" + productId);
		 log.info("수량값" + result);
		 */
		 Cart cart = new Cart(); 
		 cart.setCount(result); //새로 장바구니에 추가한 수량값
		 cart.setProductId(productId);
		 cart.setUserId(userId);
		 
		 /*log.info("cart 내용물" + cart); */		 
		 int stockCart = cartService.countCart(cart);
		 
		 /*log.info("카트안의 수량" + stockCart);*/		 
		 if(stockCart == 1) {		 	
	 	 	cartService.updateCart(cart);
		 } else if(stockCart == 0) {
			 cartService.insertCart(cart);	 
		 }
		 
		 log.info("취소 버튼 잘 눌렸나 userId" + userId);
		 log.info("취소 버튼 잘 눌렸나 productId" + productId);

		 return "redirect:/productDetail?productId=" + productId;
	 }
	 
	 /**
	  * 장바구니 페이지를 보여주는 메소드
	  *  
	  * @param session 로그인 정보
	  * @param model
	  * @return cart.jsp
	  */
	 
	 @GetMapping("/getCartList")
	 public String getCartList(HttpSession session, Model model) {
		 
		 /*log.info("getCartList 실행되나?");*/		 
		 User user = (User) session.getAttribute("login");   
		 int userId = user.getUserId();	
		 
		 
		 List<CartList> cartList = cartService.getCartList(userId);
		 model.addAttribute("cartList", cartList);
		 
		 /*log.info("user의 카트리스트" + cartList);*/		 
		 return "/cart/cart";
	 }
	 
	 @GetMapping("/deleteList")
	 public String deleteCheckedCart(HttpSession session, Model model, @RequestParam List<Integer> deleteList) {
		 User user = (User) session.getAttribute("login");   
		 int userId = user.getUserId();
		 log.info("체크된 프로덕트 id" + deleteList);
		 log.info("userId" + userId);

        for (int i = 0; i < deleteList.size(); i++) {
        	int productId = deleteList.get(i);
        	Cart cart = new Cart(); 
        	cart.setUserId(userId);
        	cart.setProductId(productId);
        	
        	log.info("productId" + productId);
            cartService.deleteCart(cart);
        }
      
		 return "redirect:/getCartList";
	 }
	 
	 @RequestMapping("oneProductCart")
	 public String oneProductCart(int productId, int quantity, HttpSession session, Model model) {
		 User user = (User) session.getAttribute("login");
		 //로그인이 안되있으면 로그인을 해라
		 if(user == null) {
			 String pid = String.valueOf(productId);
			 session.setAttribute("productId", pid);
			 return "redirect:/loginForm";
		 }
		 //로그인이 되어있다면 장바구니에 해당 유저의 userId 와 productId와 quantity를 넣어주고, 결제창으로 가자
		 else {
			 int userId = user.getUserId();
			 Cart cart = new Cart();
			 cart.setCount(quantity);
			 cart.setProductId(productId);
			 cart.setUserId(userId);
			 cartService.insertCart(cart);
			 model.addAttribute("productId", productId);
			 return "redirect:/payment";
		 }
	 }
	 
	 @PostMapping("/updateQuantity")
	 public String updateQuantity(HttpSession session, int productId, int newQuantity) {
	   /*  int productId = Integer.parseInt(requestData.get("productId").toString());
	     int newQuantity = Integer.parseInt(requestData.get("newQuantity").toString());*/
	     User user = (User) session.getAttribute("login");
	     int userId = user.getUserId();  
	     
	     log.info("회원 번호" + userId);
	     log.info("변경된 수량" + newQuantity);
	     log.info("제품번호" + productId);
	     
	     Cart cart = new Cart();
	     cart.setCount(newQuantity);
	     cart.setProductId(productId);
	     cart.setUserId(userId);
	     
	     cartService.updateCartCount(cart);;
	     
	     log.info("Cart에 담긴 내용" +cart);
	     // 수량 업데이트 작업을 수행해야 함
	     
	     return "Quantity updated successfully";
	 }
}



















package com.skkcandle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skkcandle.dto.User;
import com.skkcandle.service.UserService;
import com.skkcandle.service.UserService.LoginResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/loginForm")
	public String loginForm(@RequestParam(name="loginErrMsg", defaultValue="") String loginErrMsg,
							@RequestParam(name="productId", defaultValue="") String productId,
							Model model, HttpSession session) {
		//만약 로그인 실패하면 이 정보를 가지고 팝업띄우자
		model.addAttribute("loginErrMsg", loginErrMsg);
		log.info("loginErrMsg : "+ loginErrMsg);
		//만약 제품상세페이지에서 왔을경우 해당 상품을 세션에저장하자.
		log.info("productId : "+ productId);
		if(!productId.equals(null)) {
			session.setAttribute("productId", productId);
		}
		
		return "loginForm";
	}
	
	@PostMapping("/login")
	public String login(User user, HttpSession session, Model model) {
		log.info("실행");
		LoginResult result = userService.login(user);
		String errorMsg = "";
		if(result == LoginResult.FAIL_EMAIL_WRONG) {
			errorMsg = "잘못된 이메일 주소 입니다.";
		}else if(result == LoginResult.FAIL_PASSWORD_WRONG) {
			errorMsg = "잘못된 비밀번호 입니다.";
		}else {
			User dbUser = userService.getUserInfo(user.getUserEmail());
			session.setAttribute("login", dbUser);
			//세션에 보고있던 상품이 있는지 확인
			String pid = (String) session.getAttribute("productId");
			//상세제품을 보고있을때 는 다시 해당 페이지로 돌려보내자
			if(pid != null) {
				int productId = Integer.parseInt(pid);
				//세션에서 보고있는 상품을 삭제
				session.removeAttribute("productId");
				model.addAttribute("productId", productId);
				return "redirect:/productDetail";
			}
			//성공시 페인페이지
			return "redirect:/";
		}
		//실패시 에러메세지와 함께 로그인 페이지
		model.addAttribute("loginErrMsg", errorMsg);
		return "redirect:/loginForm";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}

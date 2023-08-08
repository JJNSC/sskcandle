package com.skkcandle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skkcandle.dto.User;
import com.skkcandle.service.UserService;
import com.skkcandle.service.UserService.JoinResult;
import com.skkcandle.service.UserService.WithdrawResult;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@Controller
public class joinController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/join")
	public String joinmain(@RequestParam(value ="register_msg", defaultValue ="이메일")String register_msg, Model model) {
		model.addAttribute("register_msg", register_msg);
		return "join/joinForm";
	}
	
	@PostMapping("/register")
	public String register(User user, Model model) {
		log.info("user정보 :" + user);
		JoinResult joinresult =  userService.join(user);
		
		//이메일이 중복될경우 
		if(joinresult == JoinResult.FAIL_DUPLICATED_Email) {
			model.addAttribute("register_msg", "이메일이 중복되었습니다.");
			return "redirect:/join";
		}
		return "loginForm";
	}
	
	@PostMapping("/withdraw")
	public String withdraw(User user, HttpSession session, Model model) {
		log.info("회원탈퇴 실행");
		User sessionUser = (User) session.getAttribute("login");
		
		String errMsg ="";
		
		WithdrawResult result = userService.withdraw(sessionUser, user);
		log.info("결과 : " + result);
		if(result == WithdrawResult.FAIL_EMAIL_WRONG) {
			errMsg="이메일 주소를 잘못 입력하였습니다.";
		}else if(result == WithdrawResult.FAIL_PASSWORD_WRONG) {
			errMsg="비밀번호를 잘못 입력하였습니다.";
		}else if(result == WithdrawResult.SUCCESS) {
			userService.withdrawUser(sessionUser.getUserId());
			session.removeAttribute("login");
			return "redirect:/";
		}
		
		model.addAttribute("errMsg", errMsg);
		model.addAttribute("subpage", "withdraw");
		return "redirect:/mypage";
	}
	
}

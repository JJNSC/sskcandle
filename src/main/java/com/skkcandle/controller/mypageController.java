package com.skkcandle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mypageController {

	@RequestMapping("/mypage")
	public String mypage() {
		
		return "mypage/mypage";
	}
}

package com.skkcandle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping("testtest")
	public String testtest() {
		
		
		return "test/list";
	}
}

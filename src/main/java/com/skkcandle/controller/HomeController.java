package com.skkcandle.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skkcandle.service.ReviewService;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/header")
	public String header() {
		return "header";
	}
	
	@RequestMapping("/newHeader")
	public String newHeader() {
		return "newHeader";
	}
	
	
}

package com.skkcandle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HeaderController {
	
	@RequestMapping("/aboutUs")
	public String aboutUs(Model model) {
		return "aboutUs";
	}
	
}

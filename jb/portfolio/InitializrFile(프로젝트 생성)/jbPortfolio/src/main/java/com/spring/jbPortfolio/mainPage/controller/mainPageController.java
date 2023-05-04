package com.spring.jbPortfolio.mainPage.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
//@Log4j
//@Slf4j
public class mainPageController {

	/*
	 * @Setter(onMethod_ = @Autowired) private ClientPayPageService
	 * clientPayPageService;
	 */
	// 공연상세페이지
//	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
//	@RequestMapping(value = "/main", method = RequestMethod.GET)
	@RequestMapping("/")
	public String mainPageStartMove() {
		 
		return "mainPage";

	}


}

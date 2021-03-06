package com.tis.photobook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tis.photobook.service.LocalService;

@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	LocalService localService;

	@RequestMapping("/")
	public String root( ) {
		logger.info("Welcome home!{}", localService.TO_DATE_TIME());
		return "redirect:/index";
	}//end
}

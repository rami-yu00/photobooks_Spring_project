package com.tis.photobook.controller;


import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tis.photobook.service.UserService;

@RestController
@RequestMapping("/msg")
public class MsgController {

	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping("")
	public ModelAndView home(Locale locale, HttpSession session)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		return new ModelAndView("msg/msg_list");
	}//end

}//class END

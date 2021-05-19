package com.tis.photobook.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tis.photobook.domain.UsersVO;
import com.tis.photobook.service.UserService;

@RestController
@RequestMapping("/home")
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, HttpSession session)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		ModelAndView mv = new ModelAndView();
		mv.addObject("serverTime", formattedDate );
		UsersVO user = (UsersVO) session.getAttribute("login");
		logger.info("-------------------------------------------------");
		
		if( user != null) { 
			user = userService.selectUser(user.getUser_no());
			session.removeAttribute("login");
			session.setAttribute("login", user);
			logger.info("user: 세션삭제 후 저장"+session.getAttribute("login"));
			mv.setViewName("home");

		}else {
			logger.info("user: 세션 없음 로그인 페이지 이동");
			mv.setViewName("/user/login");
		}
		return mv;
	}//end
	
	@RequestMapping("/top_sidebar")
	public ModelAndView top(HttpSession session)throws Exception {
		ModelAndView mv = new ModelAndView();
		UsersVO user = (UsersVO) session.getAttribute("login");
		user = userService.selectUser(user.getUser_no());
		session.removeAttribute("login");
		session.setAttribute("login", user);
		logger.info("user: 세션삭제 후 저장"+session.getAttribute("login"));
		mv.setViewName("/includes/top_sidebar");
		return mv;
	}//end
	
}//class END

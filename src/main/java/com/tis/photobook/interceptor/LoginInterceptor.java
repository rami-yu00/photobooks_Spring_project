package com.tis.photobook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tis.photobook.domain.UsersVO;
import com.tis.photobook.service.UserService;

//로그인처리 담당 인터셉터
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Autowired
	UserService userService;
	
	@Override //preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {

		//1. 세션객체가져오기
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("login");
		//2. 로그인이 안되어 있는 경우 -> login 페이지로 이동
		if(user != null) { 
			user = userService.selectUser(user.getUser_no());
			session.removeAttribute("login");
			session.setAttribute("login", user);
			//3. 로그인 객체 있음 -> return true 반환 -> 요청 uri로 이동 
			return true;
		}else {
			response.sendRedirect("/photobook/login");	
		}//end
		return false;// 더이상 컨트롤러 요청으로 가지 않도록 false 반환
	}// preHandle() end

	
	@Override //postHandle() : 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {
		
		super.postHandle(request, response, handler, modelAndView);
	}

	
	
	
}// class End

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

//�α���ó�� ��� ���ͼ���
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Autowired
	UserService userService;
	
	@Override //preHandle() : ��Ʈ�ѷ����� ���� ����Ǵ� �޼���
	public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {

		//1. ���ǰ�ü��������
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("login");
		//2. �α����� �ȵǾ� �ִ� ��� -> login �������� �̵�
		if(user != null) { 
			user = userService.selectUser(user.getUser_no());
			session.removeAttribute("login");
			session.setAttribute("login", user);
			//3. �α��� ��ü ���� -> return true ��ȯ -> ��û uri�� �̵� 
			return true;
		}else {
			response.sendRedirect("/photobook/login");	
		}//end
		return false;// ���̻� ��Ʈ�ѷ� ��û���� ���� �ʵ��� false ��ȯ
	}// preHandle() end

	
	@Override //postHandle() : ��Ʈ�ѷ��� ����ǰ� ȭ���� �������� ������ ����Ǵ� �޼���
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {
		
		super.postHandle(request, response, handler, modelAndView);
	}

	
	
	
}// class End

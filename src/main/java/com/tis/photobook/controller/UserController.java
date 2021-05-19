package com.tis.photobook.controller;



import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tis.photobook.domain.UserImgsVO;
import com.tis.photobook.domain.UserProfilesVO;
import com.tis.photobook.domain.UsersVO;
import com.tis.photobook.dto.LoginDTO;
import com.tis.photobook.dto.UserFollowDTO;
import com.tis.photobook.service.LocalService;
import com.tis.photobook.service.UserService;



@RestController

public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	LocalService localService;
	
	@Autowired
	UserService userService;
	
	@Inject
	@Autowired
	ServletContext application;
	
	//==========================[ �α��� ]=============================/
	//�α��� ��
	@RequestMapping("/login")
	public ModelAndView loginForm() {
		logger.info("LoginForm!!{}",localService.TO_DATE_TIME());
		return new ModelAndView("user/login");
	}//end
	
	//�α���Ȯ�� �� ����ó��
	@RequestMapping("/loginCheck")
	public String login( LoginDTO dto, HttpSession session) throws Exception {
		String result = "";
		UsersVO user = userService.loginCheck(dto);
		if(user != null ) {
			if(user.getUser_pwd().equals(dto.getUser_pwd())) {
				user = userService.selectUser(user.getUser_no());
				session.removeAttribute("login");
				session.setAttribute("login",user);
				logger.info("���� ���� (user) :"+session.getAttribute("login"));
				result = "loginSuccess"; //�α��� ����
			}else {
				result = "differentPassword"; //�佺���� Ʋ��
			}
		}else {	
			result = "loginFail"; //�α��� ��������
		}
		
		return result;
	}//end
	
	//=========================[ �α׾ƿ� ]============================/
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) throws Exception {
		Object obj = session.getAttribute("login");
		if( obj != null ) {
			session.removeAttribute("login");
			session.invalidate();
		}//end
		return new ModelAndView("redirect:/");
	}
	
	//=========================[ ȸ������ ]============================/
	
	@RequestMapping("/join") //ȸ������ ��
	public ModelAndView joinForm() {
		logger.info("JoinForm!!{}",localService.TO_DATE_TIME());
		return new ModelAndView("user/join");
	}//end
	
	@PostMapping("/register") //ȸ������ - ���
	public String register(@RequestBody UsersVO user, HttpSession session) throws Exception { 
		userService.register(user);
		UsersVO User = userService.selectUserById(user.getUser_id());
		session.setAttribute("login", User);
		return "joinSuccess";
	}//end
	
	@PostMapping("/emailCheck") //ȸ������ - �̸��� �ߺ�Ȯ��
	public Map<String, Object> confirmEmail(@RequestBody String user_email ) throws Exception{
		logger.info("�̸��� �ߺ�Ȯ�� ��û : {}",user_email);
		Map<String, Object> data = new HashMap<>();
		
		int result = userService.isDuplicateEmail(user_email);
		
		if(result == 0) { 
			logger.info("�̸��� ��밡��!");
			data.put("confirm","OK");
		}else {
			logger.info("�ߺ��̸��� ���Ұ�!");
			data.put("confirm","NO"); 
		}return data;
	}//end
	
	@PostMapping("/idCheck") //ȸ������ - ���̵� �ߺ�Ȯ��
	public Map<String, Object> confirmId(@RequestBody String user_id ) throws Exception{
		logger.info("���̵� �ߺ�Ȯ�� ��û : {}",user_id);
		Map<String, Object> data = new HashMap<>();
		
		int result = userService.isDuplicateId(user_id);
		
		if(result == 0) { 
			logger.info("���̵� ��밡��!");
			data.put("confirm","OK");
		}else {
			logger.info("�ߺ����̵� ���Ұ�!");
			data.put("confirm","NO"); 
		}return data;
	}//end
	
	//=========================[ ȸ�� ������ ��� ]============================/
	
	@RequestMapping("/profile/{user_id}")//ȸ������ 2�ܰ� �����ʵ����  //���ǵ���ϱ�
	public ModelAndView joinUserProfileForm(@PathVariable String user_id, HttpSession session) throws Exception {
		
		session.getAttribute("login");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/profile");
		UsersVO user = userService.selectUserById(user_id);
		mv.addObject("user" , user);
		logger.info("--------------------------------------------------------");
		logger.info("registerProfileForm!!{}{}",user_id,localService.TO_DATE_TIME());
		Object obj = session.getAttribute("login");
		logger.info("user:"+obj);
		if( user != null && obj != null) {
			session.removeAttribute("login");
			session.setAttribute("login", user);
			logger.info("user: ���ǻ��� �� ����"+session.getAttribute("login"));
		}else if (user != null && obj == null) {
			session.setAttribute("login", user);
			logger.info("user: ���� ���� ���� "+session.getAttribute("login"));
		} else {

		}

		return mv;
	}//end	
	
	@PostMapping("/profile/uplodeImg")//�����ʻ��� ���ε� 
	public void uploadProfileImgGet(
		MultipartFile[] uploadFile, 
		@RequestParam("UserId") String user_id, 
		@RequestParam("UserNo") int user_no ) throws Exception {
			logger.info("update ajax Post... ");
			UserImgsVO uimg = new UserImgsVO();
			for(MultipartFile file : uploadFile ) {
			logger.info("-------------------------------------------------");
			logger.info("upload user Id  : "+ user_id);
			logger.info("upload File No  : "+ user_no);
			logger.info("upload File Name: "+ file.getOriginalFilename());
			logger.info("upload File Size: "+ file.getSize());			
			uimg.setUser_no(user_no);
			uimg.setFile(file);
			uimg.setImg_original_name(file.getOriginalFilename());
			}//end
			userService.uploadProfileImg(uimg);
	}//end
	
	@PostMapping("/profile/NameAndIntro")//������ �̸�&�Ұ� �μ�Ʈ
	public void insertProfileNameAndIntro(@RequestBody UserProfilesVO upfile) throws Exception {
		logger.info("Insert ajax Post... ");
		logger.info("-------------------------------------------------");
		logger.info("Insert user Id     : "+ upfile.getUser_id());
		logger.info("Insert user No     : "+ upfile.getUser_no());
		logger.info("Insert user Name   : "+ upfile.getUser_name());
		logger.info("Insert user Intro  : "+ upfile.getUser_intro());		
		userService.insertProfileNameAndIntro(upfile);
	}//end
	
	@RequestMapping("/user/{user_id}")//���� ������
	public ModelAndView user_page(@PathVariable String user_id, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/user_page");
		UsersVO user = userService.selectUserById(user_id);
				user = userService.selectUser(user.getUser_no());
		UsersVO ss_user = (UsersVO) session.getAttribute("login");
		UserFollowDTO dto = new UserFollowDTO();
		dto.setPassive_user_no(user.getUser_no());
		dto.setActive_user_no(ss_user.getUser_no());
		int checkFollow = userService.checkFollow(dto);
		mv.addObject("checkFollow" , checkFollow);
		mv.addObject("user" , user);
		logger.info("-------------------------------------------------");
		logger.info("registerProfileForm!!{}{}",user_id,localService.TO_DATE_TIME());
		logger.info("user:"+user);
		return mv;
	}//end
	
	@RequestMapping("/user/user_page_top")//���� ������
	public ModelAndView user_page_top(@RequestParam("userId") String user_id, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/user_page_top");
		UsersVO user = userService.selectUserById(user_id);
				user = userService.selectUser(user.getUser_no());
		UsersVO ss_user = (UsersVO) session.getAttribute("login");
		UserFollowDTO dto = new UserFollowDTO();
		dto.setPassive_user_no(user.getUser_no());
		dto.setActive_user_no(ss_user.getUser_no());
		int checkFollow = userService.checkFollow(dto);
		mv.addObject("checkFollow" , checkFollow);
		mv.addObject("user" , user);
		logger.info("-------------------------------------------------");
		logger.info("registerProfileForm!!{}{}",user_id,localService.TO_DATE_TIME());
		logger.info("user:"+user);
		return mv;
	}//end
	
	@RequestMapping("/user/add_follow")
	public void follow(@RequestParam("passive_userNo") int passive_user_no, @RequestParam("active_userNo") int active_user_no )throws Exception {
		logger.info("-------------------------------------------------");
		logger.info("Follow passive_user_no: {}, active_user_no: {} ",passive_user_no, active_user_no );
		UserFollowDTO dto = new UserFollowDTO();
		dto.setPassive_user_no(passive_user_no);
		dto.setActive_user_no(active_user_no);
		userService.addFollow(dto);
		
	}//end
	
	@RequestMapping("/user/delete_follow")
	public void unfollow(@RequestParam("passive_userNo") int passive_user_no, @RequestParam("active_userNo") int active_user_no )throws Exception {
		logger.info("-------------------------------------------------");
		logger.info("UnFollow passive_user_no: {}, active_user_no: {} ",passive_user_no, active_user_no );
		UserFollowDTO dto = new UserFollowDTO();
		dto.setPassive_user_no(passive_user_no);
		dto.setActive_user_no(active_user_no);
		userService.deleteFollow(dto);
	}//end

}//END
